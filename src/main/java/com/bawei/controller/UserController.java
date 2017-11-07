package com.bawei.controller;

import com.bawei.pojo.User;
import com.bawei.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping(value="/selectByname")
    @ResponseBody
    public String selectByname(String name){//姓名唯一
        String selectByname = userService.selectByname(name);
        return selectByname;

    }
    /**
     * 到用户注册页面
     * @return
     */
    @RequestMapping(value = "/toUserAdd")
    public String toUserAdd(){
        return "userAdd";
    }
    @RequestMapping(value="/add" )
    public String add(HttpServletRequest request, User user,MultipartFile photo) throws  IOException {//添加
        //获取上传文件名称
        String filename = photo.getOriginalFilename();

        //获取新的文件名
        long millis = System.currentTimeMillis();
        String newName = millis+filename;

        //获取文件流
        InputStream inputStream1 = photo.getInputStream();

        //获取物理路径
        String wlPath = "D:\\shoppingCart\\src\\main\\resources\\static\\images/"+newName;

        //逻辑路径
        String ljPath = "../images/"+newName;

        //临时路径
        String pathRoot = request.getSession().getServletContext().getRealPath("/");//自动寻找target根目录
        String lsPath = pathRoot+"\\images\\"+newName;

        //判断是否需要创建文件夹
        //物理路径文件夹
        File wlFile = new File("D:\\shoppingCart\\src\\main\\resources\\static\\images");
        //临时路径文件夹
        File lsFile = new File(pathRoot+"\\images\\");

        if(!wlFile.exists()) {
            wlFile.mkdir();
        }
        if(!lsFile.exists()) {
            lsFile.mkdir();
        }

        //执行读写操作
        if(!photo.isEmpty()) {
            //将文件放入物理路径
            FileOutputStream wlFileOutputStream = new FileOutputStream(wlPath);
            //将文件放入临时路径
            FileOutputStream lsFileOutputStream1 =new FileOutputStream(lsPath);

            int line = 0;

            while ((line = inputStream1.read()) != -1) {
                //写入物理路径
                wlFileOutputStream.write(line);
                //写入临时路径
                lsFileOutputStream1.write(line);
            }

            wlFileOutputStream.flush();
            lsFileOutputStream1.flush();
            lsFileOutputStream1.close();
            wlFileOutputStream.close();
            inputStream1.close();
        }

        //将相对路径放入数据库中
        user.setPicture(ljPath);
        System.out.println("hahahahh");
        System.out.println(user);
		userService.add(user);
       return "redirect:/user/selectAllUser";

    }
    @RequestMapping(value="/login")
    @ResponseBody
    public String login(String name,String password,HttpSession session){//登录
        return userService.login(name,password,session);

    }
    @RequestMapping(value = "/selectAllUser")
    public ModelAndView userSelectAll(String pageNo, String pageSize, ModelAndView modelAndView){
        //初始化数值
        int num = 1;
        int size = 3;

        if(pageNo != null && !"".equals(pageNo)) {
            num = Integer.parseInt(pageNo);
        }
        if (pageSize != null && !"".equals(pageSize)) {
            size = Integer.parseInt(pageSize);
        }

        //开始分页
        PageHelper.startPage(num,size);

        //查询数据库信息
        List<User> users = userService.selectAllUser();

        //将信息放入PageInfo进行分页
        PageInfo<User> pageInfo = new PageInfo<User>(users);

        System.out.println(pageInfo.getPageNum());
        System.out.println(pageInfo.getPageSize());
        System.out.println(pageInfo.getTotal());
        System.out.println(pageInfo.getFirstPage());
        System.out.println(pageInfo.getLastPage());
        System.out.println(pageInfo.getPrePage());
        System.out.println(pageInfo.getNextPage());
        modelAndView.addObject("pageHelper",pageInfo);
        modelAndView.setViewName("list");
        return modelAndView;
    }

}