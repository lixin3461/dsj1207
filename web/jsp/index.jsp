<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
   <%-- 让当前的index.jsp直接访问Servlet查询商品信息--%>
    <%
      response.sendRedirect(request.getContextPath()+"/ProductServlet?method=findAll");
    %>
</body>
</html>
