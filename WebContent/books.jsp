<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book List</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<h1>Book list</h1>
			<h:form>
				<table class="table">
					<tr>
						<th>Title</th>
						<th>Price</th>
						<th>Availability</th>
					</tr>
					<c:forEach var="book" items="#{bookController.books}">
						<tr>
							<td><h:commandLink action="#{bookController.findBook}"
									value="#{book.title}">
									<f:param name="id" value="#{book.id}" />
								</h:commandLink></td>
							<td><h:outputText id="price" value="#{book.price}">
									<f:convertNumber currencyCode="EUR" groupingUsed="true"
										maxFractionDigits="2" type="currency" />
								</h:outputText></td>
							<td>${book.availability}</td>
						</tr>
					</c:forEach>
				</table>
			</h:form>
		</div>
	</f:view>
</body>
</html>