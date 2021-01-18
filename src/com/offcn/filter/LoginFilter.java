package com.offcn.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import com.offcn.bean.User;
import javax.servlet.http.HttpServletRequest;

@WebFilter(urlPatterns = {"/CartServlet","/jsp/pay.jsp","/jsp/cart.jsp"})
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        // 如何判断是否登录？
        HttpServletRequest request = (HttpServletRequest)req;

        //request.getRequestURI()

        HttpServletResponse response = (HttpServletResponse)resp;
        HttpSession session = request.getSession();

        User u = (User)session.getAttribute("user");

        if(u==null){ // 没登录
            response.sendRedirect(request.getContextPath()+"/jsp/login.jsp?msg=pleaselogin");
        }else{ //登录了
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
