<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/session/sessionChk.jsp" %>

	<c:if test="${brd.no > 0}">
		<script type="text/javascript">
			location.href="${pageContext.request.contextPath}/board1/view.do?no=${brd.no}&pageNum=${pageNum}";
		</script>
	</c:if>
	
	<c:if test="${brd.no <= 0}">
		<script type="text/javascript">
			alert("입력 실패");
			history.go(-1);
		</script>
	</c:if>
