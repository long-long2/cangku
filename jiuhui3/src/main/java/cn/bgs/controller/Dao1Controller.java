package cn.bgs.controller;

import cn.bgs.pojo.Za;
import cn.bgs.service.UserService;

import com.alibaba.fastjson.JSONObject;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/daochu1")
public class Dao1Controller {

    @Autowired
    private UserService userService;

    @RequestMapping("dao2")
    @ResponseBody
    public Boolean  dao(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        JSONObject jsonObject = new JSONObject();
        //先查询出数据list准备往Excel里写数据

        List<Za> list = userService.tongji();
        //第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFCellStyle style=wb.createCellStyle();
        //设置内容居中
        style.setAlignment(HorizontalAlignment.CENTER);
        HSSFFont font=wb.createFont();
        //设置字体大小样式
        font.setFontHeightInPoints((short)32);
        //将字体样式设置到单元格样式中
        style.setFont(font);
        //第二步，在webbook中添    加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("聊天记录");
        //第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow(0);

        row.createCell(0).setCellValue("省份");
        row.createCell(1).setCellValue("计划桌数");
        row.createCell(2).setCellValue("实际桌数");
        row.createCell(3).setCellValue("新客户");
        row.createCell(4).setCellValue("旧客户");
        row.createCell(5).setCellValue("意向客户");
        row.createCell(6).setCellValue("钱");
        for (int i = 0; i < list.size(); i++) {
            row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(list.get(i).getAreaName());
            row.createCell(1).setCellValue(list.get(i).getNumActivities());
            row.createCell(2).setCellValue(list.get(i).getNumActual());
            row.createCell(3).setCellValue(list.get(i).getNewClient());
            row.createCell(4).setCellValue(list.get(i).getOldClient());
            row.createCell(5).setCellValue(list.get(i).getYxClient());
            row.createCell(6).setCellValue(list.get(i).getMoney());
        }
        try {
            File desktopDir = FileSystemView.getFileSystemView().getHomeDirectory();
            String desktopPath = desktopDir.getAbsolutePath();
            String desktopDirPath = desktopPath.replace("\\", "\\\\");
            String filePath="C:\\Users\\龙龙\\Desktop\\333\\"+System.currentTimeMillis()+".xls";
            File file = new File(filePath);
            if (file.exists()) {
                try {
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            FileOutputStream fos = new FileOutputStream(file);
            if (fos != null) {

                wb.write(fos);
                fos.flush();
                fos.close();
            } else {

            }
        } catch (Exception e) {

            e.printStackTrace();

        }
        return true;
    }
}