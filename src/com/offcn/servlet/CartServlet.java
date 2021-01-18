package com.offcn.servlet;

import com.offcn.bean.Product;
import com.offcn.service.ProductService;
import com.offcn.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String method = request.getParameter("method");

        if("add".equals(method)){
             add(request,response);
        }else if("del".equals(method)){
            del(request,response);
        }


    }

    protected void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取要删除的商品id
        String pid = request.getParameter("pid");

        // 取出购物车，把购物车中哪个商品的id等于pid就删除
        HttpSession session = request.getSession();
        Map<Product,Integer> cart = (Map<Product,Integer>)session.getAttribute("cart");

        Set<Product> keys = cart.keySet();

        for(Product pro:keys){
            if(pro.getPro_id()==Integer.parseInt(pid)){
                 cart.remove(pro);
                 break;
            }
        }

        // 计算购物车中的总金额
        int total = 0;
        Set<Map.Entry<Product,Integer>> ens = cart.entrySet();

        for(Map.Entry<Product,Integer> en :ens){
            total +=en.getKey().getShop_price()*en.getValue();
        }

        session.setAttribute("total",total);

        response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pid = request.getParameter("pid");  // 获取购买的商品的id
        String num = request.getParameter("quantity");  // 购买数量

        // 要把购买的商品和数量 存入map中，再把map存入session中

        // 根据pid把对应的商品查询回来
        ProductService service = new ProductServiceImpl();
        Product p = service.getProductById(Integer.parseInt(pid));


        // 首先要判断购物车中是否已经存放了该商品。如果没有存放，直接把商品和数量加入到购物车(map).如果存放了，就改变数据即可！
        //Map<Product,Integer> cart = new HashMap<>()；  // 购物不应该直接new出来(每次购买商品都是一个新的map)
        // 应该从session中获取购物车
        HttpSession session = request.getSession();

        Map<Product,Integer> cart = (Map<Product,Integer>)session.getAttribute("cart");

        if(cart==null){  // 第一次购物
            cart = new  HashMap<>();
            cart.put(p,Integer.parseInt(num));
            session.setAttribute("cart",cart);

        }else{  // 不是第一次

            // 判断map中是否有当前的p
            Set<Product> keys = cart.keySet();
            boolean flag =false;  // 假设没有
            for(Product pro:keys){
                if(pro.getPro_id()==p.getPro_id()){  // 说明购物车中有该商品
                    int value = cart.get(pro);
                    cart.put(pro,value+Integer.parseInt(num));
                    flag =true;  // 标记为有
                    break;
                }
            }
            if(flag==false){
                cart.put(p,Integer.parseInt(num));
            }
        }

        // 计算购物车中的总金额
        int total = 0;

        Set<Map.Entry<Product,Integer>> ens = cart.entrySet();

        for(Map.Entry<Product,Integer> en :ens){
            total +=en.getKey().getShop_price()*en.getValue();
        }

        session.setAttribute("total",total);
        response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
    }
}
