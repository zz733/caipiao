package com.service.pc;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.dao.HQLDAO;

@Service
public class TaskService {
	
	@Autowired
	private HQLDAO  hqldao;
	
	/**
	 * 每隔10分钟删除预测未支付订单
	 */
	@Scheduled(cron="0 0 4 * * ?")
	public void removeNoPayYucheOrder()
	{
		String hql  = "delete from YucheOrder where  zonjiang=-1 and time<? ";
		long t = System.currentTimeMillis()- 10*60*60*1000;
	    Timestamp timestamp = new Timestamp(t);
	    //System.out.println("删除了");
	    hqldao.bulkUpdate(hql, timestamp);
	}

}
