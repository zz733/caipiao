package com.action.pc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.pc.Daletou_FindBlueService;
import com.service.pc.Daletou_FindRedService;

@Controller
@RequestMapping("/daletou.do")
public class Daletou_Action {
	
	@Autowired
	private Daletou_FindRedService daletou_FindRedService;
	
	@Autowired
	private Daletou_FindBlueService daletou_FindBlueService;
	
	@Autowired
	private HttpServletRequest request;

	/** 业务：红球的前区走势/区间走势/前区位置走势 */
	@RequestMapping(params = "p=get3d1")
	@ResponseBody
	public String get3d1() {
		String json = daletou_FindRedService.get3d1();
		return json;

	}
	
	@RequestMapping(params = "p=get3d2")
	@ResponseBody
	public String get3d2() {
		String json = daletou_FindRedService.get3d2();
		return json;

	}
	
	/**业务：红球的尾数走势*/
	@RequestMapping(params = "p=get3d3")
	@ResponseBody
	public String get3d3() {
		String json = daletou_FindRedService.get3d3();
		return json;

	}
	
	/**业务：蓝球的后区走势*/
	@RequestMapping(params = "p=get3d4")
	@ResponseBody
	public String get3d4() {
		String json = daletou_FindBlueService.getBlueJson();
		return json;

	}
}

