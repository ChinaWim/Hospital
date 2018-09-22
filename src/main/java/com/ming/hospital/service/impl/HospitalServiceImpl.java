package com.ming.hospital.service.impl;

import com.ming.hospital.dao.AppointmentMapper;
import com.ming.hospital.dao.DoctorMapper;
import com.ming.hospital.dao.HospitalMapper;
import com.ming.hospital.dto.DoctorPage;
import com.ming.hospital.dto.HospitalPage;
import com.ming.hospital.pojo.*;
import com.ming.hospital.service.AppointmentService;
import com.ming.hospital.service.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ming on 2017/11/17.
 */
@Service
public class HospitalServiceImpl implements HospitalService {
    @Autowired
    private HospitalMapper hospitalMapper;

    @Autowired
    private DoctorMapper doctorMapper;

    @Autowired
    private AppointmentService appointmentService;


    @Override
    public Page getPageData(Integer times,Integer insurance,String name, Integer grade, Integer pageNum, Integer pageSize) {
        Page<Hospital> page = new Page<>();
        String level = "";
        //1三甲医院 2三乙医院 3二甲医院 4二级医
        if( grade != null){

            switch (grade){
                case 1 : {
                    level = "三甲"; break;
                }
                case 2 :{
                    level = "三乙";break;
                }
                case 3:{
                    level = "二甲";break;
                }
                case 4 :{
                    level = "二级";break;
                }
            }
        }
        Integer start = (pageNum - 1) * pageSize;//开始搜索的索引
        //封装dto
        HospitalPage hospitalPage = new HospitalPage();
        hospitalPage.setTimes(times);
        hospitalPage.setGrade(level);
        hospitalPage.setName(name);
        hospitalPage.setPageNum(start);
        hospitalPage.setPageSize(pageSize);
        hospitalPage.setInsurance(insurance);
        List<Hospital> hospitals = hospitalMapper.selectToPage(hospitalPage);
        for (Hospital hospital : hospitals) {
            DoctorExample doctorExample = new DoctorExample();
            doctorExample.createCriteria().andHidEqualTo(hospital.getHid());
            List<Doctor> list = doctorMapper.selectByExample(doctorExample);
            hospital.setDoctorList(list);

            Integer integer = appointmentService.selectTimesFromHospital(hospital.getHid());
            hospital.setTimes(integer);
            hospitalMapper.updateByPrimaryKeySelective(hospital);
            //服务次数
        }

        //封装PageBean
        page.setData(hospitals);
        page.setTotalCount(selectToPageTotalCount(hospitalPage));
        page.setTotalPage((int) (Math.ceil(page.getTotalCount()*1.0/pageSize) ) );
        page.setPageSize(pageSize);
        page.setPageNum(pageNum);
        return page;

    }

    @Override
    public Integer totalCount() {
        return hospitalMapper.countByExample(new HospitalExample());
    }

    @Override
    public Integer selectToPageTotalCount(HospitalPage hospitalPage) {
        return hospitalMapper.selectToPageTotalCount(hospitalPage);
    }

    @Override
    public Hospital getHospitalById(Long hid) {
        Hospital hospital = hospitalMapper.selectByPrimaryKey(hid);
        DoctorExample doctorExample = new DoctorExample();
        doctorExample.createCriteria().andHidEqualTo(hid);
        List<Doctor> list = doctorMapper.selectByExample(doctorExample);
        hospital.setDoctorList(list);
        hospital.setTimes(appointmentService.selectTimesFromHospital(hospital.getHid()));
        hospitalMapper.updateByPrimaryKeySelective(hospital);
        return hospital;
    }

    @Override
    public List<Hospital> getList() {

        return   hospitalMapper.selectByExample(new HospitalExample());
    }

    @Override
    public List<Hospital> getListByTop3() {
        List<Hospital> listByTop3 = hospitalMapper.getListByTop3();
        for (Hospital hospital : listByTop3) {
            Integer integer = appointmentService.selectTimesFromHospital(hospital.getHid());
            hospital.setTimes(integer);
            hospitalMapper.updateByPrimaryKeySelective(hospital);
        }
        return hospitalMapper.getListByTop3();
    }
}
