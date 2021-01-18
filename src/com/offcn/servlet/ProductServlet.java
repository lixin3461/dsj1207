package com.offcn.servlet;

import com.offcn.bean.Product;
import com.offcn.service.ProductService;
import com.offcn.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method= request.getParameter("method");
        if("findAll".equals(method)){
           findAll(request,response);
        }else if("findProductById".equals(method)){
            findProductById(request,response);
        }

    }

    protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService service = new ProductServiceImpl();

        // 查回所有热门商品
        List<Product> remenList = service.getAllProductByState(1);

        // 查回所有优选商品
        List<Product> youxuanList = service.getAllProductByState(2);

        //response.sendRedirect("jsp/showall.jsp?remen="+remenList);
        // 地址栏无法带java对象

        // 作用域  ---- 把两个list加入到request中
        request.setAttribute("remen",remenList);
        request.setAttribute("youxuan",youxuanList);

        // 转发到展示数据的页面 （转发——请求转发）
        request.getRequestDispatcher("jsp/showall.jsp").forward(request,response);
        //response.sendRedirect("jsp/showall.jsp");
    }

    protected void findProductById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        ProductService service = new ProductServiceImpl();
        Product p = service.getProductById(Integer.parseInt(id));

        request.setAttribute("p",p);
        request.getRequestDispatcher("jsp/product_info.jsp").forward(request,response);
    }

}
