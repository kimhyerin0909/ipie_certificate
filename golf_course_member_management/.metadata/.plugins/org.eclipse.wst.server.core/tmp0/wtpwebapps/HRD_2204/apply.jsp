<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
		<form action="action.jsp" name="form">
			<input type="hidden" name="mode" value="insert" />
			<table>
				<tr>
					<td>수강월</td>
					<td><input name="month" type="text" id="month"/> 2022년03월 예)202203</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td>
						<select onchange="handleUserInfo()" name="user_name" id="user_name">
							<option value="0">회원명</option>
							<option value="10001">홍길동</option>
							<option value="10002">장발장</option>
							<option value="10003">임꺽정</option>
							<option value="20001">성춘향</option>
							<option value="20002">이몽룡</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>회원번호</td>
					<td><input name="user_id" type="text" id="user_id" readonly/>예)10001</td>
				</tr>
				<tr>
					<td>강의장소</td>
					<td>
						<select id="place" name="place">
							<option value="0">강의장소</option>
							<option value="서울본원">서울본원</option>
							<option value="성남분원">성남분원</option>
							<option value="대전분원">대전분원</option>
							<option value="부산분원">부산분원</option>
							<option value="대구분원">대구분원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>강의명</td>
					<td>
						<select id="class_name" name="class_name" onchange="handleCost()">
							<option value="0">강의명</option>
							<option value="100">초급반</option>
							<option value="200">중급반</option>
							<option value="300">고급반</option>
							<option value="400">심화반</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>수강료</td>
					<td><input type="text" id="class_cost" name="class_cost" readonly/>원</td>
				</tr>
				<tr>
					<td>
						<button type="submit" onclick="return applyClass()">수강신청</button>
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