<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="" method="POST">
<h2>login</h2>
username:<input type="text" name="username">
password:<input type="password" name="password">
<input type="checkbox">Remember Me
<input type="submit" name="submit">
</form>
<%
if(request.getParameter("submit") !=null)
{
String names=request.getParameter("usename");	
String gender=request.getParameter("password");	
String url="jdbc:mysql://localhost:3306/emp_22rp04719";
String user="root";
String pass="";
PreparedStatement=null;
ResultSet=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(url,user,pass);
	sql="select * from users where username=? AND password=?";
	pstmt= conn.PreparedStatement(sql);
	pstmt.setString(1,username);
	pstmt.setString(2,password);
	rs=pstmt.executeQuery();
if(rs.next()){
	HttpSession session =request.getSession();
	session.setAttribute("username",username);
	out.println("<p>welcome"+username+"</p>");
	response.sendRedirect("dashboard.jsp");


	else
	{
		out.println("<p>invalid username or password");
	}}catch(Exception e){
		out.println("<h3>error:"+e.getMessage+"</h3>");
	}
	finally{
		if(rs !=null)try{rs.close();}catch(SQLException e){}
		if(pstmt !=null)try{pstmt.close();}catch(SQLException e){}
		if(conn !=null)try{conn.close();}catch(SQLException e){}
		}
		
		
	}

	


	
	

%>
</body>
</html>