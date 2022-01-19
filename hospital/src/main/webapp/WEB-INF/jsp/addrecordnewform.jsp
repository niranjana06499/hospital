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

				

				<h1>Add New record</h1>
				<%
					int id = Integer.parseInt(request.getParameter("id"));
					
					
				%>

				<form action="/addrecordaction?id=<%=id%>" >
				<div class="form-group">
						<label class="control-label" for="id"> ID </label>
						<input id="id" class="form-control" name="id" value="<%=id %>"
							required autofocus="autofocus" />
					</div>
					<div class="form-group">
						<label class="control-label" for="date"> Date </label>
						<input id="date" class="form-control" name="date" type="date"
							required autofocus="autofocus" />
					</div>

					<div class="form-group">
						<label class="control-label" for="tablet"> Tablet </label> <input
							id="tablet" class="form-control" name="tablet"
							required autofocus="autofocus" />
					</div>


					<div class="form-group">
						<label class="control-label" for="doctor"> Doctor </label> <input
							id="doctor" class="form-control" name="doctor"
							 required autofocus="autofocus" />
					</div>
					<div class="form-group">
						<label class="control-label" for="disease"> Disease </label> <input
							id="disease" class="form-control" name="disease"
							 required autofocus="autofocus" />
					</div>
					<div class="form-group">
						<label class="control-label" for="nextvisit"> Next Visit </label>
						<input id="nextvisit" class="form-control" name="nextvisit" type="date"
							required autofocus="autofocus" />
					</div>

					<div class="form-group">
						<button type="submit" class="btn btn-success">Save</button>
						
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>
</html>