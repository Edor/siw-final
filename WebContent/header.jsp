<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<head>
<!--  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
-->
</head>
<h:form>

	<nav class="navbar navbar-custom">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Home</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><h:commandLink action="#{bookController.listBooks}"
							value="library" /></li>

					<!-- Menu a tendina amministratore -->
					<c:if
						test="${administratorController.currentAdministrator != null}">
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
								<li class="divider"><h:commandLink
										action="#{administratorController.listClosedOrders}"
										value="Ordini da evadere" /></li>
							</ul></li>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown">Operazioni amministrazione<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><h:commandLink
										action="#{administratorController.newBook}"
										value="Inserisci un nuovo book" /></li>
								<li><h:commandLink
										action="#{administratorController.newAuthor}"
										value="Inserisci un nuovo Authore" /></li>
							</ul></li>
					</c:if>

					<!-- Menu a tendina utente -->
					<c:if test="${customerController.currentCustomer != null}">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Operazioni utente<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><h:commandLink action="#{orderController.createOrder}"
										value="Crea un nuovo ordine" /></li>
								<li><a href="#">lista ordini effetuati</a> <!--<h:commandLink
										action="#{customerController.listOrders}"
										value="Lista ordini già effettuati" />--></li>
							</ul></li>
						<c:if test="${currentOrder != null}">
							<li><a href='<c:url value="order.jsp" />'>Torna
									all'ordine corrente n° ${currentOrder.id}</a></li>
							<p>
						</c:if>
					</c:if>
				</ul>

				<!-- Login e amministrazione -->
				<ul class="nav navbar-nav navbar-right">
					<c:if
						test="${administratorController.currentAdministrator != null}">
						<li><a href='<c:url value="administratorPage.jsp" />'>Il
								mio profilo: <strong>${administratorController.currentAdministrator.nickname}</strong>
						</a></li>
						<li><h:commandLink value="Logout"
								action="#{administratorController.logoutAdministrator}" /></li>
					</c:if>

					<c:if test="${customerController.currentCustomer != null}">
						<li><a href='<c:url value="customerPage.jsp" />'>Il mio
								profilo: <b>${customerController.currentCustomer.firstName}
									${customerController.currentCustomer.lastName}</b>
						</a></li>
						<li><h:commandLink value="Logout"
								action="#{customerController.logoutCustomer}" /></li>
					</c:if>

					<c:if
						test="${administratorController.currentAdministrator == null && customerController.currentCustomer == null}">
						<li><a href='<c:url value="login.jsp" />'>Login</a></li>
						<li><a href='<c:url value="customerRegistration.jsp" />'>Registrati</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Amministrazione<b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href='<c:url value="loginAdministrator.jsp" />'>Login
										amministratore</a></li>
							</ul></li>
					</c:if>
				</ul>

			</div>
		</div>
	</nav>
</h:form>

<!--  anche questo
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
-->
