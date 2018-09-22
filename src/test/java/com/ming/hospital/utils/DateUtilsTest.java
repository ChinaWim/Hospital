package com.ming.hospital.utils;

import org.junit.Test;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * Created by Ming on 2017/11/26.
 */
public class DateUtilsTest {
    @Test
    public void getFillDate() throws Exception {
        String fillDate = DateUtils.getFillDate(new Date());
        System.out.println(fillDate);
    }

    @Test
    public void getDate() throws Exception {
        System.out.println(DateUtils.getWeek(new Date()));
    }

}