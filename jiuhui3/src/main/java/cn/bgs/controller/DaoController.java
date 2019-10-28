package cn.bgs.controller;

import cn.bgs.pojo.Za;
import cn.bgs.service.UserService;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/daochu")
public class DaoController {
    @Autowired
    private UserService userService;

    @RequestMapping("dao")
    @ResponseBody
    public Boolean dao(HttpServletRequest request, HttpServletResponse response, HttpSession session){
        List<Za> list=userService.tongji();
        //声明表格的列名称

        //第一步，创建一个HSSFworkbook，对应一个Excel文件
        HSSFWorkbook wd=new HSSFWorkbook();
        //第二步，在workbook中添加一个sheet，对应Excel文件中的sheet
        HSSFSheet sheet=wd.createSheet("表格1");
        //第三步，声明行对象
        HSSFRow row=null;
        //第四步，声明列对象
        HSSFCell cell=null;
        //第五步，创建单元格样式对象
        HSSFCellStyle style=wd.createCellStyle();
        //设置内容居中
        style.setAlignment(HorizontalAlignment.CENTER);
        //创建字体样式对象
        HSSFFont font=wd.createFont();
        //设置字体大小样式
        font.setFontHeightInPoints((short)10);
        //将字体样式设置到单元格样式中
        style.setFont(font);
        //创建第一行，存放总标题
        row=sheet.createRow(0);
        //在第一行创建一个列对象（一个单元格）
        cell=row.createCell(0);
        //给列对象设置值
        cell.setCellValue("计划统计表");
        //设置列对象样式
        cell.setCellStyle(style);
        //合并单元格
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));
        //创建第二行，存放每一列的标题
        row=sheet.createRow(1);
        //通过第二个行对象创建列对象
        cell=row.createCell(0);
        //向列对象中设置值
        cell.setCellValue("省份");
        //设置列的样式
        cell.setCellStyle(style);
        //遍历列名数据
        for (int i=0;i<list.size();i++){
            cell=row.createCell(i+1);
            cell.setCellValue(list.get(i).getAreaName());
            cell.setCellStyle(style);
        }
        //在标题行下面创建行，存放列名对应的数据
        row=sheet.createRow(2);
        //通过第三个行对象创建列对象
        cell=row.createCell(0);
        //将内容按顺序赋给对应的列对象
        cell.setCellValue("计划桌数");
        //设置列的样式
        cell.setCellStyle(style);
        //创建内容，遍历从数据库获取的数据
        for (int i=0;i<list.size();i++){
            //通过第三个行对象创建列对象
            cell=row.createCell(i+1);
            //将内容按顺序赋给对应的列对象
            cell.setCellValue(list.get(i).getNumActivities());
            //设置列的样式
            cell.setCellStyle(style);
        }
        //在标题行下面创建行，存放列名对应的数据
        row=sheet.createRow(3);
        //通过第三个行对象创建列对象
        cell=row.createCell(0);
        //将内容按顺序赋给对应的列对象
        cell.setCellValue("实际桌数");
        //设置列的样式
        cell.setCellStyle(style);
        //创建内容，遍历从数据库获取的数据
        for (int i=0;i<list.size();i++){
            //通过第三个行对象创建列对象
            cell=row.createCell(i+1);
            //将内容按顺序赋给对应的列对象
            cell.setCellValue(list.get(i).getNumActual());
            //设置列的样式
            cell.setCellStyle(style);
        }
        //在标题行下面创建行，存放列名对应的数据
        row=sheet.createRow(4);
        //通过第三个行对象创建列对象
        cell=row.createCell(0);
        //将内容按顺序赋给对应的列对象
        cell.setCellValue("新客户");
        //设置列的样式
        cell.setCellStyle(style);
        //创建内容，遍历从数据库获取的数据
        for (int i=0;i<list.size();i++){
            //通过第三个行对象创建列对象
            cell=row.createCell(i+1);
            //将内容按顺序赋给对应的列对象
            cell.setCellValue(list.get(i).getNewClient());
            //设置列的样式
            cell.setCellStyle(style);
        }
        //在标题行下面创建行，存放列名对应的数据
        row=sheet.createRow(5);
        //通过第三个行对象创建列对象
        cell=row.createCell(0);
        //将内容按顺序赋给对应的列对象
        cell.setCellValue("旧客户");
        //设置列的样式
        cell.setCellStyle(style);
        //创建内容，遍历从数据库获取的数据
        for (int i=0;i<list.size();i++){
            //通过第三个行对象创建列对象
            cell=row.createCell(i+1);
            //将内容按顺序赋给对应的列对象
            cell.setCellValue(list.get(i).getOldClient());
            //设置列的样式
            cell.setCellStyle(style);
        }
        //在标题行下面创建行，存放列名对应的数据
        row=sheet.createRow(6);
        //通过第三个行对象创建列对象
        cell=row.createCell(0);
        //将内容按顺序赋给对应的列对象
        cell.setCellValue("意向客户");
        //设置列的样式
        cell.setCellStyle(style);
        //创建内容，遍历从数据库获取的数据
        for (int i=0;i<list.size();i++){
            //通过第三个行对象创建列对象
            cell=row.createCell(i+1);
            //将内容按顺序赋给对应的列对象
            cell.setCellValue(list.get(i).getYxClient());
            //设置列的样式
            cell.setCellStyle(style);
        }
        //在标题行下面创建行，存放列名对应的数据
        row=sheet.createRow(7);
        //通过第三个行对象创建列对象
        cell=row.createCell(0);
        //将内容按顺序赋给对应的列对象
        cell.setCellValue("钱");
        //设置列的样式
        cell.setCellStyle(style);
        //创建内容，遍历从数据库获取的数据
        for (int i=0;i<list.size();i++){
            //通过第三个行对象创建列对象
            cell=row.createCell(i+1);
            //将内容按顺序赋给对应的列对象
            cell.setCellValue(list.get(i).getMoney());
            //设置列的样式
            cell.setCellStyle(style);
        }
        //excel存放路径及文件名
        String fileName="C:\\Users\\龙龙\\Desktop\\333\\"+System.currentTimeMillis()+".xls";
        //通过Io流创建生成的文件并将内容输入到文件中
        try{
            //创建文件对象
            File file=new File(fileName);
            //判断文件是否存在
            if (!file.exists()){
                //创建一个新文件
                file.createNewFile();
            }
            //创建文件输出流对象
            FileOutputStream outputStream=new FileOutputStream(file);
            //将文档对象写入文件输出流
            wd.write(outputStream);
            //关闭流对象
            outputStream.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

    }
}
