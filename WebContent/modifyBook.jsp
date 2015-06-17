<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - Edit ${bookController.book.title}</title>
</head>
<body>
	<f:view>

		<div align="center">
			<h1>Change Book</h1>
			<h:form styleClass="form-horizontal">
				<div class="form-group">
					<label for="title" class="col-sm-1 control-label col-lg-offset-4">Title</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{bookController.book.title}" required="true"
							requiredMessage="This field is mandatory" id="title" />
						<h:message for="title" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="isbn" class="col-sm-1 control-label col-lg-offset-4">ISBN</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{bookController.book.isbn}" required="true"
							requiredMessage="This field is mandatory" id="isbn" />
						<h:message for="isbn" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="price" class="col-sm-1 control-label col-lg-offset-4">Price</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{bookController.book.price}" required="true"
							requiredMessage="This field is mandatory"
							converterMessage="This field must be a number" id="price" />
						<h:message for="price" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="availability"
						class="col-sm-1 control-label col-lg-offset-4">Availability</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{bookController.book.availability}" required="true"
							requiredMessage="This field is mandatory"
							converterMessage="This field must be a number" id="availability" />
						<h:message for="quantity" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="publisher"
						class="col-sm-1 control-label col-lg-offset-4">Publisher</label>
					<div class="col-sm-2">
						<h:inputText styleClass="form-control"
							value="#{bookController.publisher}" required="true"
							requiredMessage="This field is mandatory" id="publisher" />
						<h:message for="publisher" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-2">
						<h:commandButton value="Save changes" styleClass="btn btn-primary"
							action="#{bookController.updateBook}" />
					</div>
				</div>
			</h:form>

			<c:if test="${not empty currentBook.authors}">
				<hr>
				<div class="form-group">
					<h:form id="removeAuthorMenu">
						<div class="form-group">
							<label for="listAuthor"
								class="col-sm-1 control-label col-lg-offset-4">Author\s</label>
							<div class="col-sm-2">
								<h:selectOneMenu styleClass="form-control" id="listAuthor"
									value="#{bookController.authorNameDelete}" required="true"
									requiredMessage="Select at least one element!">
									<c:forEach var="Author" items="#{currentBook.authors}">
										<f:selectItem itemValue="#{author.firstName}"
											itemLabel="#{author.firstName}" />
									</c:forEach>
								</h:selectOneMenu>
							</div>
							<div class="col-sm-2">
								<h:commandButton styleClass="btn btn-warning" id="removeAuthor"
									value="Remove author"
									action="#{bookController.removeAuthor}" />
							</div>
						</div>
					</h:form>
				</div>
			</c:if>
			<br> <br>
			<hr>
			<c:if test="${not empty authorsBook}">
				<div class="form-group">
					<h:form id="addAuthorMenu">
						<div class="form-group">
							<label for="addAuthorList"
								class="col-sm-1 control-label col-lg-offset-4">Add
								Author</label>
							<div class="col-sm-2">
								<h:selectOneMenu styleClass="form-control" id="addAuthorList"
									value="#{bookController.authorName}">
									<c:forEach var="book" items="#{authorsBook}">
										<f:selectItem itemValue="#{author.firstName}"
											itemLabel="#{author.firstName}" />
									</c:forEach>
								</h:selectOneMenu>
							</div>
							<div class="col-sm-2">
								<h:commandButton styleClass="btn btn-success" id="removeAuthor"
									value="Add author"
									action="#{bookController.addAuthor}" />
							</div>
						</div>
					</h:form>
				</div>
			</c:if>
		</div>
	</f:view>
</body>
</html>