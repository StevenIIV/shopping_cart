<%@page import="com.util.BaseDao"%>
<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.service.*" import="com.until.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
change c=new change();
int res;
String id = request.getParameter("id");  
//out.print(id);
try {
	res=c.input(Integer.valueOf(id));
} catch (Exception e) {
	e.printStackTrace();
}
c.close();
response.sendRedirect("shopping.jsp");
%>
</body>
</html>