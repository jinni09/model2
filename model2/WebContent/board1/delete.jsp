<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/session/sessionChk.jsp"%>

	<c:if test="${result > 0}">
		<script type="text/javascript">
			//alert("삭제 성공");
			location.href="${pageContext.request.contextPath}/board1/list.do";	
		</script>
	</c:if>
	<c:if test="${result <= 0}">
		<script type="text/javascript">
			alert("삭제 실패");
			history.go(-1);
		</script>
	</c:if>
