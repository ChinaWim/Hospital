package com.ming.hospital.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Ming on 2017/11/26.
 */
public class DateUtils {

   public  static String getFillDate(Date date){
        SimpleDateFormat sbf = new SimpleDateFormat("yyyy年-MM月-dd日");
        return  sbf.format(date);
    }

   public  static  String getDate(Date date){
        SimpleDateFormat sbf = new SimpleDateFormat("MM月dd日");
        return  sbf.format(date);
    }

   public static String getWeek(Date date){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int i = calendar.get(Calendar.DAY_OF_WEEK);
        String week = "";
        switch(i){
            case 1:{
                week = "星期日";
                break;
            }
            case 2:{
                week = "星期一";
                break;
            }
            case 3:{
                week = "星期二";
                break;
            }
            case 4:{
                week = "星期三";
                break;
            }
            case 5:{
                week = "星期四";
                break;
            }
            case 6:{
                week = "星期五";
                break;
            }
            case 7:{
                week = "星期六";
                break;
            }
        }
        return week;
    }

}
