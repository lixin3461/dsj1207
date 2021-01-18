<%@ page import="java.util.List" %>
<%@ page import="com.offcn.bean.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        a{
            text-decoration: none;
        }

        #img5{
            margin-left:275px;
        }
    </style>

    <script>

        window.onload=function(){

            var i = 8;
            setInterval(function(){
                var img = document.getElementById('lunbotu');
                img.src='<%=request.getContextPath()%>/img/img'+(i++)+".jpg";
                if(i==10){
                    i=8;
                }
            },2000)

        }

    </script>
</head>
<body>
<!-- 整个页面是一个table表格-->
<table width="100%">
    <!-- 第一行 logo部分-->
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td>
                        <img src="<%=request.getContextPath()%>/img/logo.jpg" />
                    </td>
                    <td>
                        <img src="<%=request.getContextPath()%>/img/img5.jpg" id="img5"  />&nbsp;&nbsp;
                        <img src="<%=request.getContextPath()%>/img/img6.jpg"  />&nbsp;&nbsp;
                        <img src="<%=request.getContextPath()%>/img/img7.jpg"  />&nbsp;&nbsp;
                        <img src="<%=request.getContextPath()%>/img/img4.jpg"  />&nbsp;&nbsp;
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${sessionScope.user==null}">
                                <a href="${pageContext.request.contextPath}/jsp/login.jsp"><font color="#337AB7">登录</font></a>&nbsp;&nbsp;
                                <a href="register.html"><font color="#337AB7">注册</font></a>&nbsp;&nbsp;
                            </c:when>
                            <c:otherwise>
                                欢迎，${sessionScope.user.username}
                                <a href="${pageContext.request.contextPath}/LogoutServlet">退出</a>
                            </c:otherwise>
                        </c:choose>



                        <a href="cart.html"><font color="#337AB7">购物车</font></a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <!-- 第二行：-->
    <tr bgcolor="#808080" height="50px">
        <td>
            <a href=""><font color="white">首页</font></a>&nbsp;&nbsp;
            <a href=""><font color="white">精品手机</font></a>&nbsp;&nbsp;
            <a href=""><font color="white">数码时尚</font></a>&nbsp;&nbsp;
            <a href=""><font color="white">办公设备</font></a>&nbsp;&nbsp;
            <a href=""><font color="white">主板显卡</font></a>&nbsp;&nbsp;
            <a href=""><font color="white">智能设备</font></a>&nbsp;&nbsp;
            <a href=""><font color="white">MacBook</font></a>&nbsp;&nbsp;
        </td>
    </tr>

    <!-- 第三行：存放轮播图-->
    <tr>
        <td>
            <p></p>
            <img id="lunbotu" src="<%=request.getContextPath()%>/img/img8.jpg"  width="100%" height="350px" />
        </td>
    </tr>


    <!-- 第四行：热门商品-->
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td colspan="5">
                        <font size="5">热门商品</font>
                        <img src="<%=request.getContextPath()%>/img/title2.jpg"  />
                    </td>
                </tr>


                <tr align="center">
                     <c:forEach items="${requestScope.remen}" var="p" begin="0" end="4">
                        <td>
                            <a href="${pageContext.request.contextPath}/ProductServlet?method=findProductById&id=${p.pro_id}">
                                <img src="${pageContext.request.contextPath}/${p.pro_min_img}" width="70%"/>
                                <br />
                                <font color="red">￥：${p.shop_price}</font>
                                <br />
                                <span>${p.pro_name}</span>
                            </a>
                        </td>
                     </c:forEach>
                </tr>

                <tr align="center">
                    <c:forEach items="${requestScope.remen}" var="p" begin="5" end="9">
                        <td>
                            <img src="${pageContext.request.contextPath}/${p.pro_min_img}" width="70%"/>
                            <br />
                            <font color="red">￥：${p.shop_price}</font>
                            <br />
                            <span>${p.pro_name}</span>
                        </td>
                    </c:forEach>
                </tr>

                <tr align="center">
                    <c:forEach items="${requestScope.remen}" var="p" begin="10" end="14">
                        <td>
                            <img src="${pageContext.request.contextPath}/${p.pro_min_img}" width="70%"/>
                            <br />
                            <font color="red">￥：${p.shop_price}</font>
                            <br />
                            <span>${p.pro_name}</span>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </td>
    </tr>

    <!-- 第五行： 广告和田玉-->
    <tr>
        <td>
            <img src="<%=request.getContextPath()%>/img/img2.webp" width="100%" />
        </td>
    </tr>

    <!-- 第六行 ： 优选商品-->
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td colspan="5">
                        <font size="5">优选商品</font>
                        <img src="<%=request.getContextPath()%>/img/title2.jpg"  />
                    </td>
                </tr>


                <tr align="center">
                    <c:forEach items="${requestScope.youxuan}" var="p" begin="0" end="4">
                        <td>
                            <img src="${pageContext.request.contextPath}/${p.pro_min_img}" width="70%"/>
                            <br />
                            <font color="red">￥：${p.shop_price}</font>
                            <br />
                            <span>${p.pro_name}</span>
                        </td>
                    </c:forEach>
                </tr>

                <tr align="center">
                    <c:forEach items="${requestScope.youxuan}" var="p" begin="5" end="9">
                        <td>
                            <img src="${pageContext.request.contextPath}/${p.pro_min_img}" width="70%"/>
                            <br />
                            <font color="red">￥：${p.shop_price}</font>
                            <br />
                            <span>${p.pro_name}</span>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </td>
    </tr>

    <!-- 第七行:一张图片-->
    <tr>
        <td>
            <img src="${pageContext.request.contextPath}/img/img1.webp" width="100%" />
        </td>
    </tr>

    <!-- 第八行： 友情链接-->
    <tr align="center">
        <td>
            <p>
                <a href=""><font color="#337AB7">关于我们</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">联系我们</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">联系客服</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">合作招商</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">商家帮助 </font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">营销中心</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">手机帮助</font></a>&nbsp;&nbsp;
                <a href=""><font color="#337AB7">销售联盟</font></a>&nbsp;&nbsp;
            </p>
        </td>
    </tr>

    <!-- 版权信息-->
    <tr align="center">
        <td>
            ©&copy; 2005-2020 东易买 版权所有，并保留所有权利
        </td>
    </tr>

</table>
</body>
</html>


</body>
</html>
