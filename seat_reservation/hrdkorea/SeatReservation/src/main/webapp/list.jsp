<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<form action="action.jsp">
			<input type="hidden" value="select" name="mode"/>
			<table>
				<tr>
					<td>사원번호를 입력 하시오.</td>
					<td><input type="number" name="empnum" id="empnum"/></td>
				</tr>
				<tr>
					<td colspan="1">
						<button type="submit" onclick="return inquire()">좌석예약조회</button>
						<button type="button" onclick="location.href = 'index.jsp'">홈으로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="check.js"></script>
</body>
</html>