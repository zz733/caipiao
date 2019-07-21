package com.action.pc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pc.FindRedService;

/**
 * 3d
 * @author lgh
 *
 */

@Controller
@RequestMapping("/3d.do")
public class ShangDActoin {
	
	@Autowired
	private FindRedService  findRedService;
	
	@Autowired
	private HttpServletRequest request;

	@RequestMapping(params = "p=get3d1")
	@ResponseBody
	public String get3d1() {
		String json = findRedService.get3d1();
		return json;

	}
	

	@RequestMapping(params = "p=get3d2")
	@ResponseBody
	public String get3d2() {
		String json = findRedService.get3d2();
		return json;

	}
}
