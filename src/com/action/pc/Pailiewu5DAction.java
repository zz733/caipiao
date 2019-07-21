package com.action.pc;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.admin.PailiewuService;

@Controller
@RequestMapping("/5d.do")
public class Pailiewu5DAction {

	@Autowired
	private PailiewuService pailiewuService;

	@Autowired
	private HttpServletRequest request;

	/** 业务：排列五直选,排列五的直选走势提供期号以及5个球的球号
	 * 字段：qishu, qiu1, qiu2,qiu3,qiu4,qiu5
	 */
	@RequestMapping(params = "p=get3d1")
	@ResponseBody
	public String get3d1() {
		String json = pailiewuService.paiwuzhixuan();
		return json;

	}

	/**业务：排列五的综合选,排列五的排五综合选，提供期号，1-5的球号，除3余0，除3余1，除3余2
	 *  字段：qishu, qiu1, qiu2,qiu3,qiu4,qiu5,chu3yu0,chu3yu1,chu3yu2
	 * */
	@RequestMapping(params = "p=get3d2")
	@ResponseBody
	public String get3d2() {
		String json = pailiewuService.paiwuzonghexuan();
		return json;

	}

	/** 业务：前排3组选,排列五的前排3组选 
	 *  字段：qishu, qiu1, qiu2,qiu3,kudu,hewei
	 * */
	@RequestMapping(params = "p=get3d3")
	@ResponseBody
	public String get3d3() {
		String json = pailiewuService.qianpaisanzuxuan();
		return json;
	}

	/** 业务：排列五的后三球组选
	 *  字段：qishu,qiu3,qiu4,qiu5 
	 *  */
	@RequestMapping(params = "p=get3d4")
	@ResponseBody
	public String get3d4() {
		String json = pailiewuService.housanzuxuan();
		return json;
	}
}
