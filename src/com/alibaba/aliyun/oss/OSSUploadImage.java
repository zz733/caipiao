package com.alibaba.aliyun.oss;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.AccessControlList;
import com.aliyun.oss.model.CompleteMultipartUploadRequest;
import com.aliyun.oss.model.InitiateMultipartUploadRequest;
import com.aliyun.oss.model.InitiateMultipartUploadResult;
import com.aliyun.oss.model.ObjectMetadata;
import com.aliyun.oss.model.PartETag;
import com.aliyun.oss.model.PutObjectResult;
import com.aliyun.oss.model.UploadPartRequest;
import com.aliyun.oss.model.UploadPartResult;
import com.qikemi.packages.alibaba.aliyun.oss.properties.OSSClientProperties;

/**
 * 上传文件到 oss
 */
public class OSSUploadImage extends Thread {

	static String url;

	private static String newFileName;
	private static File uploadName;

	public OSSUploadImage(final String newFileName, final File uploadName) {
		this.newFileName = newFileName;
		this.uploadName = uploadName;
	}

	@Override
	public void run() {
		upload(newFileName, uploadName);
	}

	/**
	 * 文件上传
	 * 
	 * @param newFileName
	 *            视频服务器新文件名，可以含路径如 videos/goodsVideo/a.mp4
	 * @param uploadName
	 *            要上传的源文件
	 * @return 访问的url,用于测试
	 * 
	 *         Thread
	 */
	public static String upload(final String newFileName, final File uploadName) {
		OSSClient ossClient = OSSClientFactory.create();
		ObjectMetadata meta = new ObjectMetadata();
		meta.setContentType("video/mp4");
		meta.setContentLength(MAX_PRIORITY);
		PutObjectResult result = ossClient.putObject(Key.BUNKET_NAME, newFileName, uploadName, meta);
		AccessControlList accs = ossClient.getBucketAcl(Key.BUNKET_NAME);
		if (accs.getGrants().isEmpty()) {
			Calendar c = Calendar.getInstance();
			c.add(Calendar.YEAR, 50);
			URL _url = ossClient.generatePresignedUrl(Key.BUNKET_NAME,
					Key.ENDPOINT, c.getTime());
			url = _url.getPath();
		} else
			url = String.format("%s/%s", Key.VIDEO_SERVER, newFileName);
		ossClient.shutdown();
		return url;
	}
	
	/**上传图片*/
	public static String uploadImage(final String newFileName, final File uploadName) {
		OSSClient ossClient = OSSClientFactory.create();
		ObjectMetadata meta = new ObjectMetadata();
		meta.setContentType("image/png");
		meta.setContentLength(MAX_PRIORITY);
		PutObjectResult result = ossClient.putObject(Key.BUNKET_NAME,newFileName, uploadName, meta);
		AccessControlList accs = ossClient.getBucketAcl(Key.BUNKET_NAME);
		if (accs.getGrants().isEmpty()) {
			Calendar c = Calendar.getInstance();
			c.add(Calendar.YEAR, 50);
			URL _url = ossClient.generatePresignedUrl(Key.BUNKET_NAME,
					Key.ENDPOINT, c.getTime());
			url = _url.getPath();
		} else
			url = String.format("%s/%s", Key.VIDEO_SERVER, newFileName);
		ossClient.shutdown();
		return url;
	}

	public static void upload(String newFileName, InputStream uploadStream) {
		OSSClient ossClient = OSSClientFactory.create();
		ossClient.putObject(Key.BUNKET_NAME, newFileName, uploadStream);
		ossClient.shutdown();
	}

	/**
	 * 删除视频
	 * 
	 * @param fileName
	 *            完整视频路径
	 */
	public static void delImage(String fileName) {
		OSSClient ossClient = OSSClientFactory.create();
		ossClient.deleteObject(Key.BUNKET_NAME, fileName);
		ossClient.shutdown();
	}
	public static void main(String[] args) {
		String url = OSSUploadImage.upload("hanfu.mp4", new File("C:/Users/冯莎娜/Desktop/WX-gzh/hanfu.mp4"));
		System.out.println(url);
	}
}
