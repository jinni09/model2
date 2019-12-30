<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/session/sessionChk.jsp"%>

	<form action="updatePro.do" method="post">
		<input type="hidden" name="no" value="${brd.no}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		
		<table class="view">
			<caption><c:if test="${brd.ref_level == 0}">게시글</c:if><c:if test="${brd.ref_level == 1}">답변글</c:if> 수정</caption>
			<tr>
				<td class="inputleft">
					작성자 : <span style="font-weight: bold;">${brd.m_nick}</span>
				</td>
			</tr>
			<tr>
				<td class="inputleft">
					<input type="text" class="text" name="subject" required="required" autofocus="autofocus" value="${brd.subject}">
				</td>
			</tr>
			<tr>
				<td class="td0">
					<textarea rows="20" class="text" name="content" required="required">${brd.content}</textarea>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="확인"> &nbsp;
				<input type="button" value="취소" onclick="history.back(-1)"></td>
			</tr>
		</table>
	</form>
