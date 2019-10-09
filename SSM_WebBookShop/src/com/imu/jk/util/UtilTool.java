package com.imu.jk.util;

import java.util.Date;

public class UtilTool {
	public static String getOnumber(){
		long L=new Date().getTime();
		double d=Math.random();
		String string=String.valueOf(d);
		return L+string.substring(4,10);
		
	}
}
