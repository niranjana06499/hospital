<%@page import="java.sql.ResultSet"%>
<%@page import="com.sts.DbConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Customer</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Patient Details</h2>  
  <form action="/addform" method="post">
  	<div class="form-group">
						<button type="submit" class="btn btn-success">Add New Customer</button>
						
					</div>
  </form>          
  <table class="table table-hover">
  
    <thead>
      <tr>
      	<th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Action</th>
      </tr>
    </thead>
    <%
  	DbConn db = new DbConn();
  	ResultSet rs = db.display();
  	while(rs.next()){
  		int id = rs.getInt(1);
  %>
    <tbody>
      <tr>
        <td><%=rs.getInt(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        <td><%=rs.getString(4) %></td>
        <td><%=rs.getString(5) %></td>
        <td><a href="/delete/<%=id%>">Delete</a> <br> <a href="/updateform?id=<%=id%>">Update</a> 
        <br> <a href="/addrecordform?id=<%=id%>">View Records</a> 
        </td>
      </tr>
      
    </tbody>
    <%
  	}
    %>
  </table>
</div>

</body>
</html>