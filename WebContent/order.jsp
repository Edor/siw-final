<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html>
<html>
<head>
<title>Book Shop - Order # ${currentOrder.id}</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />

		<div align="center">
			<c:if
				test="${orderController.message != null && orderController.message != '' }">
				<span class="error alert alert-info">${orderController.message}</span>
				<br>
			</c:if>

			<h2>Order # ${currentOrder.id}</h2>

			<div>
				Creation date:
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
						<f:convertDateTime dateStyle="medium" locale="it_IT" type="both"
							timeZone="Europe/Rome" />
					</h:outputText>
				</div>
			</c:if>
			<br>
			<c:if test="${currentOrder.bookCancellato == true}">
				<br>
				<div>
					<span class="error alert alert-warning">Warning: this order
						contains one or more books not available anymore. It will be
						shipped as soon as the item desider are back in stock!</span>
				</div>
			</c:if>
			<br>
			<c:if test="${currentOrder.chiuso == false}">
				<h4>In order to add more items to your order go back to the complete book page!</h4>
				<br>
				<h:form>
					<h:commandButton styleClass="btn btn-success"
						action="#{orderController.closeOrder}" value="Confirm order" />
				</h:form>
			</c:if>

			<c:if test="${not empty currentOrder.orderLines}">
				<h3>Books</h3>
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

			<c:if test="${currentOrder.chiuso == false}">
				<br>
				<br>
				<c:if test="${not empty currentOrder.orderLines}">
					<h:form styleClass="form-horizontal">
						<div>
							<h4>Edit book quantity to be purchased</h4>
						</div>
						<div class="form-group">
							<label for="isbnBook"
								class="col-sm-1 control-label col-lg-offset-4">ISBN Book
							</label>
							<div class="col-sm-2">
								<h:selectOneMenu styleClass="form-control"
									value="#{orderController.codeBookLineOrder}" required="true"
									id="isbnBook">
									<c:forEach var="orderLine" items="#{currentOrder.orderLines}">
										<f:selectItem itemValue="#{orderLine.book.isbn}"
											itemLabel="#{orderLine.book.isbn}" />
									</c:forEach>
								</h:selectOneMenu>
								<h:message for="isbnBook" />
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-1 control-label col-lg-offset-4">New quantity to be purchased:</label>
							<div class="col-sm-2">
								<h:inputText styleClass="form-control"
									value="#{orderController.quantityNew}" required="true"
									requiredMessage="*" size="2" id="orderLineQuantity" />
								<h:message for="orderLineQuantity" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-5 col-sm-2">
								<h:commandButton styleClass="btn btn-primary"
									action="#{orderController.changeQuantityOrderLine}" value="OK">
								</h:commandButton>
							</div>
						</div>
					</h:form>
				</c:if>
			</c:if>
		</div>
	</f:view>
</body>
</html>