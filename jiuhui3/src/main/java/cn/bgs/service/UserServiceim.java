package cn.bgs.service;


import cn.bgs.dao.UserMapper;
import cn.bgs.pojo.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceim implements UserService {
    @Autowired
    private UserMapper userMapper;


    @Override
    public User login(String usercode, String password) {
        return userMapper.login(usercode,password);
    }

    @Override
    public int update(Integer id,String password) {
        return userMapper.update(id,password);
    }



    @Override
    public int add(Plan plan) {
        return userMapper.add(plan);
    }

    @Override
    public Dept list(Integer dept_id) {
        return userMapper.list(dept_id);
    }

    @Override
    public List<Plan> getlist(Integer areaId) {
        return userMapper.getlist(areaId);
    }

    @Override
    public int uptong(Plan plan) {
        return userMapper.uptong(plan);
    }

    @Override
    public PageInfo<Plan> getlist2(Integer areaId,Integer limit, Integer offset) {
        offset=(offset/limit)+1;
        PageHelper.startPage(offset,limit);
        List<Plan> list=userMapper.getlist2(areaId);
        PageInfo<Plan> info=new PageInfo<Plan>(list);
        return info;
    }

    @Override
    public List<Plan> getlist3(Integer areaId) {
        return userMapper.getlist3(areaId);
    }

    @Override
    public Plan findbyid(Integer id) {
        return userMapper.findbyid(id);
    }

    @Override
    public int upshangbao(Plan plan) {
        return userMapper.upshangbao(plan);
    }

    @Override
    public Plan quanchas(Integer id) {
        return userMapper.quanchas(id);
    }

    @Override
    public int add1(Items items) {
        return userMapper.add1(items);
    }

    @Override
    public int upbian(Plan plan) {
        return userMapper.upbian(plan);
    }

    @Override
    public int addtupian(List<Attachment>  attachment) {
        return userMapper.addtupian(attachment);
    }

    @Override
    public List<Za> tongji() {
        return userMapper.tongji();
    }

    @Override
    public  List<Shu> mingzi() {
        return userMapper.mingzi();
    }

    @Override
    public List<Dept> mingzi1() {
        return userMapper.mingzi1();
    }

    @Override
    public  List<Dept> findby7(Integer areaId) {
        return userMapper.findby7(areaId);
    }


}
