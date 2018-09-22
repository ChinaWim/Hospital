package com.ming.hospital.web;

import com.ming.hospital.pojo.User;
import com.ming.hospital.service.UserService;
import com.ming.hospital.utils.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Ming on 2017/11/17.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/register",method = {RequestMethod.POST})
    public String register(User user,Model model) {
        Date date = new Date();
        user.setCreatetime(date);
        user.setUpdatetime(date);
        user.setUid(CommonUtils.getId());
        user.setCode(UUID.randomUUID().toString().replace("-",""));//激活码
        boolean register = userService.register(user);
        if(register){
            return "registerSuccess";
        }
        model.addAttribute("msg","不好意思！注册失败！请重新注册，");
        return "error";
    }
    @RequestMapping("/active/{code}")
    public String active(@PathVariable String code,Model model){
        if(code != null){
            boolean active = userService.active(code);
            if(active){
                return "redirect:/";
            }else {
                model.addAttribute("msg","激活邮箱失败！您的激活码可能超过48小时！请重新注册！");
            }
        }
        return "error";
    }

    @RequestMapping(value = "/login",method = {RequestMethod.POST})
    public String login(User user,HttpServletRequest request){
        User fullUser =  userService.login(user);
        if(fullUser != null){
            HttpSession session = request.getSession();
            session.setAttribute("user",fullUser);
            return "forward:/";
        }
        request.setAttribute("msg","账号或密码错误！请重新登陆<a href = ''>医者天下</a>");
        return "error";
    }
    @RequestMapping("/checkUserName")
    @ResponseBody
    public Map checkUserName(String user){
        Map map = new HashMap();
        boolean isExist = userService.checkUserName(user);
        map.put("isExist",isExist ? true:false);
        return map;
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }





}
