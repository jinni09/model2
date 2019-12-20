<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<table class="tab">
		<caption>내정보보기</caption>
		<tr height="40%">
			<td colspan="2"><img alt="pic" src="${pageContext.request.contextPath}/img/info.png"
				height="150"></td>
		</tr>
		<tr height="15%">
			<td class="title">이메일</td>
			<td>${mb.m_email}</td>
		</tr>
		<tr height="15%">
			<td class="title">닉네임</td>
			<td>${mb.m_nick}</td>
		</tr>
	</table>
