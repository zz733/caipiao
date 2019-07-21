package com.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * 通用文件上传  
 * @author lgh
 *
 */
@Controller
@RequestMapping("/upload.do")
public class FileUploadAction {
	/**
	 * 上传到临时目录
	 * @param file
	 * @param response
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping
	@ResponseBody
	public String upload(@RequestParam MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException
	{
		String path = request.getSession().getServletContext().getRealPath("/temp");
		File pathFile=new File(path);
    	if(pathFile.exists()==false)//如果不存在的话
			pathFile.mkdir();//就新建一个
		String oldName = file.getOriginalFilename();//旧的文件名
		String newName = newName(oldName); //新的文件
		file.transferTo(new File(path+"/"+newName)); //上传到临时目录
		return newName;
	}
	  
	//产生新的文件名 a.png
	private String newName(String oldName)
	{
		int index = oldName.lastIndexOf(".");
		String extName = oldName.substring(index);//得后辍名
		return System.currentTimeMillis()+extName;
	}

}
