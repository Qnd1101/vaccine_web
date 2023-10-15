<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
	String sql = "insert into tbl_vaccresv_202108 values(?, ?, ?, ?, ?, ?)";
	Connection conn = DBConnect.getConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setInt(1, Integer.parseInt(request.getParameter("resvno")));
	ps.setString(2, request.getParameter("jumin"));
	ps.setString(6, request.getParameter("vcode"));
	ps.setString(3, request.getParameter("hospcode"));
	ps.setString(4, request.getParameter("resvdate"));
	ps.setInt(5, Integer.parseInt(request.getParameter("resvtime")));
	
	ps.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="join.jsp"></jsp:forward>
</body>
</html>