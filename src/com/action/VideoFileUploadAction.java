package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/videoupload.do")
public class VideoFileUploadAction {
	/**
	 * 上传到临时目录
	 * 
	 * @param file
	 * @param response
	 * @return video
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(params = "p=upload")
	@ResponseBody
	public String upload(String filename, HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException,
			IOException {
		String path = request.getSession().getServletContext()
				.getRealPath("/temp");
		File pathFile = new File(path);
		if (pathFile.exists() == false)// 如果不存在的话
			pathFile.mkdir();// 就新建一个

		String newName = newName(filename); // 新的文件
		System.out.println("返回的新的名称：" + newName);

		copyFileToDir(path, new File(path + "/" + newName), newName); // 上传到临时目录
		return newName;
	}

	// 产生新的文件名 a.png
	private String newName(String oldName) {
		int index = oldName.lastIndexOf(".");
		String extName = oldName.substring(index);// 得后辍名
		return System.currentTimeMillis() + extName;
	}

	public static void copyFileToDir(String toDir, File file, String newName) {// 复制文件到指定目录
		String newFile = "";
		if (newName != null && !"".equals(newName)) {
			newFile = toDir + "/" + newName;
		} else {
			newFile = toDir + "/" + file.getName();
		}
		File tFile = new File(newFile);
		copyFile(tFile, file);// 调用方法复制文件
	}

	public static void copyFile(File toFile, File fromFile) {// 复制文件
		if (toFile.exists()) {// 判断目标目录中文件是否存在
			System.out.println("文件" + toFile.getAbsolutePath() + "已经存在，跳过该文件！");
			return;
		} else {
			createFile(toFile, true);// 创建文件
		}
		System.out.println("复制文件" + fromFile.getAbsolutePath() + "到"+ toFile.getAbsolutePath());
		try {
			InputStream is = new FileInputStream(fromFile);// 创建文件输入流
			FileOutputStream fos = new FileOutputStream(toFile);// 文件输出流
			byte[] buffer = new byte[1024];// 字节数组
			while (is.read(buffer) != -1) {// 将文件内容写到文件中
				fos.write(buffer);
			}
			is.close();// 输入流关闭
			fos.close();// 输出流关闭
		} catch (FileNotFoundException e) {// 捕获文件不存在异常
			e.printStackTrace();
		} catch (IOException e) {// 捕获异常
			e.printStackTrace();
		}
	}

	public static void createFile(String path, boolean isFile) {// 创建文件或目录
		createFile(new File(path), isFile);// 调用方法创建新文件或目录
	}

	public static void createFile(File file, boolean isFile) {// 创建文件
		if (!file.exists()) {// 如果文件不存在
			if (!file.getParentFile().exists()) {// 如果文件父目录不存在
				createFile(file.getParentFile(), false);
			} else {// 存在文件父目录
				if (isFile) {// 创建文件
					try {
						file.createNewFile();// 创建新文件
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					file.mkdir();// 创建目录
				}
			}
		}
	}

}
