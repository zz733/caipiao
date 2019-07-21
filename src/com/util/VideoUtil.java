package com.util;

import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.EncoderException;
import it.sauronsoftware.jave.InputFormatException;

import java.io.File;

public class VideoUtil {

	/**获取视频的时长*/
	public static String getVideoDuration(File source){
		//File source = new File(sourceStr);
		Encoder encoder = new Encoder();
		it.sauronsoftware.jave.MultimediaInfo m;
		String videoDuration=null;
		try {
			m = encoder.getInfo(source);
			videoDuration= m.getDuration()+"";
		} catch (InputFormatException e) {
			e.printStackTrace();
		} catch (EncoderException e) {
			e.printStackTrace();
		}
		return videoDuration;
	}
	
	public static String formatVideoDuration(long ls){
		String hourStr=null;
		String minuteStr=null;
		String secondsStr=null;
		
		//小时
		long hour=(ls / 3600000);
		if(hour<10){
			hourStr="0"+hour;
		}else{
			hourStr=hour+"";
			}
		
		//分钟
		long minute=(ls / 60000);
		if(minute<10){
			minuteStr="0"+minute;
		}else{
			minuteStr=minute+"";
		}
		
		//秒钟
		long seconds=(ls / 1000);
		if(seconds<10){
			secondsStr="0"+seconds;
		}else{
			secondsStr=seconds+"";
			}
		String videoDuration=hourStr+":"+minuteStr+":"+secondsStr;
		System.out.println("此视频时长为" + hourStr+":"+minuteStr+":"+secondsStr);
		return videoDuration;
	}
	
	
}
