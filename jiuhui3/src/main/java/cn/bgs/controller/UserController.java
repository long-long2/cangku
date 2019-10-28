package cn.bgs.controller;


import cn.bgs.pojo.*;
import cn.bgs.service.UserService;
import cn.bgs.utils.MD5Utils;
import cn.bgs.utils.SendSMSUtils;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/userController")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("login")
    @ResponseBody
    public String login1(HttpSession session,String usercode,String password){
        User user=userService.login(usercode,MD5Utils.md5(password));
        if (user!=null){
            session.setAttribute("user",user);
        }
        return JSON.toJSONString(user);
    }
    @RequestMapping("loginout")
    @ResponseBody
    public boolean loginout(HttpServletRequest request){
        boolean b=false;
       request.getSession().removeAttribute("user");
       User user=(User) request.getSession().getAttribute("user");
        if (user==null){
            b=true;
        }else {
            b=false;
        }
        return b;

    }
    @RequestMapping("duanxin")
    @ResponseBody
    public boolean duanxin(String phone,HttpSession session){
        System.out.println(phone);
       User user=(User)session.getAttribute("user");
        System.out.println(user);
        if(null!=user){
            int code =(int)((Math.random()*9+1)*1000);
            session.setAttribute("phonecode",code);
            boolean duan= SendSMSUtils.sendMSM(phone,String.valueOf(code));
            return duan;
        }else {
            return false;
        }
    }

    @RequestMapping("yan")
    @ResponseBody
    public boolean yan(Integer code,HttpSession session){
       Integer scode=(Integer) session.getAttribute("phonecode");
       boolean flag=false;
       if (null==scode){
           flag=false;
       }
       if (scode.equals(code)){
           flag=true;
       }
       return  flag;
    }
    @RequestMapping("update")
    public String update(Integer id,String password){
        int up=userService.update(id,MD5Utils.md5(password));
        return "redirect:loginout1";
    }

    @RequestMapping("loginout1")

    public String loginout1(HttpServletRequest request){
        boolean b=false;
        request.getSession().removeAttribute("user");
        User user=(User) request.getSession().getAttribute("user");
        if (user==null){
            b=true;
        }else {
            b=false;
        }
        return "login";

    }





    @RequestMapping("add")
    @ResponseBody
    public boolean add(Plan plan,HttpSession session,Model model){
      User user=(User)session.getAttribute("user");
        boolean flag=false;
        if (user!=null){
            Dept dept=userService.list(user.getDeptId());
            plan.setDeptId(dept.getId());
            plan.setDeptName(dept.getDeptName());
            plan.setAreaCode(dept.getAreaCode());
            plan.setAreaId(dept.getAreaId());
            plan.setAvailable(1);
            plan.setType("xian");
            int plans=userService.add(plan);
            if (plans!=0){
                flag=true;
            }else {
                flag=false;
            }
        }else {
            flag=false;
        }
        return flag;
    }


    @RequestMapping("getlist")
    @ResponseBody
    public List<Plan> getlist(HttpSession session){
        User user=(User)session.getAttribute("user");
        Integer areaId=user.getAreaId();
        List<Plan> plan=userService.getlist(areaId);
        return plan;

    }

    @RequestMapping("uptong")
    @ResponseBody
    public boolean uptong(Plan plan, Integer id){
        boolean flag=false;


        plan.setAvailable(2);
       int i=userService.uptong(plan);
        if (i!=0){
            flag=true;
        }else {
            flag=false;
        }

        return flag;

    }

    @RequestMapping("upbutong")
    @ResponseBody
    public int upbutong(Plan plan){

        plan.setAvailable(3);
        int i=userService.uptong(plan);


        return i;

    }


    @RequestMapping("getlist2")
    @ResponseBody
    public PageInfo<Plan> getlist2(HttpSession session,Integer limit, Integer offset){
        User user=(User)session.getAttribute("user");
        Integer areaId=user.getAreaId();
        PageInfo<Plan> plan=userService.getlist2(areaId,limit,offset);
        return plan;

    }


    @RequestMapping("getlist3")
    @ResponseBody
    public List<Plan> getlist3(HttpSession session){
        User user=(User)session.getAttribute("user");
        Integer areaId=user.getAreaId();
        List<Plan> plan=userService.getlist3(areaId);
        return plan;

    }



    @RequestMapping("findbyid")
    @ResponseBody
    public String findbyid(Plan plan){

            Integer id=plan.getId();
         plan=userService.findbyid(id);
        return JSON.toJSONString(plan);

    }



    @RequestMapping("upshangbao")
    @ResponseBody
    public int upshangbao(Plan plan){
        Integer id=plan.getId();
        Plan plan1=userService.findbyid(id);
            plan.setId(plan1.getId());
        int i=userService.upshangbao(plan);


        return i;

    }



    @RequestMapping("add1")
    @ResponseBody
    public Integer add1(Items items, HttpSession session,Integer id){
        User user=(User)session.getAttribute("user");

        if (user!=null){
            Plan plan=userService.quanchas(id);
            items.setDeptId(plan.getDeptId());
            items.setAreaId(plan.getAreaId());
            items.setAreaCode(plan.getAreaCode());
            items.setUserId(user.getId());
            items.setUserCode(user.getUsercode());
            items.setPlanId(plan.getId());
            items.setAvailable("1");
            int itemss=userService.add1(items);

            userService.upbian(plan);
            if (itemss!=0){
                System.out.println(items.getId());
              return items.getId();
            }else {
             return 0;
            }
        }else {
            return 0;
        }

    }


    @RequestMapping("addtupian")
    @ResponseBody
    public boolean addtupian(Attachment attachment, MultipartFile[] files) throws IOException {
            List<Attachment> list=new ArrayList<Attachment>();


            for (int i=0;i<files.length;i++){
                String imgName = files[i].getOriginalFilename();
                String img = UUID.randomUUID().toString();
                String exName = imgName.substring(imgName.lastIndexOf("."));
                File file= new File("D:/materrial/1.1/jiuhui3/src/main/webapp/imgs/" + img + exName);
                files[i].transferTo(file);
                attachment.setFileextensions(exName);
                attachment.setUrl(img + exName);
                long size=files[i].getSize();
                attachment.setSize(Long.toString(size));
                list.add(attachment);
            }
         int i=userService.addtupian(list);
        if (i>0){
                return true;
        }else {
            return false;
        }
    }


    @RequestMapping("tongji")
    @ResponseBody
    public List<Za> tongji(HttpSession session){


        List<Za> plan1=userService.tongji();
        return plan1;

    }


    @RequestMapping("mingzi")
    @ResponseBody
    public  List<Shu> mingzi( Model model){


        List<Shu> plan1=userService.mingzi();

        return plan1;

    }


    @RequestMapping("mingzi1")
    @ResponseBody
    public  List<Dept> mingzi1( Model model){


        List<Dept> plan2=userService.mingzi1();

        return plan2;

    }


    @RequestMapping("findby7")
    @ResponseBody
    public   List<Dept> findby7( Integer areaId){


        List<Dept> plan7=userService.findby7(areaId);

        return plan7;

    }
}
