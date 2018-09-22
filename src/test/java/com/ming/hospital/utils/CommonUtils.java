package com.ming.hospital.utils;

import org.junit.Test;
import org.springframework.util.DigestUtils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by Ming on 2017/11/17.
 */
public class CommonUtils {

    @Test
    public  void getId(){

        Calendar calendar = Calendar.getInstance();
        int i = calendar.get(Calendar.DAY_OF_WEEK);
        System.out.println(i);
        String week = "";
        switch(i){
            case 1:{
                week = "星期日";
                break;
            }
            case 2:{
                week = "星期一";break;
            }
            case 3:{
                week = "星期二"; break;
            }
            case 4:{
                week = "星期三";break;
            }
            case 5:{
                week = "星期四";break;
            }
            case 6:{
                week = "星期五";break;
            }
            case 7:{
                week = "星期六";break;
            }
        }



        System.out.println(calendar.get(Calendar.YEAR));
        System.out.println(calendar.get(Calendar.MONTH)+1);
        System.out.println(calendar.get(Calendar.DATE));
        System.out.println(week);

    }
    @Test
    public  void  MD5(){

        //盐值
        String salt = "12u3jk125b1389adnsann9./,/.129012";
        String base = "123456" + "/" + salt;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
    }

}
