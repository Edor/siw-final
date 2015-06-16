<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Nuovo Author</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<h1>Inserimento author</h1>
			<h:form id="addauthor" styleClass="form-horizontal">
				<div class="form-group">
					<label for="name" class="col-sm-1 control-label col-lg-offset-3">First
						Name</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.firstName}" required="true"
							requiredMessage="Campo obbligatorio" id="name" />
						<h:message for="name" style="color:red" />
					</div>
					<label for="lastName" class="col-sm-1 control-label">lastName</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.lastName}" required="true"
							requiredMessage="Campo obbligatorio" id="lastName" />
						<h:message for="lastName" style="color:red" />
					</div>
				</div>


				<div class="form-group">
					<label for="code" class="col-sm-1 control-label col-lg-offset-3">codice</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{authorController.code}" required="true"
							requiredMessage="Campo obbligatorio" id="code" />
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