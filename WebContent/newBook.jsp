<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - New book</title>
</head>
<body>
	<f:view>
		<h:form>
			<div>
				Title:
				<h:inputText value="#{bookController.title}" required="true"
					requiredMessage="Title is mandatory" id="title" />
				<h:message for="title" />
			</div>
			<div>
				Author #1:
				<h:inputText value="#{bookController.author1}" required="true"
					requiredMessage="First author is mandatory" id="author1" />
				<h:message for="author1" />
			</div>
			<div>
				Author #2:
				<h:inputText value="#{bookController.author2}" required="false"
					id="author2" />
			</div>
			<div>
				Author #3:
				<h:inputText value="#{bookController.author3}" required="false"
					id="author3" />
			</div>
			<div>
				Author #4:
				<h:inputText value="#{bookController.author4}" required="false"
					id="author4" />
			</div>


			<div>
				Publisher:
				<h:inputText value="#{bookController.publisher}" required="true"
					requiredMessage="Publisher is mandatory" id="publisher" />
				<h:message for="publisher" />
			</div>

			<div>
				Price:
				<h:inputText value="#{bookController.price}" required="true"
					requiredMessage="Price is mandatory"
					converterMessage="Price must be a number" id="price" />
				<h:message for="price" />
			</div>
			<div>
				In stock:
				<h:inputText value="#{bookController.availability}" required="true"
					requiredMessage="This field is mandatory"
					converterMessage="This field must be a number" id="availability" />
				<h:message for="availability" />
			</div>



			<div>
				<h:commandButton value="Submit"
					action="#{bookController.createBook}" />
			</div>
			
		</h:form>
	</f:view>
</body>
</html>