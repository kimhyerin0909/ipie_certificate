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
		<h2>부서별근무일수집계</h2>
		<form>
			<table>
				<tr>
					<td>사원번호</td>
					<td>이름</td>
					<td>부서명</td>
					<td>근무일수</td>
				</tr>
				<%
					Class.forName("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					Statement stmt = con.createStatement();
					String sql = "select E.empno, E.empname, E.deptcode, count(R.empno) from tbl_emp_202108 E, tbl_resv_202108 R where R.empno = E.empno group by R.empno, E.empno, E.empname, E.deptcode order by E.deptcode";
					ResultSet rs = stmt.executeQuery(sql);
					while(rs.next()) {
						String dept ="";
						if(Integer.parseInt(rs.getString(3)) == 10) dept = "영업팀";
						else if(Integer.parseInt(rs.getString(3)) == 20) dept = "총무팀";
						else  dept = "구매팀";
						out.print("<tr>");
						out.print("<td>"+rs.getString(1)+"</td>");
						out.print("<td>"+rs.getString(2)+"</td>");
						out.print("<td>"+dept+"</td>");
						out.print("<td>"+rs.getString(4)+"</td>");
						out.print("</tr>");
					}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>