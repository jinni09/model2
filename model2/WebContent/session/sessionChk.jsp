<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="m_no" value="${sessionScope.m_no}"></c:set>
	<c:if test="${empty m_no}">
	<script type="text/javascript">
		alert("로그인을 하셔야 이용할 수 있는 페이지입니다.");		
		location.href="${pageContext.request.contextPath}/member/login.do";
	</script>
</c:if>