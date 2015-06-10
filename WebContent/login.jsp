<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Shop - Login</title>
</head>
<body>
	<f:view>
		<h:form>
			<br>Email
				<h:inputText value="#{loginController.email}" required="true"
				requiredMessage="This field is mandatory" id="email" />
			<h:message for="email" />
			<br> Password:
				<h:inputSecret value="#{loginController.password}" required="true"
				requiredMessage="This field is mandatory" id="password" />
			<h:message for="password" />
			<h:commandButton value="Submit" action="#{loginController.doLogin}" />
		</h:form>
	</f:view>
</body>
</html>