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
<%
String url="jdbc:mysql://localhost:3306/emp_22rp04719";
String user="root";
String pass="";
Connection conn=null;
preparedStatement pstmt=null;
ResultSet rs=null;
String id=request.getParameter("id_22rp04719");
String currentnames="";
String currentgender="";
String currentage="";
String currentemail="";
String currentdepartment="";
try{
Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection(url,user,pass);
String sql="select * from employee where id_22rp04719=?";
pstmt=conn.prepareStatement(sql);
rs=pstmt.executeQuery();

if(rs.next()){
	currentname=rs.getString("names_22rp04719");
	currentgender=rs.getString("gender_22rp04719");
	currentage=rs.getString("age_22rp04719");
	currentemail=rs.getString("email_22rp04719");
	currentdepartment=rs.getString("department_22rp04719");
	
}
}catch(Exception e)
{
out.println("error"+e.getMessage());
}finally{
	try{
		if(pstmt !=null)pstmt.close();
		if(rs !=null)rs.close();
		if(conn !=null)conn.close();
	}catch(SQLException e){
		e.printStackTrace();
		
		
		
	}
}
if(reguest.getParameter("update" !=null)){
	String newNames=request.getParameter("names");
	String newGender=request.getParameter("gender");
	String newAge=request.getParameter("age");
	String newEmail=request.getParameter("email");
	String newDepartment=request.getParameter("department");
}
try{
	conn=DriverManager.getConnection(url,user,pass);
	String sql="UPDATE employee SET names_22rp04719=?,gender_22rp04719=?,age_22rp04719=?,email_22rp04719_?,department_22rp04719=? where id_22rp04719=?";
	pstmt.prepareStatement(sql);
	pstmt.setString(1,newNames);
	pstmt.setString(2,newGender);
	pstmt.setString(3,newAge);
	pstmt.setString(4,newEmail);
	pstmt.setString(5,newDepartment);
	pstmt.executeUpdate();
	response.sendRedirect("dashboard.jsp");
}catch(Exception e)
{
out.println("error"+e.getMessage());
}finally{
	try{
		if(pstmt !=null)pstmt.close();
		if(rs !=null)rs.close();
		if(conn !=null)conn.close();
	}catch(SQLException e){
		e.printStackTrace();
		
}
}

%>
</body>
</html>