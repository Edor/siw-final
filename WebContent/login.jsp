<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - Login Customer</title>
</head>

<body>
	<f:view>
		<!-- Menu' di testa -->
		<jsp:include page="header.jsp" />
		<!-- -------------- -->
		<div align="center">
			<h:form id="loginCustomer" styleClass="form-horizontal">
				<h:message for="logIn" styleClass="error alert alert-danger" />
				<div>
					<h2>Login</h2>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-1 control-label col-lg-offset-4">Email</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.email}" required="true"
							requiredMessage="L'email e' obbligatoria!" id="email"
							styleClass="form-control" />
						<h:message for="email" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="password"
						class="col-sm-1 control-label col-lg-offset-4">Password</label>
					<div class="col-sm-2">
						<h:inputSecret value="#{customerController.password}"
							required="true" requiredMessage="La password e' obbligatoria!"
							id="password" styleClass="form-control" />
						<h:message for="password" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton styleClass="btn btn-primary" id="logIn"
							value="Log In" action="#{customerController.loginCustomer}" />
					</div>
				</div>
				<div>
					<h4>
						<a href='<c:url value="customerRegistration.jsp" />'>Sign up!</a>
					</h4>
				</div>
			</h:form>
		</div>
	</f:view>
</body>

</html>

