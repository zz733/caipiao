package com.task;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class SSQDataTask {

    private static final String UA_PHONE = "Mozilla/5.0 (Linux; Android 4.3; Nexus 10 Build/JSS15Q) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.23 Safari/537.36";
    private static final String UA_PC = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36";
    private static final int TIME_OUT = 10 * 1000;

    public static class RecordEntity {
        private String issue; //期号
        private String redBall;      //红球 `,`分隔
        private String blueBall;     //蓝球 `,`分隔
		public String getIssue() {
			return issue;
		}
		public void setIssue(String issue) {
			this.issue = issue;
		}
		public String getRedBall() {
			return redBall;
		}
		public void setRedBall(String redBall) {
			this.redBall = redBall;
		}
		public String getBlueBall() {
			return blueBall;
		}
		public void setBlueBall(String blueBall) {
			this.blueBall = blueBall;
		}
		@Override
		public String toString() {
			return "RecordEntity [issue=" + issue + ", redBall=" + redBall + ", blueBall=" + blueBall + "]";
		}
        
    }
    /*挖掘数据*/
    public static List<RecordEntity> cavasData(String address) throws Exception{
        Document document = Jsoup.connect(address).userAgent(UA_PC).timeout(TIME_OUT).ignoreContentType(true).get();
        Elements elements = document.select("tr[data-period]");
        List<RecordEntity> recordRedisEntities = new ArrayList<SSQDataTask.RecordEntity>();
        for (Element t : elements) {
            String data_period = t.attr("data-period"); //2014012
            String data_award = t.attr("data-award");   //01 08 11 19 21 24:08
            String[] colorBall = data_award.split(":");
            RecordEntity recordEntity = new RecordEntity();
            recordEntity.setIssue(data_period);
            recordEntity.setBlueBall(colorBall[1]);
            recordEntity.setRedBall(colorBall[0].replace(" ","-"));
            recordRedisEntities.add(recordEntity);
		}
        return recordRedisEntities;
    }
    /**
     *  第一次初始化数据库
     * @param recentIssue 需要加载到数据库的集合
     * @return 从大到小的集合
     * @throws Exception
     */
    public static List<RecordEntity> first(String recentIssue) throws Exception{
    	if(recentIssue!=null) if(recentIssue.equals(last(false,recentIssue)))return null;
    	List<RecordEntity> recordEntities = new ArrayList<SSQDataTask.RecordEntity>();
        int minYear = 2014;
//        int currentYear = LocalDateTime.now().getYear();
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);
        while(currentYear>=minYear){
        	boolean isCanAdd = false;
            String ip = "http://trend.caipiao.163.com/trend/ssq_historyPeriod.html?year="+currentYear--;
            List<RecordEntity> cavasData = cavasData(ip);
            for (RecordEntity recordEntity : cavasData) {
				if (recentIssue.equals(recordEntity.getIssue())) {
					isCanAdd = true;
					continue;
				}
				if(isCanAdd) recordEntities.add(recordEntity);
			}
            Collections.reverse(cavasData);
            Thread.sleep(1000);
        }
        return recordEntities;
    }
    static final int remainingCount = 1;//60; //剩余次数 60*60*1000/10000=60次
    /**
     * 定时任务的调度
     * @param recentIssue  数据库中最大的期数号码
     * @return 需要添加到数据库中的一期的数据
     * @throws Exception
     */
    public static RecordEntity last(boolean isNeedPersistent,String recentIssue) throws Exception{
        System.out.println("开始爬取双色球记录数据============================================>");
        List<RecordEntity> recentRecordEntities;
        int waitCount = 0;
        boolean isAddOK = false;
        while(!isAddOK){
            if (++waitCount>=remainingCount)isAddOK=true; //超过5分钟没有抓取到数据 1*5*60秒 / 10秒
            String ip = "http://trend.caipiao.163.com/trend/ssq_historyPeriod.html";
            recentRecordEntities = cavasData(ip);
            if (!isNeedPersistent)return recentRecordEntities.get(recentRecordEntities.size()-1); //如果不需要返回数据，就是直接返回最近一期的期号
            Collections.reverse(recentRecordEntities);
            RecordEntity lastRecordEntity = recentRecordEntities.get(1);
            if (lastRecordEntity.getIssue().equals(recentIssue)){
            	return recentRecordEntities.get(0);
            }
            Thread.sleep(10000);
            System.out.println("暂未抓取到数据十秒钟后继续重试,剩余次数为:"+(remainingCount-waitCount));
        }
        return null;
    }
	
    @Scheduled(cron = "0 31 21 * * TUE,THU,SUN")
    public void colorBallDataTask() throws Exception{
    	String recentIssue = "从数据库查找数据";
    	RecordEntity last = last(true,recentIssue);
    	//将last数组保存到数据库中
    }
    
    public static void testFirst() throws Exception{
    	String recentIssue = "2017138";
    	List<RecordEntity> first = first(recentIssue);
    	if(first==null){
    		System.out.println("空");
    	}else{
        	for (RecordEntity recordEntity : first) {
        		System.out.println("=="+recordEntity);
        	}
    	}
    }
    

    public static void testLast() throws Exception{
    	String recentIssue = "2017138";
    	RecordEntity last = last(true,recentIssue);
    	if(last==null){
    		System.out.println("空");
    	}else{
    		System.out.println("=="+last);
    	}
    }
    public static void main(String[] args) throws Exception {
    	testFirst();
    	
	}
}























