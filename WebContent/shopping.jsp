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
// BaseDao db=new BaseDao();
List<Object[]> goodss=new ArrayList<Object[]>();
try {
	goodss=c.showgood();
	//goodss=db.select("SELECT * FROM goods", 4, new Object[]{});
} catch (Exception e) {
	e.printStackTrace();
}
String image_url="",good_name="";
double price=0;
int id=0;
 %>
 <h1>商城:</h1>
 <table>
 <tr>
 <%
 for(int i=0;i<4;i++){
	 if(goodss != null && goodss.size()!=0) image_url=(String)goodss.get(i)[3];
 %>
    <td><img src="<%=image_url %>"></td>
 <%}%>
 </tr>
 <tr>
 <%
  for(int i=0;i<4;i++){
	 if(goodss != null && goodss.size()!=0) {good_name=(String)goodss.get(i)[1];price=(double)goodss.get(i)[2];}
 %>
     <td><%=good_name%>  价格: <%=price %>元</td>
 <%}%>
 </tr>
 <tr>
 <%
  for(int i=0;i<4;i++){
	  if(goodss != null && goodss.size()!=0) id=(int)goodss.get(i)[0];
 %>
      <td><a href='buy.jsp?id=<%=id %>'>buy</a></td>
 <%}%>
 </tr>
 </table>
<br>

<input type="button" value="购物车 " onClick="location.href='shopping_cart.jsp'"><br>
<%c.close();%>
</body>
</html>