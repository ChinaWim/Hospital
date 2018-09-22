package com.ming.hospital.service;

import com.ming.hospital.dto.DoctorPage;
import com.ming.hospital.dto.HospitalPage;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.pojo.Hospital;
import com.ming.hospital.pojo.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
public interface HospitalService {

    Page getPageData(Integer times,Integer insurance,String name ,Integer grade,Integer pageNum,Integer pageSize);

    Integer totalCount();

    Integer selectToPageTotalCount(HospitalPage hospitalPage);

    Hospital getHospitalById(Long hid);

    List<Hospital> getList();

    List<Hospital> getListByTop3();
}
