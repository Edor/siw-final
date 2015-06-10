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
				<h:inputText value="#{userController.firstName}" required="true"
					requiredMessage="Your name is mandatory" id="firstName" />
				<h:message for="firstName" />
				<br> Last Name
				<h:inputText value="#{userController.lastName}" required="true"
					requiredMessage="Your last name is mandatory" id="lastName" />
				<h:message for="lastName" />
				<br> Middle Name
				<h:inputText value="#{userController.middleName}" required="false"
					id="middleName" />
				<br>Email
				<h:inputText value="#{userController.email}" required="true"
					requiredMessage="This field is mandatory" id="email" />
				<h:message for="email" />
				<br> Password:
				<h:inputSecret value="#{userController.password}" required="true"
					requiredMessage="This field is mandatory" id="password" />
				<h:message for="password" />
				<br>
				<br> Address:
				<h:inputText value="#{userController.shippingAddress}"
					required="false" id="shippingAddress" />
				<br>
				<br>
				<h:commandButton value="Submit"
					action="#{usersController.createUser}" />
			</div>

		</h:form>
	</f:view>
</body>
</html>