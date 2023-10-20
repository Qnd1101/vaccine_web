<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
	// 예약번호, 성명, 성별, 병원이름, 예약날짜, 예약시간, 백신코드, 병원지역
	int in_resvno = Integer.parseInt(request.getParameter("resvno"));
	String sql = "select resvno as 예약번호, name as 성명, " 
				+ "case when substr(ju.jumin, 8, 1)='1' then '남' else '여' end as 성별, hospname as 성별, hospname as 병원이름, "
				+ "substr(to_char(resvdate, 'yyyymmdd'), 1, 4) || '년' || substr(to_char(resvdate, 'yyyymmdd'), 5, 2) || '월' || substr(to_char(resvdate, 'yyyymmdd'), 7, 2) || '일' as 예약날짜, "
				+ "substr(to_char(resvtime, 'FM0000'), 1, 2) || ':' || substr(to_char(resvtime, 'FM0000'), 3, 2)  as 예약시간, "
				+ "case when vcode='V001' then 'A백신' when vcode='V002' then 'B백신' else 'C백신' end as 백신코드, "
				+ "case when hospaddr='10' then '서울' when hospaddr='20' then '대전' when hospaddr='30' then '대구' else '광주' end as 병원지역 "
				+ "from tbl_jumin_202108 ju, tbl_hosp_202108 ho, tbl_vaccresv_202108 va "
				+ "where ju.jumin = va.jumin and ho.hospcode = va.hospcode and resvno = " + in_resvno;
	
	Connection conn = DBConnect.getConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();	
%>
<html>
<head>
<meta charset="UTF-8">
<title>예약조회결과</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
	<jsp:include page ="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page ="layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
	<form>
	<% if(rs.next()) { %>
	
	<h2>예약번호 <%= request.getParameter("resvno") %>님의 예약 조회</h2>
	<table border = "1" style="margin-left: auto; margin-right: auto; border-collapse: collapse; text-align : center; width : 870px;">
		<tr>
			<th>예약번호</th>
			<th>성명</th>
			<th>성별</th>
			<th>병원이름</th>
			<th>예약날짜</th>
			<th>예약시간</th>
			<th>백신코드</th>
			<th>병원지역</th>
		</tr>
		<tr>
			<td><%= rs.getString("예약번호") %></td>
			<td><%= rs.getString("성명") %></td>
			<td><%= rs.getString("성별") %></td>
			<td><%= rs.getString("병원이름") %></td>
			<td><%= rs.getString("예약날짜") %></td>
			<td><%= rs.getString("예약시간") %></td>
			<td><%= rs.getString("백신코드") %></td>
			<td><%= rs.getString("병원지역") %></td>
		</tr>
	</table>
	<br>
	<div style ="text-align:center;">
		<input type="button" value="돌아가기" onclick="location.href='search.jsp'"></input>
	</div>
	<% } else { %>
		<h2>예약번호 <%= in_resvno %>로 조회된 결과가 없습니다.</h2><br><br>
		<div style ="text-align:center;">
			<input type="button" value="홈으로" onclick="location.href='index.jsp'"></input>
		</div>
	<% } %>
	</form>
</section>
<footer>
	<jsp:include page ="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>
