<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Model2</title>
</head>
<body>

	<font color="red"><b><em> "에러가 발생했습니다" </em></b></font>
	<p>
	
	<c:choose>
 		<c:when test="${requestScope['javax.servlet.error.status_code'] == 404}">
 			<p>404 : 서버가 요청한 페이지를 찾을 수 없습니다.</p>
 		</c:when>
 		<c:when test="${requestScope['javax.servlet.error.status_code'] == 500}">
 			<p>500 : 서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p>
 		</c:when>
 		<c:otherwise>
 			<p>기타 오류가 발생했습니다.</p>
 		</c:otherwise>
	</c:choose>
	
</body>
</html>