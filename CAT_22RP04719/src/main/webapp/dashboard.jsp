<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<button><a href="insert.jsp">insert new record</a></button>
</head>
<body>
<center>
<table border="1">
<tr>
<th>id</th>
<th>Names</th>
<th>gender</th>
<th>age</th>
<th>email</th>
<th>department</th>
<th colspan="2">options</th>
</tr>
<%String url="jdbc:mysql://localhost:3306/emp_22rp04719";
String user="root";
String pass="";
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(url,user,pass);
	stmst=conn.createStatement();
	String sql="select * from employee";
	rs=stmt.executeQuery(sql);
	
while(rs.next()){
	int id=rs.getInt("id_22rp04719");
	String name=rs.getString("names_22rp04719");
	String gender=rs.getString("gender_22rp04719");
	String age=rs.getString("age_22rp04719");
	String email=rs.getString("email_22rp04719");
	String department=rs.getString("department_22rp04719");
	
	
}


%>
<tr>
<td><%= id %></td>
<td><%= name %></td>
<td><%= gender %></td>
<td><%= age %></td>
<td><%= email %></td>
<td><%= department %></td>
<td><a href="update.jsp?id_22rp04719=<%=id %>">Update</a></td>
<td><a href="delete.jsp?id_22rp04719=<%=id %>">Delete</a></td>
<%
}
catch(Exception e)
e.printStackTrace();
}
finally{
	try{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
}
%>
</tr>
</table>
</center>
</body>
</html>