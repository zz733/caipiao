package com.util;

public class MathUtil {
	
	/**
	 * 求最大数
	 * @param data
	 * @return
	 */
	public static int max(int ...data)
	{
		int max = Integer.MIN_VALUE;
		for (int i:data)
		{
			if (i>max)
				max = i;
		}
		return max;
	}
	
	/**
	 * 求最小数
	 * @param data
	 * @return
	 */
	public static int min(int ...data)
	{
		int min = Integer.MAX_VALUE;
		for (int i:data)
		{
			if (i<min)
				min = i;
		}
		return min;
	}
	
	/**
	 * 是否素数
	 * @param n
	 * @return
	 */
	public static boolean isPrime(int n)
	{
		if (n<=1) return false;
		boolean is = true;
		int m = (int) Math.sqrt(n);
	    for (int i=2;i<=m;i++)
	    {
	       if (n%i==0)
	       {
	    	   is = false;
	    	   break;
	       }
	    }
		
	    return is;
	}
	
	/**
	 * 是合数 
	 * @param n
	 * @return
	 */
	public static boolean isHeshu(int n)
	{
		if (n>=4 && isPrime(n)==false)
			return true;
		return false;
	}
	
	/**
	 * 奇数
	 * @param n
	 * @return
	 */
	public static boolean isOdd(int n)
	{
		return n%2==1;
	}
	
	/**
	 * 是偶数
	 * @param n
	 * @return
	 */
	public static boolean isEven(int n)
	{
		return n%2==0;
	}
	
	/**
	 * 除3余0个数
	 * @param data
	 * @return
	 */
	public static short chu3yu0_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (i%3==0)
				sum++;
		}
		return sum;
	}
	
	/**
	 * 除3余1个数
	 * @param data
	 * @return
	 */
	public static short chu3yu1_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (i%3==1)
				sum++;
		}
		return sum;
	}
	
	/**
	 * 除3余2个数
	 * @param data
	 * @return
	 */
	public static short chu3yu2_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (i%3==2)
				sum++;
		}
		return sum;
	}
	
    /**
     * 大数个数>=5	
     * @param data
     * @return
     */
	public static short dashu_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (i>=5)
				sum++;
		}
		return sum;
	}
	
	/**
	 * 小数个数
	 * @param data
	 * @return
	 */
	public static short xiaoshu_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (i<=4)
				sum++;
		}
		return sum;
	}
	
	/**
	 * 和尾
	 * @param data
	 * @return
	 */
	public static short hewei(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			sum+=i%10;
		}
		return sum;
	}
	
	/**
	 * 质数个数
	 * @param data
	 * @return
	 */
	public static short prime_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (isPrime(i))
				sum ++;
		}
		return sum;
	}
	
	/**
	 * 合 数个数
	 * @param data
	 * @return
	 */
	public static short heshu_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (isHeshu(i))
				sum ++;
		}
		return sum;
	}
	
	/**
	 * 奇数个数
	 * @param data
	 * @return
	 */
	public static short jishu_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (isOdd(i))
				sum ++;
		}
		return sum;
	}

	/**
	 * 偶数个数
	 * @param data
	 * @return
	 */
	public static short even_count(int ...data)
	{
		short sum = 0;
		for (int i:data)
		{
			if (isEven(i))
				sum ++;
		}
		return sum;
	}


}
