package com.action.pc;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pc.FindBlueService;

@Controller
@RequestMapping("/blue.do")
public class FindblueAction {
  
	@Autowired
	private FindBlueService findBlueService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(params="p=getBlue")
	@ResponseBody
	public String getBlue() {
		String json = findBlueService.getBlueJson();
		return json;
		
	}
}
