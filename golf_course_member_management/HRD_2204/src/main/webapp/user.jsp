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
				<td>수강일</td>
				<td>회원번호</td>
				<td>회원명</td>
				<td>강의명</td>
				<td>강의장소</td>
				<td>수강료</td>
				<td>등급</td>
			</tr>
			<%
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select * from tbl_class_202201, tbl_member_202201 where tbl_class_202201.c_no = tbl_member_202201.c_no");
					while (rs.next()) {
						String className = rs.getString(5);
						String grade = rs.getString(6);
						
						int id = Integer.parseInt(className);
						int rgrade = Integer.parseInt(grade);
						
						if(id == 100) className = "초급반";
						else if(id == 200) className = "중급반";
						else if(id == 300) className = "고급반";
						else if(id == 400) className = "심화반";

						if(rgrade < 20000) {
							grade = "일반";
						}
						else if(rgrade >= 20000) grade = "VIP";
						out.print("<tr>");
						out.println("<td>" + rs.getString(1).substring(0, 4) + "년" + rs.getString(1).substring(4) + "월" + "</td>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(7) + "</td>");
						out.println("<td>" + className + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>" +"₩" + rs.getString(4) + "</td>"); 
						out.println("<td>" + grade + "</td>"); 
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