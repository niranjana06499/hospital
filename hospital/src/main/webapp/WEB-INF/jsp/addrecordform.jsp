<%@page import="java.sql.ResultSet"%>
<%@page import="com.sts.DbConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="ISO-8859-1"><link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<style type="text/css">
	h2{
		color:Lightblue;
	}
</style>
</head>
<body>
<div class="container">
		<div class="row">
			<br><br>
			
<%
					int id = Integer.parseInt(request.getParameter("id"));
					DbConn db = new DbConn();
					ResultSet rs = db.displayuser(id);
					while(rs.next()){
					
				%>
				
  	<div class="form-group">
						<button type="submit" class="btn btn-danger">
						<a href="/addrecordnewform?id=<%=id%>">Add New Record</a>
						</button>
						
					</div>
   
			<br><br>
				<h1>Patient Details:</h1>
				<table>
				
				
					<tr>
					<td><h2>ID: </h2></td>
					<td><h4><%=rs.getInt(1) %></h4></td>
					</tr>
					
					<tr>
					<td><h2>NAME: </h2></td>
					<td><h4> <%=rs.getString(2) %></h4></td>
					</tr>
					
					<tr>
					<td><h2>EMAIL ID: </h2></td>
					<td><h4><%=rs.getString(3) %></h4></td>
					</tr>
					
					<tr>
					<td><h2>PHONE:</h2></td>
					<td><h4> <%=rs.getString(4) %></h4></td>
					</tr>
					
					<tr>
					<td><h2>ADDRESS:</h2></td>
					<td><h4> <%=rs.getString(5) %></h4></td>
					</tr>
					
					
				</table>
				
				
				
				
				
				<%
					}
				%>
				
				<br><br>
				<h2>Medical Records</h2>
				
				<table class="table table-hover">
  
    <thead>
      <tr>
      	<th>ID</th>
        <th>Patient ID</th>
        <th>Date</th>
        <th>Tablets</th>
        <th>Doctor</th>
        <th>Disease</th>
        <th>Next Visit</th>
      </tr>
    </thead>
    <%
  	
  	ResultSet rs1 = db.displayuserrecord(id);
  	while(rs1.next()){
  %>
    <tbody>
      <tr>
        <td><%=rs1.getInt(1) %></td>
        <td><%=rs1.getInt(2) %></td>
        <td><%=rs1.getString(3) %></td>
        <td><%=rs1.getString(4) %></td>
        <td><%=rs1.getString(5) %></td>
        <td><%=rs1.getString(6) %></td>
        <td><%=rs1.getString(7) %></td>
      </tr>
      
    </tbody>
    <%
  	}
    %>
  </table>
				
		
				
</body>
</html>