<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/session/sessionChk.jsp" %>

	<c:if test="${result > 0}">
		<%
			session.invalidate();
		%>
		<script type="text/javascript">
			alert("탈퇴 성공");
			location.href = "${pageContext.request.contextPath}/main.do";
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("비밀번호를 확인해주세요.");
			history.go(-1);
		</script>
	</c:if>
