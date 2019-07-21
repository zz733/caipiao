package com.action.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/logo.do")
public class LOGOAction {
	@Autowired
	private HttpServletRequest request;

	@ResponseBody
	@RequestMapping(params = "p=updateLOGO")
	public String updateLOGO() throws IOException {

		System.out.println("来了");
		// 从 /temp复制到 /pc/img

		String file = request.getParameter("file");
		// FileCopy.copy(request, "/temp", "/pc/img", file);

		// 得到后辍名
		int index = file.lastIndexOf('.');
		String extName = file.substring(index);
		String newName = "logo_sm" + extName;
		System.out.println(newName);
		// 临时上传目录
		String oldDirectory = request.getSession().getServletContext()
				.getRealPath("/temp");
		String newDirectory = request.getSession().getServletContext()
				.getRealPath("/pc/img");
		System.out.println(oldDirectory);
		System.out.println(newDirectory);
		File file1 = new File(oldDirectory + "/" + file);
		File file2 = new File(newDirectory + "/" + newName);
		byte[] b = new byte[(int) file1.length()];
		FileInputStream in = null;
		FileOutputStream out = null;
		try {
			in = new FileInputStream(file1);
			out = new FileOutputStream(file2);// 没有指定文件则会创建
			while (in.read(b) != -1) { // read()--int，-1表示读取完毕
				out.write(b);
			}
			out.flush();
			in.close();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return "OK";
	}

	// 背景图
	@ResponseBody
	@RequestMapping(params = "p=updateBeijingtu")
	public String updateBeijingtu() throws IOException {

		System.out.println("来了");
		// 从 /temp复制到 /pc/img

		String file = request.getParameter("file");
		// FileCopy.copy(request, "/temp", "/pc/img", file);

		// 得到后辍名
		int index = file.lastIndexOf('.');
		String extName = file.substring(index);
		String newName = "beijingtu" + extName;
		System.out.println(newName);
		// 临时上传目录
		String oldDirectory = request.getSession().getServletContext()
				.getRealPath("/temp");
		String newDirectory = request.getSession().getServletContext()
				.getRealPath("/pc/img");
		System.out.println(oldDirectory);
		System.out.println(newDirectory);
		File file1 = new File(oldDirectory + "/" + file);
		File file2 = new File(newDirectory + "/" + newName);
		byte[] b = new byte[(int) file1.length()];
		FileInputStream in = null;
		FileOutputStream out = null;
		try {
			in = new FileInputStream(file1);
			out = new FileOutputStream(file2);// 没有指定文件则会创建
			while (in.read(b) != -1) { // read()--int，-1表示读取完毕
				out.write(b);
			}
			out.flush();
			in.close();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return "OK";
	}
}
