package cn.bgs.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/** * @author  malimei
 * @date 创建时间：2019年2月28日 下午10:36:28 
* @version 1.0 
* @parameter  
* @since  
* @return  
*/
public class MD5Utils {
	 /**
     * 使用md5的算法进行加密
     */
    public static String md5(String PWD) {
       byte[] secretBytes = null;
       try {
    	  // MessageDigest 类为应用程序提供信息摘要算法的功能，如 MD5 或 SHA 算法。
    	   //信息摘要是安全的单向哈希函数，它接收任意大小的数据，并输出固定长度的哈希值。
    	   //MessageDigest.getInstance:生成实现指定摘要算法的 MessageDigest 对象。
    	   //md5 所请求算法的名称
		secretBytes = MessageDigest.getInstance("md5").digest(PWD.getBytes());
       } catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
       }
       String md5code=new BigInteger(1,secretBytes).toString(16);//16进制数字
        // 如果生成数字未满32位，需要前面补0(可写可不写)
        for (int i=0;i<32-md5code.length();i++) {
            md5code="0"+md5code;
        }
        return md5code;
    }
}
