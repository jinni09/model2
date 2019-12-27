<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/session/sessionChk.jsp"%>

	<form action="updatePro.do" method="post">
		<input type="hidden" name="no" value="${brd.no}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		
		<table class="tab">
			<caption>게시글 수정</caption>
			<tr>
				<td class="inputleft">
					작성자 : <span style="font-weight: bold;">${brd.m_nick}</span>
				</td>
			</tr>
			<tr>
				<td class="inputleft">
					<input type="text" name="subject" required="required" autofocus="autofocus" size="50" value="${brd.subject}">
				</td>
			</tr>
			<tr>
				<td>
					<pre><textarea rows="20" cols="90" name="content" required="required">${brd.content}</textarea></pre>
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="확인"> &nbsp;
				<input type="button" value="취소" onclick="history.back(-1)"></td>
			</tr>
		</table>
	</form>
