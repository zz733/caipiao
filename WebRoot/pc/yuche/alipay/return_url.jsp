<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.service.pc.YucheService"%>

<head>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/zhuce.css"  type="text/css">
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/pc/css/bootstrap.min.css" />
 <script type="text/javascript" src="${pageContext.request.contextPath}/pc/lib/jquery/1.9.1/jquery.min.js"></script> 
	 
	 	<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/admin/lib/static/h-ui.admin/js/H-ui.admin.js"></script>
       		<link rel="stylesheet"
				href="${pageContext.request.contextPath }/pc/css/mui.min.css" />
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/pc/js/jquery.min.js"></script>
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/pc/css/bootstrap.min.css" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/pc/css/gongyijingcai.css" />
			<script src="${pageContext.request.contextPath }/pc/js/mui.min.js"></script>

			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css"
				id="skin" />
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />


			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>

			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath }/admin/lib/laypage/1.2/laypage.js"></script>
		
</head>
<%
/* *
 功能：支付宝页面跳转同步通知页面
 版本：3.2
 日期：2011-03-17
 说明：
 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 //***********页面功能说明***********
 该页面可在本机电脑测试
 可放入HTML等美化页面的代码、商户业务逻辑程序代码
 TRADE_FINISHED(表示交易已经成功结束，并不能再对该交易做后续操作);
 TRADE_SUCCESS(表示交易已经成功结束，可以对该交易做后续操作，如：分润、退款等);
 
 http://1yagw.com/pay/alipay/return_url.jsp?buyer_email=3815228%40qq.com&buyer_id=2088202207543317&exterface=create_direct_pay_by_user&is_success=T&notify_id=RqPnCoPT3K9%252Fvwbh3InSMaSdOtSlKrPppLUKBepAuzHBKXy6tOmYIamZ9UK57bjHRHXO&notify_time=2015-07-25+16%3A18%3A08&notify_type=trade_status_sync&
 out_trade_no=f713f2884ec312ad014ec449da350011&payment_type=1&seller_email=282094998%40qq.com&seller_id=2088021007471675&subject=%E4%B8%80%E5%85%83%E7%88%B1%E8%B4%AD&
 total_fee=1.00&trade_no=2015072500001000310057339727&trade_status=TRADE_SUCCESS&sign=1267be77069f2fdab86d5bceee326a86&sign_type=MD5
 //********************************
 * */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="com.alipay.config.*"%>
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>支付宝页面跳转同步通知页面</title>
  </head>
  <body>
<%
	//ApplicationContext context=WebApplicationContextUtils.getWebApplicationContext(application);
	
	//YucheService yucheService=(YucheService)context.getBean(YucheService.class);

	//获取支付宝GET过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map requestParams = request.getParameterMap();
	for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
	//商户订单号

	String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

	//支付宝交易号

	String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

	//交易状态
	String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
 //获取返回的金额
   String price = new String(request.getParameter("total_fee").getBytes("ISO-8859-1"),"UTF-8");
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
	
	
	System.out.println("QQQQQ来了");
	//计算得出通知验证结果
	boolean verify_result = AlipayNotify.verify(params);
	
	if(verify_result){//验证成功
		//////////////////////////////////////////////////////////////////////////////////////////
		//请在这里加上商户的业务逻辑程序代码

		//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
		if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
			//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
		}
		
				//修改订单状态
		//System.out.println("price="+price);
		Double money = Double.parseDouble(price);
		//String payr = dailiAlipayService.updateVIPStatus(out_trade_no,money);
		
		//out.println("<h1>支付成功!!<a href='"+request.getContextPath()+"/'>返回主界面</a></h1>");
			  //response.setHeader("refresh","2;url='"+request.getContextPath()+"'");
		
		//该页面可做页面美工编辑
		//out.println("验证成功<br />");
		
      
          //IndentServices  indentServices=(IndentServices)applicationContext.getBean("indentServices");
          //indentServices.updateIndentpaystatus(out_trade_no,price);
       
		    
       //request.getRequestDispatcher("/yuche.do?p=showByOrder&id="+out_trade_no).forward(request,response);
	
		//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——+
       
		//////////////////////////////////////////////////////////////////////////////////////////
	}else{
		//该页面可做页面美工编辑
		out.println("支付失败");
	}
%>
  </body>
</html>


<script>
   var money = '<%=price%>';
   var orderId = '<%=out_trade_no%>';
   if ('<%=verify_result%>'=="true")
   {
   
      	$.ajax(
      	 {
			type: "post",
			url: "${pageContext.request.contextPath}/yuche.do?p=payCheck&money="+money+"&id="+orderId+"&yid=${param.yid}",
			success:function(data){
			     
			    if(data!="error")
                {
           		 
                
                      var json = eval("("+data+")");
					  layer.open( 
					    {
							title : json.caipiaoType.name+ "第"+ json.caipiaoQishu+ "期预测",
																		//skin : 'layui-layer-rim', //加上边框
							area : [
									'900px',
									'600px' ], //宽高
							content : json.neirong,
							type : 1
								});
					  
                 
               }
			}
		});  
   
   }
</script>