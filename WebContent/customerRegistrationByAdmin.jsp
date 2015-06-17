<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - New customer</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<h:form id="registrationCustomerByAdmin" styleClass="form-horizontal">
				<h:message for="signinCustomerByAdmin" styleClass="error alert alert-danger" />
				<div>
					<h2>Registration</h2>
				</div>
				<div class="form-group">
					<label for="firstName"
						class="col-sm-1 control-label col-lg-offset-3">First name</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.firstName}"
							required="true" requiredMessage="This field is mandatory" id="firstName"
							styleClass="form-control" />
						<h:message for="firstName" style="color:red" />
					</div>
					<label for="lastName" class="col-sm-1 control-label">Last name</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.lastName}"
							required="true" requiredMessage="This field is mandatory" id="lastName"
							styleClass="form-control" />
						<h:message for="lastName" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-1 control-label col-lg-offset-3">E-mail</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.email}" required="true"
							requiredMessage="This field is mandatory" id="email" styleClass="form-control" />
						<h:message for="email" style="color:red" />
					</div>
					<label for="password" class="col-sm-1 control-label">Password</label>
					<div class="col-sm-2">
						<h:inputSecret value="#{administratorController.passwordCustomer}"
							required="true" requiredMessage="This field is mandatory" id="password"
							styleClass="form-control" />
						<h:message for="password" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="dateOfBirth"
						class="col-sm-1 control-label col-lg-offset-3">Day of birth</label>
					<div class="col-sm-2">
						<h:dataTable value="#{administratorController.dateOfBirth}"
							styleClass="form-control" />
						<h:message for="dateOfBirth" style="color:red" />
					</div>
					<label for="phoneNumber" class="col-sm-1 control-label">Phone</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.phoneNumber}"
							required="true" requiredMessage="This field is mandatory" id="phoneNumber"
							styleClass="form-control" />
						<h:message for="phoneNumber" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="street" class="col-sm-1 control-label col-lg-offset-3">Street</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.street}" required="true"
							requiredMessage="This field is mandatory" id="address_street" styleClass="form-control" />
						<h:message for="address_street" style="color:red" />
					</div>
					<label for="zipcode" class="col-sm-1 control-label">Zip code</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.zipcode}" required="true"
							requiredMessage="This field is mandatory" id="address_zipcode"
							styleClass="form-control" />
						<h:message for="address_zipcode" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_city"
						class="col-sm-1 control-label col-lg-offset-3">City</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.city}" required="true"
							requiredMessage="This field is mandatory" id="address_city" styleClass="form-control" />
						<h:message for="address_city" style="color:red" />
					</div>
					<label for="address_country" class="col-sm-1 control-label">Country</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.country}" required="true"
							requiredMessage="This field is mandatory" id="address_country"
							styleClass="form-control" />
						<h:message for="address_country" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="address_state"
						class="col-sm-1 control-label col-lg-offset-3">State</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.state}" required="true"
							requiredMessage="This field is mandatory" id="address_state" styleClass="form-control" />
						<h:message for="address_state" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-3">
						<h:commandButton styleClass="btn btn-primary" id="signinCustomerByAdmin"
							value="Register" action="#{administratorController.createCustomer}" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>