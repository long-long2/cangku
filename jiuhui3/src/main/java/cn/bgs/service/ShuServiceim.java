package cn.bgs.service;

import cn.bgs.dao.ShuMapper;
import cn.bgs.pojo.Area;
import cn.bgs.pojo.Dept;
import cn.bgs.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShuServiceim implements ShuService{
    @Autowired
    private ShuMapper shuMapper;

    @Override
    public int addshu(Dept dept) {
        return shuMapper.addshu(dept);
    }

    @Override
    public int addshi(Area area) {
        return shuMapper.addshi(area);
    }

    @Override
    public int delshi(Integer id) {
        return shuMapper.delshi(id);
    }

    @Override
    public int delshu(Integer id) {
        return shuMapper.delshu(id);
    }

    @Override
    public int upshi(Area area) {
        return shuMapper.upshi(area);
    }

    @Override
    public int upshu(Dept dept) {
        return shuMapper.upshu(dept);
    }

    @Override
    public Area findbyshi(String areaName) {
        return shuMapper.findbyshi(areaName);
    }

    @Override
    public Dept findbyshu(String deptName) {
        return shuMapper.findbyshu(deptName);
    }

    @Override
    public List<User> findall(Integer id) {
        return shuMapper.findall(id);
    }

    @Override
    public int tianjia(User user) {
        return shuMapper.tianjia(user);
    }
}
