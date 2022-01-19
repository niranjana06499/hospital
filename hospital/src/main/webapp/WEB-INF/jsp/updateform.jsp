<%@page import="java.sql.ResultSet"%>
<%@page import="com.sts.DbConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<title>Add User</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">

				

				<h1>Update</h1>
				<%
					int id = Integer.parseInt(request.getParameter("id"));
					DbConn db = new DbConn();
					ResultSet rs = db.displayuser(id);
					while(rs.next()){
					
				%>

				<form action="/updateuseraction?id=<%=id%>" >
				<div class="form-group">
						<label class="control-label" for="id"> ID </label>
						<input id="id" class="form-control" name="id" value="<%=rs.getString(1) %>"
							required autofocus="autofocus" />
					</div>
					<div class="form-group">
						<label class="control-label" for="firstName"> Name </label>
						<input id="Name" class="form-control" name="name" value="<%=rs.getString(2) %>"
							required autofocus="autofocus" />
					</div>

					<div class="form-group">
						<label class="control-label" for="emailid"> Email </label> <input
							id="emailid" class="form-control" name="emailid" value="<%=rs.getString(3) %>"
							required autofocus="autofocus" />
					</div>

					<div class="form-group">
						<label class="control-label" for="phone"> Phone </label> <input type="text"
							id="phone" class="form-control" name="phone" value="<%=rs.getString(4) %>" required
							autofocus="autofocus" />
					</div>

					<div class="form-group">
						<label class="control-label" for="address"> Address </label> <input
							id="address" class="form-control" name="address"
							value="<%=rs.getString(5) %>" required autofocus="autofocus" />
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-success">Save</button>
						
					</div>
					<%
					
					}
					%>
				</form>
			</div>
		</div>
	</div>

</body>
</html>