<%@ taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Book Shop - Author: ${authorController.author.firstName} ${authorController.author.lastName}</title>
</head>
<body>
	<f:view>
		<jsp:include page="header.jsp" />
		<div align="center">
			<h1>Details for ${authorController.author.firstName} ${authorController.author.lastName}</h1>
			<div>middleName: ${authorController.author.middleName}</div>
			<div>E-mail: ${authorController.author.email}</div>
			<div>code : ${authorController.author.code}</div>
		</div>
	</f:view>
</body>
</html>