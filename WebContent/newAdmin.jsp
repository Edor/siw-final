<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<f:view>
		<jsp:include page="header.jsp" />
		<h:form id="signinAdmin" styleClass="form-horizontal">
				<h:message for="signinAdmin" styleClass="error alert alert-danger" />
				<div>
					<h1>Registrazione admin</h1>
				</div>
<div class="form-group">
					<label for="nickname"
						class="col-sm-1 control-label col-lg-offset-3">nickname</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.nickname}" required="true"
							requiredMessage="Campo Obbligatorio" id="nickname" styleClass="form-control" />
						<h:message for="nickname" style="color:red" />
					</div>
				</div>
				
				<div class="form-group">
					<label for="password"
						class="col-sm-1 control-label col-lg-offset-3">password</label>
					<div class="col-sm-2">
						<h:inputText value="#{administratorController.password}" required="true"
							requiredMessage="Campo Obbligatorio" id="password" styleClass="form-control" />
						<h:message for="password" style="color:red" />
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-3">
						<h:commandButton styleClass="btn btn-primary" id="signinAdmin"
							value="Registrati" action="#{administratorController.createAdministrator}" />
					</div>
				</div>
</h:form>
</f:view>

</body>
</html>