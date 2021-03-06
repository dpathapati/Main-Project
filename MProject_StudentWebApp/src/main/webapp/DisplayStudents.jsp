<%@page import="com.dxc.Hibservice.StudentHibServiceImple"%>
<%@page import="java.util.List"%>
<%@page import="com.dxc.beans.Student"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>student details</title>
</head>
<body>

	<%
		session = request.getSession(false);
	if (session != null && session.getAttribute("usnme") != null) {
		String username = (String) session.getAttribute("usnme");
	%>
	<h2 align='center'>
		welcome
		<%=username%></h2>

	<%
		try {
		List<Student> students = new StudentHibServiceImple().findAll();
	%>
	<table border='1' align='center'>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>DOB</th>
			<th>EMAIL</th>
			<th>MOBILE</th>
			<th>EDIT/DELETE</th>
		</tr>
		<%
			for (Student student : students) {
		%>
		<tr>
			<td><%=student.getId()%></td>
			<td><%=student.getName()%></td>
			<%
				SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			%>
			<td><%=sdf.format(student.getDob())%></td>
			<td><%=student.getEmail()%></td>
			<td><%=student.getMobile()%></td>
			
			<td>
			
			&nbsp;<a href="edit.jsp?id=<%= student.getId() %>">edit</a>&emsp;
			<a href="delete?id=<%= student.getId() %>" >delete</a>
			</td>
		</tr>
		<%
			}
		} finally {

		}
		%>
		<%
			} else{
				response.sendRedirect("login.jsp");
			
			}
		%>

	</table>
	<a href="addStudent1.jsp">Add Student</a>
	
	<form action="logout" method="get">
	   <input type="submit" value="logout">
	</form>
	
</body>
</html>