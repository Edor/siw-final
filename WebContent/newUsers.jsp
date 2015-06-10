<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - Registration</title>
</head>
<body>
	<f:view>
		<h:form>
			<div align="center">
				First Name:
				<h:inputText value="#{usersController.firstName}" required="true"
					requiredMessage="First Name is mandatory" id="firstName" />
				<h:message for="firstName" />
			<br>
		
				Last Name
				<h:inputText value="#{usersController.lastName}" required="true"
					requiredMessage="Last Name is mandatory" id="lastName" />
				<h:message for="lastName" />
			
			<br>
			
				Middle Name
				<h:inputText value="#{usersController.middleName}" required="false"
					id="middleName" />
			
			<br>Email
				<h:inputText value="#{usersController.email}" required="true"
					requiredMessage="email is mandatory" id="email" />
				<h:message for="email" />
			<br>
				Password:
				<h:inputSecret value="#{usersController.password}" required="true"
					requiredMessage="password is mandatory" id="password" />
				<h:message for="password" />
			<br><br>

		
				Address:
				<h:inputText value="#{usersController.shippingAddress}" required="false" id="shippingAddress" />

			<br><br>
				<h:commandButton value="Submit"
					action="#{usersController.createUser}" />
			</div>
			
		</h:form>
	</f:view>
</body>
</html>