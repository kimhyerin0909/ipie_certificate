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
		<table>
			<tr>
				<td>강사코드</td>
				<td>강의명</td>
				<td>강사명</td>
				<td>총매출</td>
			</tr>
			<%
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select T.teacher_code, T.class_name, T.teacher_name, sum(class_price) from tbl_teacher_202201 T, tbl_class_202201 C where T.teacher_code = C.teacher_code group by T.teacher_code, T.class_name, T.teacher_name order by T.teacher_code");
					while (rs.next()) {
						out.print("<tr>");
						out.println("<td>" + rs.getString(1) + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>"+"₩" + rs.getString(4) + "</td>");
						out.print("</tr>");
					}
					stmt.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>