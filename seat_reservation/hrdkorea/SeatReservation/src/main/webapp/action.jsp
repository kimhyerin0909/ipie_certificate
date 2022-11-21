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
	<%
		request.setCharacterEncoding("UTF-8");
		String mode = request.getParameter("mode");
		String resvNum = request.getParameter("resvnum");
		String empNum = request.getParameter("empnum");
		String workday = request.getParameter("workday");
		String seatNum = request.getParameter("seatnum");
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
			Statement stmt = con.createStatement();
			String sql ="";
			switch(mode) {
				case "insert" :
					sql = "insert into tbl_resv_202108 values ('"+resvNum+"', '"+empNum+"', '"+workday+"', '"+seatNum+"')";
					stmt.executeUpdate(sql);
					%><jsp:forward page="list.jsp" /> <%
				case "select" :
					sql = "select E.empno, E.empname, R.resvdate, R.seatno, S.office, S.callno from tbl_emp_202108 E, tbl_seat_202108  S, tbl_resv_202108 R where R.empno ="+empNum+" and E.empno = R.empno and S.seatno = R.seatno";
					ResultSet rs = stmt.executeQuery(sql);
					if(rs.next()) {
						out.print("<h2>사원번호 : "+empNum+"님의 좌석예약조회</h2>");
						%>
						<form>
							<table>
								<tr>
									<td>사원번호</td>
									<td>이름</td>
									<td>근무일자</td>
									<td>좌석번호</td>
									<td>좌석위치</td>
									<td>내선번호</td>
								</tr>
								<%
									do {
									 	out.print("<tr>");
										out.print("<td>"+rs.getString(1)+"</td>");
										out.print("<td>"+rs.getString(2)+"</td>");
										out.print("<td>"+rs.getString(3).substring(0, 4)+"년"+rs.getString(3).substring(4, 6)+"월"+rs.getString(3).substring(6, 8)+"일"+"</td>");
										out.print("<td>"+rs.getString(4)+"</td>");
										out.print("<td>"+rs.getString(5)+"</td>");
										out.print("<td>"+rs.getString(6)+"</td>");
								 		out.print("</tr>");
									} while(rs.next());
								%>
							</table>
						</form>
						<%
					} else {
						System.out.println("data is empty");
						out.print("<h2>좌석예매 정보가 존재하지 않습니다.</h2>");
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<button onclick="location.href='list.jsp'">돌아가기</button>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="check.js"></script>
</body>
</html>