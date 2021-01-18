package com.offcn.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import com.offcn.bean.User;
import com.offcn.service.UserService;
import com.offcn.service.impl.UserServiceImpl;
import com.offcn.utils.DateUtils;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        //0 解决post请求时，中文乱码问题
        request.setCharacterEncoding("UTF-8");

        String method = request.getParameter("method");

        if("reg".equalsIgnoreCase(method)){
            reg(request,response);
        }else if("login".equals(method)){
            login(request,response);
        }


    }

    protected void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1 获得客户端提交的数据---- 所有请求的信息都被封装在参数request中了。通过request的方法就可以获取数据
        String username = request.getParameter("username");  // input的name属性值
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String birthday = request.getParameter("birthday");

        // 2 封装数据
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        u.setEmail(email);
        u.setSex(sex);
        u.setName(name);
        u.setBirthday(DateUtils.stringToDate(birthday));

        // 调用后台代码  ---> service  ----> dao
        UserService service = new UserServiceImpl();
        int result = service.addUser(u);


        if(result>0){  // 注册成功！  --- 跳转到登录页面

            // 在Servlet要实现跳转 有两种方式： 1 重定向  2 转发
            //response.sendRedirect("https://www.baidu.com");
            response.sendRedirect("html/aaa.html");

        }else{

        }
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserService service = new UserServiceImpl();
        User user = service.login(username,password);

        if(user!=null){ //登录成功

              //登录成功后，把登录用户的信息存到session中
              HttpSession session = request.getSession();
              session.setAttribute("user",user);

              response.sendRedirect("jsp/index.jsp");
        }else{          // 登录失败
            response.sendRedirect("jsp/login.jsp?msg=loginerror");
/*
            PrintWriter out =response.getWriter();
            out.println("<h1>用户名或密码错误</h1>");*/
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
