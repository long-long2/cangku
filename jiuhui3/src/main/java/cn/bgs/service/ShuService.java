package cn.bgs.service;

import cn.bgs.pojo.Area;
import cn.bgs.pojo.Dept;
import cn.bgs.pojo.User;

import java.util.List;

public interface ShuService {
    int addshu(Dept dept);
    int addshi(Area area);


    int delshi(Integer id);
    int delshu(Integer id);


    int upshi(Area area);
    int upshu(Dept dept);
    Area findbyshi(String areaName);
    Dept findbyshu(String deptName);


    List<User> findall(Integer id);


    int tianjia(User user);
}
