
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Shop - Main page</title>
</head>
<body>
	<f:view>
	
		<h:form>
			<h1 align="center">Logged as: ${loginController.loggedInEmail}</h1>
			<ul>
				<li><a href="newUserBootstrap.jsp">Sign up!</a></li>
			</ul>
			<ul>
				<li><a href="loginBootstrap.jsp">Log in</a></li>
			</ul>
			<ul>
				<li><a href="newBook.jsp">Insert a new book in the database</a></li>
			</ul>
			<ul>
				<li><h:commandLink action="#{bookController.listBooks}"
						value="Complete book list" /></li>
			</ul>

		</h:form>
	</f:view>
</body>
</html>