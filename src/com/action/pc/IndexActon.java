package com.action.pc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.CaipiaoTypeDAO;
import com.pojo.CaipiaoType;
import com.service.admin.CaipiaoTypeBackService;

@Controller
@RequestMapping("/index.do")
public class IndexActon {
	
	@Autowired
	private CaipiaoTypeBackService  caipiaoTypeBackService;
	
	@Autowired
	private HttpServletRequest  request;
	
	
	@RequestMapping
	public String index()
	{
		List<CaipiaoType>  list = caipiaoTypeBackService.findAll();
		request.setAttribute("list", list);
		return "/main.jsp";
	}

}
