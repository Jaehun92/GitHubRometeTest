<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
		String user=request.getParameter("user");
		String password=request.getParameter("password");
		String gender=request.getParameter("gender");
		String inter=request.getParameter("inter");
		String grade=request.getParameter("grade");
		String self=request.getParameter("self");
		
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=null;	
	Statement stmt=null;	
	try{
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","KOSMO","KOSMO");
		stmt = conn.createStatement();
		stmt.executeUpdate("INSERT INTO MEMBER VALUES ('"+user+"','"+password+"','"+gender+"','"+inter+"','"+grade+"','"+self+"',NULL)");
					
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		conn.close();
		stmt.close();
		
	}
	RequestDispatcher dispatcher= request.getRequestDispatcher("/Directive/Index.jsp");
	dispatcher.forward(request, response);
%>

</body>
</html>