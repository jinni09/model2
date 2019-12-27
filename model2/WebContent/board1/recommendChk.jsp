<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/session/sessionChk.jsp"%>

	<c:if test="${result > 0}">
		<c:out value="TRUE" />
	</c:if>
	<c:if test="${result <= 0}">
		<c:out value="FALSE" />
	</c:if>