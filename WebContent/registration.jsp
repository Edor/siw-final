<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - Registration</title>
</head>
<body>
	<f:view>
		<!-- Menu' di testa -->
		<jsp:include page="header.jsp" />
		<!-- -------------- -->
		<div align="center">
			<h:form id="registrationCustomer" styleClass="form-horizontal">
				<h:message for="signUpCustomer"
					styleClass="error alert alert-danger" />
				<div>
					<h1>Book Shop - Registration</h1>
				</div>
				<div class="form-group">
					<label for="firstName"
						class="col-sm-1 control-label col-lg-offset-3">First Name</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.firstName}"
							required="true" requiredMessage="Campo Obbligatorio"
							id="firstName" styleClass="form-control" />
						<h:message for="firstName" style="color:red" />
					</div>
					<label for="lastName" class="col-sm-1 control-label">Last
						Name</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.lastName}"
							required="true" requiredMessage="Campo Obbligatorio"
							id="lastName" styleClass="form-control" />
						<h:message for="lastName" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-1 control-label col-lg-offset-3">E-mail</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.email}" required="true"
							requiredMessage="Campo Obbligatorio" id="email"
							styleClass="form-control" />
						<h:message for="email" style="color:red" />
					</div>
					<label for="password" class="col-sm-1 control-label">Password</label>
					<div class="col-sm-2">
						<h:inputSecret value="#{customerController.password}"
							required="true" requiredMessage="Campo Obbligatorio"
							id="password" styleClass="form-control" />
						<h:message for="password" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="dateOfBirth"
						class="col-sm-1 control-label col-lg-offset-3">Date of
						Birth</label>
					<div class="col-sm-2">
						<h:dataTable value="#{customerController.dateOfBirth}"
							styleClass="form-control" />
						<h:message for="dateOfBirth" style="color:red" />
					</div>
					<label for="phoneNumber" class="col-sm-1 control-label">Phone
						Number</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.phoneNumber}"
							required="true" requiredMessage="Campo Obbligatorio"
							id="phoneNumber" styleClass="form-control" />
						<h:message for="phoneNumber" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="street" class="col-sm-1 control-label col-lg-offset-3">Street</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.street}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_street"
							styleClass="form-control" />
						<h:message for="address_street" style="color:red" />
					</div>
					<label for="zipcode" class="col-sm-1 control-label">Zip
						code</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.zipcode}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_zipcode"
							styleClass="form-control" />
						<h:message for="address_zipcode" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_city"
						class="col-sm-1 control-label col-lg-offset-3">City</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.city}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_city"
							styleClass="form-control" />
						<h:message for="address_city" style="color:red" />
					</div>
					<label for="address_country" class="col-sm-1 control-label">Country</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.country}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_country"
							styleClass="form-control" />
						<h:message for="address_country" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_state"
						class="col-sm-1 control-label col-lg-offset-3">State</label>
					<div class="col-sm-2">
						<h:inputText value="#{customerController.state}" required="true"
							requiredMessage="Campo Obbligatorio" id="address_state"
							styleClass="form-control" />
						<h:message for="address_state" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-3">
						<h:commandButton styleClass="btn btn-primary" id="signUpCustomer"
							value="Sign Up!" action="#{customerController.createCustomer}" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>
