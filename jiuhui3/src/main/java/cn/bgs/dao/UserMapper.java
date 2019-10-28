package cn.bgs.dao;

import cn.bgs.pojo.*;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface UserMapper {
    User login(@Param("usercode") String usercode,@Param("password")String password);
    int update(@Param("id") Integer id,@Param("password")String password);


    int add(Plan plan);

    Dept list(Integer dept_id);
    List<Plan> getlist(Integer areaId);

    int uptong(Plan plan);


    List<Plan> getlist2(Integer areaId);

    List<Plan> getlist3(Integer areaId);

    Plan findbyid(Integer id);


    int upshangbao(Plan plan);



    Plan quanchas(Integer id);
    int add1(Items items);
    int upbian(Plan plan);




    int addtupian(@Param("img") List<Attachment> attachment);

    List<Za> tongji();

    List<Shu> mingzi();

    List<Dept> mingzi1();

    List<Dept>  findby7(Integer areaId);
}
