<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Shop - ${bookController.book.title}</title>
</head>
<body>
	<f:view>
		<h1>${bookController.book.title}</h1>
		<h2>Details</h2>
		<div>Price: ${bookController.book.price}</div>
		<div>In stock: ${bookController.book.availability}</div>
		<div>Publisher: ${bookController.book.publisher}</div>
		<h:form>
			Quantity to purchase: <h:inputText
				value="#{shoppingCartController.qty}" required="true"
				requiredMessage="You must choose a quantity"
				converterMessage="This field must be a number" id="qty" />
			<h:message for="qty" />
			<h:commandButton value="Buy it now"
				action="#{bookController.createOrderLine}" />
		</h:form>
		<hr>
		<br>
		<a href="bookList.jsp">Book list</a>
		<br>
		<a href="newBook.jsp">Insert another book in the database</a>
		<br>
		<a href="index.jsp">Go back to the main page</a>
	</f:view>

</body>
</html>