package com.alibaba.aliyun.oss;

import com.aliyun.oss.ClientConfiguration;
import com.aliyun.oss.OSSClient;

public class OSSClientFactory {
	public static OSSClient create() {
		ClientConfiguration config = new ClientConfiguration();
		config.setSupportCname(true);
		
		OSSClient client = new com.aliyun.oss.OSSClient(Key.ENDPOINT,
				Key.KEY_ID, Key.KEY_SECRET, config);
		return client;
	}

	public static void closeClient(OSSClient client) {
		client.shutdown();
	}

}
