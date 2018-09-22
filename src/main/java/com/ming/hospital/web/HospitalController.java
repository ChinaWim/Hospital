package com.ming.hospital.web;

import com.ming.hospital.dao.DeptMapper;
import com.ming.hospital.dto.DoctorPage;
import com.ming.hospital.dto.HospitalPage;
import com.ming.hospital.pojo.Dept;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.pojo.Hospital;
import com.ming.hospital.pojo.Page;
import com.ming.hospital.service.DeptService;
import com.ming.hospital.service.DoctorService;
import com.ming.hospital.service.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Ming on 2017/11/18.
 */
@Controller
@RequestMapping("/hospital")
public class HospitalController {
    @Autowired
    private HospitalService hospitalService;
    @Autowired
    private DeptService deptService;
    @Autowired
    private DoctorService doctorService;


    @RequestMapping("/hospitalList")
    public String hospitalList(Integer times,Integer insurance ,String name,Integer grade, Integer pageNum, Model model){
        Integer pageSize = 4;
        if(pageNum == null ) pageNum = 1;
        Page <Hospital> pageData = hospitalService.getPageData(times,insurance,name,grade,pageNum, pageSize);
        model.addAttribute("page",pageData);
        model.addAttribute("grade",grade);
        model.addAttribute("name",name);
        model.addAttribute("times",times);
        model.addAttribute("insurance",insurance);

        return "hospital_list";
    }

    @RequestMapping("/detail/{hid}")
    public String detail(DoctorPage doctorPage, @PathVariable Long hid, Model model){
        doctorPage.setHid(hid);
        Hospital hospital = hospitalService.getHospitalById(hid);
        //两个科室
        List<Dept> deptList1 = deptService.getListByGrade(1);
        List<Dept> deptList2 = deptService.getListByGrade(2);

        //放PageBean
        Page<Doctor> page = doctorService.selectToPage(doctorPage);

        model.addAttribute("page",page);
        model.addAttribute("hid",hid);
        model.addAttribute("hospital",hospital);
        model.addAttribute("grade",doctorPage.getGrade());
        model.addAttribute("deid",doctorPage.getDeid());
        model.addAttribute("deptList1",deptList1);
        model.addAttribute("deptList2",deptList2);

        return "hospital_detail";
    }

}
