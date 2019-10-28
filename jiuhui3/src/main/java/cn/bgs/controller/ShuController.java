package cn.bgs.controller;

import cn.bgs.pojo.*;
import cn.bgs.service.ShuService;
import cn.bgs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/shu")
public class ShuController {

    @Autowired
    private ShuService shuService;
    @RequestMapping("addshu")
    @ResponseBody
    public Integer addshu(Dept dept){
        int i=shuService.addshu(dept);
        return i;
    }

    @RequestMapping("addshi")
    @ResponseBody
    public Integer addshi(Area area){
        int i=shuService.addshi(area);
        return i;
    }



    @RequestMapping("delshu")
    @ResponseBody
    public Integer delshu(Integer id){

        int i=shuService.delshu(id);
        return i;
    }

    @RequestMapping("delshi")
    @ResponseBody
    public Integer delshi(Integer id){
        int i=shuService.delshi(id);
        return i;
    }

    @RequestMapping("upshu")
    @ResponseBody
    public Integer upshu(Dept dept){
        int i=shuService.upshu(dept);
        return i;
    }
    @RequestMapping("upshi")
    @ResponseBody
    public Integer upshi(Area area){
        int i=shuService.upshi(area);
        return i;
    }
    @RequestMapping("findbyshi")
    @ResponseBody
    public Area findbyshi(String areaName){
        Area list=shuService.findbyshi(areaName);
        return list;
    }
    @RequestMapping("findbyshu")
    @ResponseBody
    public Dept findbyshu(String deptName){
        Dept list2=shuService.findbyshu(deptName);
        return list2;
    }


    @RequestMapping("findall")
    @ResponseBody
    public  List<User> findall(Integer id){
        List<User> list3=shuService.findall(id);
        return list3;
    }


    @RequestMapping("tianjia")
    @ResponseBody
    public Integer tianjia(User user){
        int i=shuService.tianjia(user);
        return i;
    }
}
