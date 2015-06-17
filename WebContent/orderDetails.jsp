<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Order # ${currentOrder.id}</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<c:if test="${orderController.message != null}">
				<span class="error alert alert-info">${orderController.message}</span>
				<br>
			</c:if>
			
			<h1>Details for order # ${currentOrder.id }</h1>

			<h3>Customer</h3>

			<address>
				<strong>${currentOrder.customer.firstName}
					${currentOrder.customer.lastName}</strong><br>
				${currentOrder.customer.address.street}<br>
				${currentOrder.customer.address.zipcode}
				${currentOrder.customer.address.city},
				(${currentOrder.customer.address.country})<br>
				${currentOrder.customer.address.state}<br> <abbr
					title="Telefono">Phone:</abbr> ${currentOrder.customer.phoneNumber}
			</address>
			<div>
				Day of birth:
				<h:outputText value="#{currentOrder.customer.dateOfBirth}">
					<f:convertDateTime dateStyle="medium" locale="it_IT" type="date" />
				</h:outputText>
			</div>
			<div>
				Registration date:
				<h:outputText value="#{currentOrder.customer.registrationDate.time}">
					<f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
						timeZone="Europe/Rome" />
				</h:outputText>
			</div>

			<h3>Order # ${currentOrder.id}</h3>
			<div>
				Creation time:
				<h:outputText value="#{currentOrder.creationTime.time}">
					<f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
						timeZone="Europe/Rome" />
				</h:outputText>
			</div>

			<div>
				Status:
				<c:if test="${currentOrder.chiuso == false}">
					<span class="label label-danger">Open</span>
				</c:if>
				<c:choose>
					<c:when test="${currentOrder.evaso == true}">
						<span class="label label-success">Shipped</span>
					</c:when>
					<c:otherwise>
						<c:if test="${currentOrder.chiuso == true}">
							<span class="label label-warning">Confirmed</span>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>

			<c:if test="${currentOrder.completedTime != null }">
				<div>
					Confirmation time:
					<h:outputText value="#{currentOrder.completedTime.time}">
						<f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
							timeZone="Europe/Rome" />
					</h:outputText>
				</div>
			</c:if>
			
			<c:if test="${currentOrder.processedTime != null }">
				<div>
					Shipping day:
					<h:outputText value="#{currentOrder.processedTime.time}">
						<f:convertDateTime dateStyle="medium" locale="it_IT" type="both" />
					</h:outputText>
				</div>
			</c:if>
			
			<c:if test="${currentOrder.bookCancellato == true}">
			<br>
				<div>
					<span class="error alert alert-warning">Warning: this order
						contains one or more books not available anymore. It will be
						shipped as soon as the item desider are back in stock!</span>
				</div>
			</c:if>

			<c:if test="${not empty currentOrder.orderLines}">
				<h3>Prodotti in ordine</h3>
				<h:form>
					<table class="table">
						<tr>
							<th>ISBN</th>
							<th>Title</th>
							<th>Price</th>
							<th>Quantity</th>
						</tr>

						<c:forEach var="orderLine" items="#{currentOrder.orderLines}">
							<tr>
								<td><h:commandLink styleClass="btn btn-xs btn-link"
										action="#{bookController.findBook}"
										value="#{orderLine.book.isbn}">
										<f:param name="id" value="#{orderLine.book.id}" />
									</h:commandLink></td>
								<td>${orderLine.book.title}</td>
								<td>${orderLine.unitPrice}</td>
								<td>${orderLine.quantity}</td>
								<c:if test="${currentOrder.chiuso == false}">
									<td><h:commandButton styleClass="btn btn-xs btn-danger"
											action="#{orderController.deleteOrderLine}" value="Remove">
											<f:param name="orderLineId" value="#{orderLine.id}" />
										</h:commandButton></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</h:form>
			</c:if>

			<c:if
				test="${administratorController.currentAdministrator != null && currentOrder.chiuso == true && currentOrder.evaso == false}">
				<h:form styleClass="form-horizontal">
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-2">
							<h:commandButton styleClass="btn btn-success"
								action="#{orderController.processedOrder}" value="Ship order" />
						</div>
					</div>
				</h:form>
			</c:if>
		</div>
	</f:view>
</body>
</html>