<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - Delete a customer</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<h:form id="deletingCustomer" styleClass="form-horizontal">
				<h:message for="deleteCustomer"
					styleClass="error alert alert-danger" />
				<div>
					<h2>Delete a customer</h2>
					<h5>Insert a valid e-mail address to delete the relative user.
					WARNING: this operation is not reversible!</h5>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-1 control-label col-lg-offset-4">Email</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.email}"
							required="true"
							requiredMessage="L'email è obbligatoria per eseguire l'operazione!"
							id="email" styleClass="form-control" />
						<h:message for="email" />
					</div>
				</div>
				<div></div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton styleClass="btn btn-primary" id="deleteCustomer"
							value="Elimina cliente"
							action="#{administratorController.deleteCustomer}" />
					</div>
				</div>
			</h:form>
		</div>
	</f:view>
</body>
</html>