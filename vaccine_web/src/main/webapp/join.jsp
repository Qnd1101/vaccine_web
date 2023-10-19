<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
	String sql = "select max(resvno) as 예약번호 from tbl_vaccresv_202108";
	Connection conn = DBConnect.getConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	rs.next();
	
	int num = rs.getInt("예약번호") + 1;
%>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.jumin.value){
			alert("주민번호가 입력되지 않았습니다.");
			data.jumin.focus();
			return false;
		}else if(!document.data.hospcode.value){
			alert("백신코드가 입력되지 않았습니다.");
			data.hospcode.focus();
			return false;
		}else if(!document.data.resvdate.value){
			alert("병원코드가 입력되지 않았습니다.");
			data.resvdate.focus();
			return false;
		}else if(!document.data.resvtime.value){
			alert("예약날짜가 입력되지 않았습니다.");
			data.resvtime.focus();
			return false;
		}else if(!document.data.vcode.value){
			alert("백신코드가 입력되지 않았습니다.");
			data.vcode.focus();
			return false;
		}
		
		alert("등록이 완료되었습니다.")
		return true;
	}
</script>
</head>
<body>
<header>
	<jsp:include page ="layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page ="layout/nav.jsp"></jsp:include>
</nav>
<section class = "section">
	<h2>백신 예약</h2>
	<form action="join_p.jsp" method="post" name ="data" onsubmit="return checkValue()">
		<table border = "1" style="margin-left: auto; margin-right: auto; border-collapse: collapse; width : 700px; height : 280px;">
			<tr>
				<th>예약번호</th>
				<td><input type="text" name="resvno" size = "30" value="<%= num %>" readonly></input> &nbsp예)20210011</td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td><input type="text" name="jumin" size = "30"></input> &nbsp예)790101-11111111</td>
			</tr>
			<tr>
				<th>백신코드</th>
				<td>
				<select name = "vcode" style="width : 100px;">
					<option value="V001">A백신</option>
					<option value="V002">B백신</option>
					<option value="V003">C백신</option>
				</select>
				&nbsp예)V001, V002, V003
				</td>
				
			</tr>
			<tr>
				<th>병원코드</th>
				<td>
				<input type="radio" name="hospcode" value="H001">H001</input>&nbsp
				<input type="radio" name="hospcode" value="H002">H002</input>&nbsp
				<input type="radio" name="hospcode" value="H003">H003</input>&nbsp
				<input type="radio" name="hospcode" value="H004">H004</input>
				</td>
			</tr>
			<tr>
				<th>예약날짜</th>
				<td><input type="text" name="resvdate" size = "30"></input> &nbsp예)20210101</td>
			</tr>
			<tr>
				<th>예약시간</th>
				<td><input type="text" name="resvtime" size = "30"></input> &nbsp예)0930, 1130</td>
			</tr>
			<tr>
				<td colspan ="2" style = "text-align : center;">
					<input type="submit" value="등록" style="width: 55px; height : 26px;"></input>&nbsp
					<input type="button" value="취소" style="width: 55px; height : 26px;" onclick="location.href='join.jsp'"></input>
				</td>
			</tr>
		</table>
	</form>
</section>
<footer>
	<jsp:include page ="layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>