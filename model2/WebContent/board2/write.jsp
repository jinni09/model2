<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/session/sessionChk.jsp" %>

	<form action="writePro.do" method="post">
		<input type="hidden" name="no" value="${no}">
		<input type="hidden" name="ref" value="${ref}">
		<input type="hidden" name="ref_step" value="${ref_step}">
		<input type="hidden" name="ref_level" value="${ref_level}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="m_no" value="${m_no}">

		<table class="view">
			<caption><c:if test="${re ne 1}">게시글</c:if><c:if test="${re eq 1}">답변글</c:if> 작성</caption>
			<tr>
				<td class="inputleft">
					작성자 : <span style="font-weight: bold;">${mb.m_nick}</span>
				</td>
			</tr>
			<tr>
				<td class="inputleft">
					<input type="text" class="text" name="subject" required="required" autofocus="autofocus" placeholder="제목을 입력해 주세요">
				</td>
			</tr>
			<tr>
				<td class="td0">
					<textarea rows="20" class="text" name="content" required="required"></textarea>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="확인"> &nbsp;
				<input type="button" value="취소" onclick="history.back(-1)"></td>
			</tr>
		</table>
	</form>
