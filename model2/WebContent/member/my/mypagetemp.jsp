<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/session/sessionChk.jsp" %>

	<table class="t100">
		<tr>
			<td width="20%" height="50"><jsp:include page="mypage.jsp" /></td>
			<td width="80%" class="mypagetemp">
			<c:if test="${empty param.mypgm}">
					<jsp:forward page="myinfo.do"/>
			</c:if> 
			<c:if test="${not empty param.mypgm}">
					<jsp:include page="${param.mypgm}"/>
			</c:if></td>
		</tr>
	</table>
