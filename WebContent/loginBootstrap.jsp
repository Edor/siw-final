<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<style type="text/css">
body {
	padding-top: 90px;
}

.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
}

.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align: center;
}

.panel-login>.panel-heading a {
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login>.panel-heading a.active {
	color: #029f5b;
	font-size: 18px;
}

.panel-login>.panel-heading hr {
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0) );
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0) );
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0) );
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0) );
}

.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"]
	{
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-login input:hover,.panel-login input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 16px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}

.btn-login:hover,.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}

.mail1 {
	font: bold 18px Arial;
	color: #53A3CD;
}

.black3 {
	font: bold 26px Comic Sans MS;
	color: #53A3CD;
}
</style>

<title>Book Shop - Login</title>
</head>
<body>
	<f:view>
		<div class="black3">
			<div class="text-center">Log In</div>
		</div>
		<div class="container">

			<div class="col-md-6 col-md-offset-3">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<h:form id="login-form" style="display: block;">

								<div class="form-group">
									<h:outputLabel for="email" value="E-mail" styleClass="mail1" />
									<h:inputText value="#{sessionController.email}" id="email"
										required="true" styleClass="form-control" tabindex="1"
										label="email" requiredMessage="This field is mandatory" />
									<div align="right" style="widows: inherit;" >

										<h:message for="email" styleClass="alert alert-danger" />
									</div>
								</div>
								<div class="form-group">
									<h:outputLabel for="password" value="Password"
										styleClass="mail1" />
									<h:inputSecret value="#{sessionController.password}"
										id="password" required="true" styleClass="form-control"
										tabindex="1" label="password"
										requiredMessage="This field is mandatory" />
									<h:message for="password" styleClass="alert alert-danger" />
								</div>
								<div class="form-group text-center">
									<input type="checkbox" tabindex="3" class="" name="remember"
										id="remember"> <label for="remember"> Remember
										Me</label>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<h:commandButton action="#{sessionController.doLogin}"
												styleClass="form-control btn btn-login" tabindex="4"
												value="Log In" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12"></div>
									</div>
								</div>
							</h:form>
						</div>
					</div>
				</div>
			</div>
		</div>


	</f:view>

	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</body>
</html>