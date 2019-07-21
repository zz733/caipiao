package com.alibaba.aliyun.oss;

import com.qikemi.packages.alibaba.aliyun.oss.properties.OSSClientProperties;

public interface Key {
	
	String KEY_ID = OSSClientProperties.key;
	String KEY_SECRET = OSSClientProperties.secret;
	String ENDPOINT=OSSClientProperties.ossCliendEndPoint;
	String BUNKET_NAME = OSSClientProperties.bucketName;
	String VIDEO_SERVER = OSSClientProperties.ossEndPoint;

}
