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
		<h2>근무좌석예약</h2>
		<form action="action.jsp" name="frm">
			<input type="hidden" value="insert" name="mode"/>
			<table>
				<tr>
					<td>예약번호</td>
					<td><input type="number" name="resvnum" id="resvnum"/><span>예) 20210001</span></td>
				</tr>
				<tr>
					<td>사원번호</td>
					<td><input type="number" name="empnum" id="empnum"/><span>예) 1001</span></td>
				</tr>
				<tr>
					<td>근무일자</td>
					<td><input type="number" name="workday" id="workday"/><span>예) 20211231</span></td>
				</tr>
				<tr>
					<td>좌석번호</td>
					<td><input type="text" name="seatnum" id="seatnum"/><span>예) S001 ~ S009</span></td>
				</tr>
				<tr>
					<td>
						<button type="submit" onclick="return isEmptyData()">등록</button>
						<button type="reset">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="check.js"></script>
</body>
</html>