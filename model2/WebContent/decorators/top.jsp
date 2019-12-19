<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<hr size="1" color="black">
	<table class="t100">
		<tr>
			<td width="10%" align="left">
				<h2><a href="${pageContext.request.contextPath}/main.do">Top.jsp</a></h2>
			</td>
			<c:set var="m_no" value="${sessionScope.m_no}"></c:set>
			<c:if test="${empty m_no}">
				<td width="80%" align="right">
					<a href="${pageContext.request.contextPath}/member/login.do">Login</a> &nbsp; 
					<a href="${pageContext.request.contextPath}/member/join.do">Join</a>
				</td>
			</c:if>
			<c:if test="${not empty m_no}">
				<td width="80%" align="right">
					<a href="${pageContext.request.contextPath}/member/my/mypagetemp.do">Mypage</a> &nbsp; 
					<a href="${pageContext.request.contextPath}/member/logout.do">Logout</a>
				</td>
			</c:if>
		</tr>
	</table>
	<hr>
