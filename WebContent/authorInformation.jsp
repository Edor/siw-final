<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Fornitore</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<h1>Dettagli Authotr ${authorController.author.firstName}</h1>
			<div>E-mail: ${authorController.author.lastName}</div>
			<div>middleName: ${authorController.author.middleName}</div>
			<div>code : ${authorController.author.code}</div>

		</div>
	</f:view>
</body>
</html>