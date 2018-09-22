package com.ming.hospital.service;

import com.ming.hospital.dto.DoctorPage;
import com.ming.hospital.pojo.Dept;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.pojo.Page;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
public interface DeptService {

    List<Dept> getList();

    List<Dept> getListByGrade(Integer grade);



}
