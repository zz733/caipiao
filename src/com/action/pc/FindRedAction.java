package com.action.pc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pc.FindRedService;

@Controller
@RequestMapping("/red.do")
public class FindRedAction {

	@Autowired
	private FindRedService findRedService;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping(params = "p=getRed")
	@ResponseBody
	public String getRed(HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Cache-Control","no-cache"); 
		String json = findRedService.getRedJson();
		return json;

	}
}
