<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약조회</title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkValue() {
		if(!document.data.resvno.value){
			alert("예약번호가 입력되지 않았습니다.");
			data1.resvno.focus();
			return false;
		}
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
<section class="section">
	<h2>백신예약조회</h2>
	<form action="search_list.jsp" method="post" name="data" onsubmit="return checkValue()">
		<table border = "1" style="margin-left: auto; margin-right: auto; border-collapse: collapse; width : 600px;">
			<tr>
				<th>예약번호</th>
				<td><input type="text" name="resvno"></input></td>
			</tr>
			<tr>
				<td colspan = "2" style="text-align:center;">
					<input type="submit" value="조회하기"></input>
					<input type="button" value="홈으로" onclick="location.href='index.jsp'"></input>
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