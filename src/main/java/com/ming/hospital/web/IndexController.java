package com.ming.hospital.web;

import com.ming.hospital.pojo.Appointment;
import com.ming.hospital.pojo.Dept;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.pojo.Hospital;
import com.ming.hospital.service.AppointmentService;
import com.ming.hospital.service.DeptService;
import com.ming.hospital.service.DoctorService;
import com.ming.hospital.service.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Ming on 2017/11/20.
 */
@Controller
public class IndexController {

    @Autowired
    private HospitalService hospitalService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private DoctorService doctorService;

    @Autowired
    private AppointmentService appointmentService;


    @RequestMapping("/")
    public String index(Model model){
        //两个科室
        List<Dept> deptList1 = deptService.getListByGrade(1);
        List<Dept> deptList2 = deptService.getListByGrade(2);
        model.addAttribute("deptList1",deptList1);
        model.addAttribute("deptList2",deptList2);

        List<Hospital> list = hospitalService.getList();
        model.addAttribute("hospitalList",list);

        //推荐医生 分数排名前4位
        List<Doctor> listByTop4 = doctorService.getListByTop4();
        model.addAttribute("doctorList",listByTop4);

        //总共医生
        List<Doctor> doctorList = doctorService.getList();
        model.addAttribute("doctorSize",doctorList.size());

        //总服务次数
        List<Appointment> appointmentList = appointmentService.listAll();
        model.addAttribute("appointmentSize",appointmentList.size());


        //推荐医院 分数排名前3
        List<Hospital> listByTop3 = hospitalService.getListByTop3();
        model.addAttribute("hospitalTop3",listByTop3);
        return "index";
    }




}
