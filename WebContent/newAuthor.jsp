<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - New Author</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<h1>Registration Author</h1>
			<h:form id="addauthor" styleClass="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-sm-1 control-label col-lg-offset-3">First
						Name</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.firstName}" required="true"
							requiredMessage="This field is mandatory" id="firstName" />
						<h:message for="firstName" style="color:red" />
					</div>
					<label for="lastName" class="col-sm-1 control-label">Last
						Name</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.lastName}" required="true"
							requiredMessage="This field is mandatory" id="lastName" />
						<h:message for="lastName" style="color:red" />
					</div>
					<label for="middleName" class="col-sm-1 control-label">Middle
						Name</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.middleName}" required="false"
							id="middleName" />
					</div>
				</div>


				<div class="form-group">
					<label for="code" class="col-sm-1 control-label col-lg-offset-3">Code</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.code}" required="true"
							requiredMessage="This field is mandatory" id="code" />
						<h:message for="code" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton styleClass="btn btn-primary" id="addAuthor"
							value="Salva" action="#{authorController.createAuthor}" />
						<h:message for="addAuthor" styleClass="error" style="color:red" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>