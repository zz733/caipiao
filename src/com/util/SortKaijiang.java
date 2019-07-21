package com.util;

import com.pojo.Kaijiang;

public class SortKaijiang implements java.util.Comparator<Object[]> {

	@Override
	public int compare(Object[] arg0, Object[] arg1) {
		Object o1 = arg0[0];
		Object o2 = arg1[0];
		return o1.toString().compareTo(o2.toString());
	}

	

}
