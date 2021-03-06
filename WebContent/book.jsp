<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Book Shop - ${bookController.book.title}</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<h2>${bookController.book.title}</h2>
			<h3>Details</h3>
			<div>ISBN: ${bookController.book.isbn}</div>
			<div>
				Price:
				<h:outputText id="price" value="#{bookController.book.price}">
					<f:convertNumber currencyCode="EUR" groupingUsed="true"
						maxFractionDigits="2" type="currency" />
				</h:outputText>
			</div>
			<div>Availability: ${bookController.book.availability}</div>
			<div>Publisher: ${bookController.book.publisher}</div>

			<c:if test="${not empty bookController.book.authors}">
				<div class="form-group">
					<label for="listAuthors"
						class="col-sm-1 control-label col-lg-offset-4">Authors</label>
					<div class="col-sm-2">
						<h:selectOneMenu styleClass="form-control" id="listAuthorsr">
							<c:forEach var="authors" items="#{bookController.book.authors}">
								<f:selectItem itemLabel="#{authors.firstName}" />
							</c:forEach>
						</h:selectOneMenu>
					</div>
				</div>
				<br>
				<br>
				<hr>
			</c:if>

			<!-- Sono un cliente (posso vedere ci� quando c'� un ordine corrente "aperto"!)-->
			<c:if test="${currentOrder != null && currentOrder.chiuso == false}">
				<h:form styleClass="form-horizontal">
					<div>
						<h4>Add book to order # ${currentOrder.id}</h4>
					</div>
					<div class="form-group">
						<label for="quantity"
							class="col-sm-1 control-label col-lg-offset-4">Quantity </label>
						<div class="col-sm-2">
							<h:inputText styleClass="form-control"
								value="#{orderController.quantity}" required="true"
								requiredMessage="This field is mandatory"
								validatorMessage="This number can't be negative"
								converterMessage="This field must be a number"
								id="quantity">
								<f:validateLongRange minimum="1" />
							</h:inputText>
							<h:message for="quantity" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-2">
							<h:commandButton styleClass="btn btn-primary"
								action="#{orderController.addOrderLine}"
								value="Add this book" />
						</div>
					</div>
				</h:form>
			</c:if>

			<!-- Sono un amministratore -->
			<c:if test="${administratorController.currentAdministrator != null}">
				<h:form styleClass="form-horizontal">
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-2">
							<h:commandButton styleClass="btn btn-warning"
								action="#{administratorController.modifyBook}" value="Edit" />
						</div>
						<div class="col-sm-2">
							<h:commandButton styleClass="btn btn-danger"
								action="#{bookController.deleteBook}" value="Delete" />
						</div>
					</div>
				</h:form>
			</c:if>
		</div>
	</f:view>
</body>
</html>