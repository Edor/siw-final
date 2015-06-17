<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
					<a class="navbar-brand" href="index.jsp">Home</a>

					
				<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">Clienti<b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><h:commandLink
											action="#{customerController.listCustomers}"
											value="Clienti registrati" /></li>
									<li><h:commandLink
											action="#{administratorController.newCustomer}"
											value="Registra un nuovo cliente" /></li>
									<li><a href='<c:url value="deleteCustomer.jsp" />'>Elimina
											un cliente registrato</a></li>
											</ul></li>