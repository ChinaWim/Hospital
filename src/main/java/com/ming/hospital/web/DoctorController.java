package com.ming.hospital.web;

import com.ming.hospital.dto.DoctorPage;
import com.ming.hospital.pojo.DayInfo;
import com.ming.hospital.pojo.Dept;
import com.ming.hospital.pojo.Doctor;
import com.ming.hospital.pojo.Page;
import com.ming.hospital.service.DeptService;
import com.ming.hospital.service.DoctorService;
import com.ming.hospital.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Ming on 2017/11/19.
 */
@Controller
@RequestMapping("/doctor")
public class DoctorController {
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private DeptService deptService;



    @RequestMapping("/doctorList")
    public String doctorList(DoctorPage doctorPage,Model model){
        //一级和二级科室
        List<Dept> deptList1 = deptService.getListByGrade(1);
        List<Dept> deptList2 = deptService.getListByGrade(2);
        //1主任医师 2副主任医师 3主治医师 4普通医师
        //科室id，医生等级,//医生姓名

        Page<Doctor> page = doctorService.selectToPage(doctorPage);

        model.addAttribute("deptList1",deptList1);
        model.addAttribute("deptList2",deptList2);
        model.addAttribute("page",page);

        model.addAttribute("grade",doctorPage.getGrade());
        model.addAttribute("key",doctorPage.getKey());
        model.addAttribute("deid",doctorPage.getDeid());

        return "doctor_list";
    }

    @RequestMapping("/detail/{id}")
    public String detail(@PathVariable Long id , Model model){
        Doctor doctor = doctorService.selectById(id);
        String[] times = doctor.getSurgeryweek().split(","); //就诊时间
        List<DayInfo> dayInfoList = new ArrayList<>();
        Date date = new Date();

        for(int i = 0; i < 7; i++){
            DayInfo dayInfo = new DayInfo();
            dayInfo.setDate(DateUtils.getDate(date));
            dayInfo.setFullDate(DateUtils.getFillDate(date));
            dayInfo.setWeek(DateUtils.getWeek(date));
            for (String  time : times) {
                if(dayInfo.getWeek() .equals(time.substring(0,3)) ){
                    time = time.substring(3); //取上午、下午、晚上
                    if(time.equals("上午")){
                        dayInfo.setSw(1);
                    }else if(time.equals("下午")){
                        dayInfo.setXw(1);
                    }else{
                        dayInfo.setWs(1);
                    }
                }
            }
            dayInfoList.add(dayInfo);
            date.setTime(date.getTime() + 1000*60*60*24);
        }
        model.addAttribute("doctor",doctor);
        model.addAttribute("dayInfoList",dayInfoList);

        return "doctor_detail";
    }


}
