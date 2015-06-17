<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Book Shop - New book</title>
</head>
<body>
	<f:view>


		<div align="center">

			<h:form id="newBook" styleClass="form-horizontal">
				<h:message for="createBook" styleClass="error alert alert-danger" />
				<div>
					<h1>Insert a new book in the database</h1>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-1 control-label col-lg-offset-4">Title</label>
					<div class="col-sm-2">
						* <h:inputText styleClass="form-control"
							value="#{bookController.title}" required="true"
							requiredMessage="This field is mandatory" id="title" />
						<h:message for="title" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="isbn" class="col-sm-1 control-label col-lg-offset-4">ISBN</label>
					<div class="col-sm-2">
						* <h:inputText styleClass="form-control"
							value="#{bookController.isbn}" required="true"
							requiredMessage="This field is mandatory" id="isbn" />
						<h:message for="isbn" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="price" class="col-sm-1 control-label col-lg-offset-4">Price</label>
					<div class="col-sm-2">
						* <h:inputText styleClass="form-control"
							value="#{bookController.price}" required="true"
							requiredMessage="This field is mandatory"
							converterMessage="This field must be a number" id="price" />
						<h:message for="price" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="availability"
						class="col-sm-1 control-label col-lg-offset-4">Availability</label>
					<div class="col-sm-2">
						* <h:inputText styleClass="form-control"
							value="#{bookController.availability}" required="true"
							requiredMessage="This field is mandatory"
							converterMessage="This field must be a number"
							id="availability" />
						<h:message for="availability" style="color:red" />
					</div>
				</div>
				<div class="form-group">
					<label for="publisher"
						class="col-sm-1 control-label col-lg-offset-4">Publisher</label>
					<div class="col-sm-2">
						* <h:inputText styleClass="form-control"
							value="#{bookController.publisher}" required="true"
							requiredMessage="This field is mandatory" id="publisher" />
						<h:message for="publisher" style="color:red" />
					</div>
				</div>
				<div>
					<div class="form-group">
						<label for="addAuthorList"
							class="col-sm-1 control-label col-lg-offset-4">Author</label>
						<div class="col-sm-2">
							<h:selectOneMenu styleClass="form-control" id="addAuthorList"
								value="#{bookController.authorName}">
								<c:forEach var="author"
									items="#{administratorController.authors}">
									<f:selectItem itemValue="#{author.code}"
										itemLabel="#{author.code}" />
								</c:forEach>
							</h:selectOneMenu>
							<h:message for="addAuthorList" style="color:red" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-5 col-sm-2">
							<h:commandButton id="createBook" styleClass="btn btn-success"
								value="Submit" action="#{bookController.createBook}" />
								Fields marked with an asterisk are mandatory
						</div>
					</div>
				</div>


			</h:form>
		</div>

	</f:view>
</body>
</html>