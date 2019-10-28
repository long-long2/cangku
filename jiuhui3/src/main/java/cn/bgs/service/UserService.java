package cn.bgs.service;

import cn.bgs.pojo.*;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    User login( String usercode,String password);
    int update(Integer id,String password);

    int add(Plan plan);


    Dept list(Integer dept_id);

    List<Plan> getlist(Integer areaId);


    int uptong(Plan plan);
    PageInfo<Plan> getlist2(Integer areaId,Integer limit, Integer offset);
    List<Plan> getlist3(Integer areaId);

    Plan findbyid(Integer id);

    int upshangbao(Plan plan);

    Plan quanchas(Integer id);
    int add1(Items items);
    int upbian(Plan plan);




    int addtupian(List<Attachment>  attachment);

    List<Za> tongji();
    List<Shu> mingzi();

    List<Dept> mingzi1();


    List<Dept>   findby7(Integer areaId);
}
