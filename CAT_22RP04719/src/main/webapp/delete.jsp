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

String id=request.getParameter("id_22rp04719");
String message="";
if(id !=null){
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pass);
		String sql="delete from employee where id_22rp04719=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		int rowsAffected=pstmt.executeUpdate();
		if(rowsAffevted>0){
			message="employee deleted successfully";
		}else{
			message="employee not found";
		}
	}
		catch(Exception e){
			message="error"+e.getMessage();
		
	}
	finally{
		try{
		if(pstmt !=null)pstmt.close();
		if(conn !=null)conn.close();
	}
		catch(SQLEexception e){
			e.printStackTrace();
		}
	}
}



%>
</body>
</html>