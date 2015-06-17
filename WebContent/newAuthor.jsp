<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - New Author</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<h1>Inserimento author</h1>
			<h:form id="addauthor" styleClass="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-sm-1 control-label col-lg-offset-3">First
						name</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.firstName}" required="true"
							requiredMessage="This field is mandatory" id="name" />
						<h:message for="name" style="color:red" />
					</div>
					<label for="lastName" class="col-sm-1 control-label">Last name</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.lastName}" required="true"
							requiredMessage="This field is mandatory" id="lastName" />
						<h:message for="lastName" style="color:red" />
					</div>
				</div>


				<div class="form-group">
					<label for="code" class="col-sm-1 control-label col-lg-offset-3">ID</label>
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
							value="Save" action="#{authorController.createAuthor}" />
						<h:message for="addAuthor" styleClass="error" style="color:red" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>