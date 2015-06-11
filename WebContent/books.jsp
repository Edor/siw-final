
<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Shop - Books</title>
</head>
<body>

	<f:view>
		<h:form>		
			<div align="center">
		<h1>Books</h1>
		
	
			<table>
				<tr>
					<th>Title</th>
					<th>Price</th>
				</tr>
				<c:forEach var="book" items="#{bookController.books}">
					<tr>
						<td><h:commandLink action="#{bookController.findBook}"
								value="#{book.title}"  >
								<f:param name="id" value="#{book.id}" />
							</h:commandLink></td>
						<td>${book.price}</td>
				
						
					</tr>
				</c:forEach>
			</table>
		</div>
		</h:form>
	</f:view>

</body>
</html>