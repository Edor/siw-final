<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Shop - Registration completed</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<h:form>
				<span class="error alert alert-success">Registration
					successful! You will be redirected to a different page shortly... </span>
				<c:choose>
					<c:when
						test="${administratorController.currentAdministrator != null}">
						<meta http-equiv="refresh" content="0; url=adminView.jsp" />
					</c:when>
					<c:otherwise>
						<meta http-equiv="refresh" content="0; url=faces/customerPage.jsp" />
					</c:otherwise>
				</c:choose>
			</h:form>
		</div>
	</f:view>
</body>
</html>