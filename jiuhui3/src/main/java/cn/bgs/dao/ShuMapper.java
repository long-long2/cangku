package cn.bgs.dao;

import cn.bgs.pojo.Area;
import cn.bgs.pojo.Dept;
import cn.bgs.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShuMapper {
    int addshu(Dept dept);
    int addshi(Area area);

    int delshi(@Param("id") Integer id);
    int delshu(@Param("id")Integer id);
    int upshi(Area area);
    int upshu(Dept dept);
    Area findbyshi(String areaName);
    Dept findbyshu(String deptName);



    List<User> findall(Integer id);



    int tianjia(User user);
}
