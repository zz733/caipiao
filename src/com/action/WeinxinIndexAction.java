package com.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import weixin.popular.api.MenuAPI;
import weixin.popular.api.UserAPI;
import weixin.popular.bean.EventMessage;
import weixin.popular.bean.MenuButtons;
import weixin.popular.bean.MenuButtons.Button;
import weixin.popular.bean.User;
import weixin.popular.util.ExpireSet;
import weixin.popular.util.XMLConverUtil;

import com.listener.WeixinGetAccessTokenListen;
import com.service.pc.UserinfoService;
import com.util.URLManager;

/**
 * 微信开发首页
 * 
 * @author lgh
 * 
 * 
 */
// 创建对象
@Controller
// 形成映射
@RequestMapping("/weixin.do")
public class WeinxinIndexAction {
	
	@Autowired
	private UserinfoService  userinfoService;

	// 重复通知过滤 时效60秒
	private static ExpireSet<String> expireSet = new ExpireSet<String>(60);

	@RequestMapping
	public String index(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		response.setContentType("text/html;charset=utf-8");
		System.out.println("来了没?");

		ServletInputStream inputStream = request.getInputStream();

		String echostr = request.getParameter("echostr");
		// 首次请求申请验证,返回echostr
		if (echostr != null) {
			response.getWriter().print(echostr);
			return null;
		}

		try {

			// 获取公众号ID
			EventMessage eventMessage = XMLConverUtil.convertToObject(
					EventMessage.class, inputStream);

			String msgType = eventMessage.getMsgType();
			System.out.println(msgType);
			String weixinhao = eventMessage.getFromUserName();
			System.out.println("微信号：" + weixinhao);
			UserAPI userAPI = new UserAPI();
			Integer flag = -1;
			User user = userAPI.userInfo(
					WeixinGetAccessTokenListen.access_token, weixinhao);
			addMenu(request);
			// ----------------- 关注和取消-----------------------
			if ("event".equals(msgType) && user != null) {

			}
			String userId = getUserId(eventMessage);
			System.out.println("userid:"+userId);
            if (userId!=null)
            {
            	//绑定微信
            	userinfoService.bindWeixin(weixinhao,userId);
            }
			// --------------------智能回答系统-----------------------------------
			if ("text".equals(msgType)) {
				/*
				 * String content = eventMessage.getContent(); //得到用户输入的内容
				 * System.out.println("用户发的消息："+content); List<AutoReply>
				 * autoReplayMsgList=autoReplyService.getAutoReply(content);
				 * List list = new ArrayList(); if (autoReplayMsgList!=null) {
				 * for (AutoReply autoReply : autoReplayMsgList) {
				 * NewsMessage.Article article = new
				 * NewsMessage.Article(autoReply.getAutoReplayMsg(), null, null,
				 * null); list.add(article); } NewsMessage message = new
				 * NewsMessage(weixinhao, list); MessageAPI messageAPI = new
				 * MessageAPI();
				 * messageAPI.messageCustomSend(WeixinGetAccessTokenListen
				 * .access_token, message); }else { TextMessage textMessage =
				 * new TextMessage(weixinhao,
				 * "没有找到“"+content+"”相关的信息，换个关键字试试吧！"); MessageAPI messageAPI =
				 * new MessageAPI();
				 * messageAPI.messageCustomSend(WeixinGetAccessTokenListen
				 * .access_token, textMessage); }
				 */
			}
			// -----------------------------------------------------------------

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 新增微信菜单
	 * 
	 * @param request
	 * @throws UnsupportedEncodingException
	 */
	private void addMenu(HttpServletRequest request)
			throws UnsupportedEncodingException {
		// -----------------------菜单一选项--------------------
		Button btnOne = new Button();// 第一个按钮
		btnOne.setType("click");
		btnOne.setName("我的账户");
		btnOne.setKey("MENU_ONE");

		// 1.1
		Button btnOne1 = new Button();
		btnOne1.setType("view");
		btnOne1.setName("呦~注册");
		String url = URLManager.getServerURL(request)
				+ "/weixin_zhuce.do?w=weixin_zhuceschool";
		String appid = WeixinConfig.APPID;
		String newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ appid
				+ "&redirect_uri="
				+ URLEncoder.encode(url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnOne1.setUrl(newUrl);// 两个不同的浏览器 session不一样 .do有缓存
		// 1.2
		Button btnOne2 = new Button();
		btnOne2.setName("呦~抽奖");
		btnOne2.setType("view");
		String url2 = URLManager.getServerURL(request)
				+ "/weixinchoujiang.do?method=weixinchoujiang";
		// String appid = WeixinConfig.APPID;
		String newUrl2 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url2, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnOne2.setUrl(newUrl2);
		// 1.3
		Button btnOne3 = new Button();
		btnOne3.setName("呦~新闻");
		btnOne3.setType("view");
		String recorder_url = URLManager.getServerURL(request)
				+ "/newsIndex.do?method=findAll";
		String recorder_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(recorder_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnOne3.setUrl(recorder_newUrl);

		List<Button> list1 = new ArrayList<Button>();
		list1.add(btnOne1); // cosplay
		list1.add(btnOne2); // 才艺PK
		list1.add(btnOne3); // 动漫
		btnOne.setSub_button(list1);// 将list1中的内容封装在btnOne的一级菜单中

		// Button btnOne4 = new Button();
		// btnOne4.setType("view");
		// btnOne4.setName("联系我们");
		// String url4 = URLManager.getServerURL(request)
		// + "/lianxiUs.do?method=weixin";
		// String appid4 = WeixinConfig.APPID;
		// String newUrl4 =
		// "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
		// + appid4
		// + "&redirect_uri="
		// + URLEncoder.encode(url4, "utf-8")
		// + "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		// btnOne4.setUrl(newUrl4);// 两个不同的浏览器 session不一样 .do有缓存

		// -------------菜单二选项--------------
		// 第二个按钮 一级
		Button btnTwo = new Button();// 第二个按钮
		btnTwo.setType("click");
		btnTwo.setName("福彩中心");
		btnTwo.setKey("MENU_TWO");
		// 2.1
		Button btnTwo1 = new Button();
		btnTwo1.setType("view");
		btnTwo1.setName("呦~首页");
		String jyz_url = URLManager.getServerURL(request)
				+ "/weixinhome.do?method=gotohome";
		String jyz_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(jyz_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnTwo1.setUrl(jyz_newUrl);// 两个不同的浏览器 session不一样 .do有缓存

		// 2.2
		Button btnTwo2 = new Button();
		btnTwo2.setName("呦~APP");
		btnTwo2.setType("view");
		String oprice_newurl = URLManager.getServerURL(request)
				+ "/zhengcejiedu.do?method=zhengcejiedu";
		String zc_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(oprice_newurl, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnTwo2.setUrl(zc_newUrl);

		// // 2.3
		// Button btnTwo3 = new Button();
		// btnTwo3.setName("理财推荐");
		// btnTwo3.setType("view");
		// String wyjy_url = URLManager.getServerURL(request)
		// + "/weixinlicai.do?method=findlicai";
		//
		// String wyjy_newurl =
		// "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
		// + WeixinConfig.APPID
		// + "&redirect_uri="
		// + URLEncoder.encode(wyjy_url, "utf-8")
		// + "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		// btnTwo3.setUrl(wyjy_newurl);
		// //2.4
		// Button btnTwo4 = new Button();
		// btnTwo4.setName("国湘商城");
		// btnTwo4.setType("view");
		// String weishop_url = URLManager.getServerURL(request)
		// + "/mall.do?method=toMall";
		//
		// String weishop_url_newurl =
		// "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
		// + WeixinConfig.APPID
		// + "&redirect_uri="
		// + URLEncoder.encode(weishop_url, "utf-8")
		// + "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		// btnTwo4.setUrl(weishop_url_newurl);

		List<Button> list2 = new ArrayList<Button>();
		list2.add(btnTwo1); // 通知
		list2.add(btnTwo2); // 校园
		btnTwo.setSub_button(list2);

		// -------菜单选项三-------------
		Button btnThree = new Button();// 第三个按钮
		btnThree.setType("click");
		btnThree.setName("福利回报");
		btnThree.setKey("MENU_THREE");

		// 3.1
		Button btnThree1 = new Button();
		btnThree1.setType("view");
		btnThree1.setName("呦~活动");
		String on_url = URLManager.getServerURL(request)
				+ "/shebao.do?method=chaxun";
		String on_newurl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(on_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnThree1.setUrl(on_newurl);

		Button btnThree2 = new Button();
		btnThree2.setType("view");
		btnThree2.setName("呦~奖励");
		String khrz_url = URLManager.getServerURL(request)
				+ "/user.do?method=renzheng";
		String khrz_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(khrz_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnThree2.setUrl(khrz_newUrl);

		Button btnThree3 = new Button();
		btnThree3.setType("view");
		btnThree3.setName("呦~分享");
		String buy_url = URLManager.getServerURL(request)
				+ "/baoxian.do?method=baoxian";
		String buy_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(buy_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnThree3.setUrl(buy_newUrl);

		Button btnThree4 = new Button();
		btnThree4.setType("view");
		btnThree4.setName("呦~申请");
		String baoxian_url = URLManager.getServerURL(request)
				+ "/tijian.do?method=findAllCitys";
		String baoxian_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(baoxian_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnThree4.setUrl(baoxian_newUrl);

		List<Button> list3 = new ArrayList<Button>();
		list3.add(btnThree1);// 个人中心
		list3.add(btnThree2); // 租售
		list3.add(btnThree3); // 商家
		list3.add(btnThree4); // 代理申请
		btnThree.setSub_button(list3);

		List list = new ArrayList(); // 多个menu集合

		list.add(btnOne);
		list.add(btnTwo);
		list.add(btnThree);
		MenuButtons menus = new MenuButtons();
		Button[] arrayButton = new Button[list.size()];
		list.toArray(arrayButton);// list转为数组（类型为Button）
		menus.setButton(arrayButton);
		new MenuAPI()
				.menuCreate(WeixinGetAccessTokenListen.access_token, menus);

	}

	public String getUserId(EventMessage eventMessage) throws IOException {
		String Ticket = eventMessage.getTicket();
		String eventKey = eventMessage.getEventKey();
        //System.out.println("ticket:"+Ticket);
        //System.out.println("eventkey:"+eventKey);
		if (Ticket != null && eventKey != null) {
			String[] key = eventKey.split("_");
			if (key.length > 1) {
				String id = key[1]; // 会员编号
				return id;

			}
			else
			{
				String id = eventKey;
				return id;
			}

		}
		return null;
	}

}
