package com.action.pc;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.net.aso.f;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Jihuoma;
import com.service.pc.YongHuRegisterService;
import com.service.pc.YzmService;
import com.util.SmsUtil;

//验证码Action

@Controller
@RequestMapping("/register.do")
public class YzRegisterAction {
	
	@Autowired
	private YzmService yzmService;
	
	@Autowired
	private YongHuRegisterService yongHuRegisterService;
	
	
	//生成验证码并发送(注册模块)
	@RequestMapping(params="method=get")
	public void sendto(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
	    System.out.println("后台"); 
        String mobile=request.getParameter("iphone");
	
		
		List list=yongHuRegisterService.findByMobile(mobile);
	
		if (list.size()>0) {
			response.getWriter().print("false");
			return;
		}
		
		String code=SmsUtil.createCode(4);
		String content="您的验证码是"+code;
		System.out.println(content);
		yzmService.savecode(code, mobile);
		SmsUtil.send(mobile, content);
	}
	
	
	
	//验证验证码是否正确(注册)
		@ResponseBody
		@RequestMapping(params="method=code")
		private String doCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
			  
			    String code=request.getParameter("yzcode");
			    System.out.println(code+"adfadfa");
			    String mobile=request.getParameter("uname");
			    String mima=request.getParameter("mima");
			    System.out.println(mima);
				System.out.println("这是验证码"+code);
				List list=yzmService.findBycode(mobile, code);
				if(list.size()>0)
				{
					Jihuoma jihuoma=(Jihuoma) list.get(0);
					Timestamp timestamp=jihuoma.getTime();
					Date date=new Date();
					Timestamp cutimestamp=new Timestamp(date.getTime());
					if((cutimestamp.getTime()-timestamp.getTime())/(1000*60)<30)
					{
						yongHuRegisterService.zhuce(mobile, mima);
						return "1";
					
					}
					else
					{
						return "0";
						
					}	
				}
				else
				{
					return "0";
				}		
			}
	//生成验证码并发送(忘记密码模块)
	@RequestMapping(params="method=get2")
	public void sendto2(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
	    
		String mobile=request.getParameter("uname");
		System.out.println("电话"+mobile);
		List list=yongHuRegisterService.findByMobile(mobile);
		
		if (list.size()==0) {
			
			response.getWriter().print("false");
			return;
		}
		
		String code=SmsUtil.createCode(4);
		String content="您的验证码是"+code;
		System.out.println(content);
		yzmService.savecode(code, mobile);
		SmsUtil.send(mobile, content);
	}
	
	//验证验证码是否正确(忘记密码)
	@ResponseBody
	@RequestMapping(params="method=code2")
	private String doCode2(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  
		    String code=request.getParameter("yzcode");
		   
		    String mobile=request.getParameter("uname");
		   
			System.out.println("这是验证码"+code);
			List list=yzmService.findBycode(mobile, code);
			if(list.size()>0)
			{
				Jihuoma jihuoma=(Jihuoma) list.get(0);
				Timestamp timestamp=jihuoma.getTime();
				Date date=new Date();
				Timestamp cutimestamp=new Timestamp(date.getTime());
				if((cutimestamp.getTime()-timestamp.getTime())/(1000*60)<30)
				{
					request.getSession().setAttribute("resetPwd",true);
					return "1";
				
				}
				else
				{
					request.getSession().removeAttribute("resetPwd");
					return "0";
					
				}	
			}
			else
			{
				request.getSession().removeAttribute("resetPwd");
				return "0";
			}		
		}
	
	
}
