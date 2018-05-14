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
<h1> 我的购物车</h1>
<%
change c=new change();
List<Object[]> my_cart=new ArrayList<Object[]>();
List<Object[]> good=new ArrayList<Object[]>();
try {
	my_cart=c.showshopping_cart();
} catch (Exception e) {
	e.printStackTrace();
}
int id=0,good_num=0;
double total_price=0,sum=0;
String image_url="",good_name="";
%>
 <table>
 <%
 for(int i=0;i<my_cart.size();i++){
	 if(my_cart.get(i)!=null){
		 id=(int)my_cart.get(i)[0];
		 good_num=(int)my_cart.get(i)[1];
		 total_price=(double)my_cart.get(i)[2];
		 sum+=total_price;
		 try {
				good=new BaseDao().select("SELECT * FROM goods WHERE id=?", 4, new Object[]{id});
			} catch (Exception e) {
				e.printStackTrace();
			}
		 image_url=(String)good.get(0)[3];
		 good_name=(String)good.get(0)[1];
	 }%>
	 <tr>
	    <td><img src="<%=image_url %>"></td>
	    <td><%=good_name%></td>
	    <td>数量：<%=good_num %></td>
	    <td>总价：<%=total_price %></td>
	    <td><a href='delete.jsp?id=<%=id %>'>delete</a></td>
	 </tr>
 <%}
 %>
 </table>
 <h3>总价：<%=sum %></h3>  
 <%
 c.close();
 %>
</body>
</html>