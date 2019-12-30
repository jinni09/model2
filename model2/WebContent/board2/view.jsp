<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(function() {
		textareaAutoSize();
	});
	
	// textarea의 사이즈를 내용에 맞게 조절.
	function textareaAutoSize() {
		var textEle = $('textarea');
		textEle[0].style.height = 'auto';
		var textEleHeight = textEle.prop('scrollHeight');
		textEle.css('height', textEleHeight);
	};

	// 게시글 삭제
	function brdDelChk() {
		if ($('#reflevel').val() == 0 && $('#refcount').val() == 2) {
			alert("해당 글에 답변글이 존재합니다.");
			return false;
		}
		
		var brdDel = confirm("해당 게시글을 삭제 하시겠습니까?");
		if (brdDel) {
			location.href='${pageContext.request.contextPath}/board2/delete.do?no=${no}&pageNum=${pageNum}';
		} else {
			return false;
		}
	}
</script>
	
	<c:if test="${not empty brd}">
		<input type="hidden" name="ref_level" id="reflevel" value="${brd.ref_level}">
		<input type="hidden" name="refcount" id="refcount" value="${brd.refcount}">
		<table class="view">
			<caption><c:if test="${brd.ref_level == 0}">게시글</c:if><c:if test="${brd.ref_level == 1}">답변글</c:if> 보기</caption>
			<tr>
				<td class="title">제목</td>
				<td colspan="3">${brd.subject}</td>
			</tr>
			<tr>
				<td class="title" width="20%">닉네임</td>
				<td>${brd.m_nick}</td>
				<td class="title" width="10%">조회수</td>
				<td>${brd.readcount}</td>
			</tr>
			<tr>
				<td class="title" width="20%">작성일<c:if test="${null ne brd.up_date}"> (수정일)</c:if></td>
				<fmt:parseDate var="regDate" pattern="yyyy-MM-dd HH:mm:ss" value="${brd.reg_date}" />
				<fmt:formatDate var="reg" pattern="yyyy-MM-dd HH:mm" value="${regDate}" />
				<fmt:parseDate var="upDate" pattern="yyyy-MM-dd HH:mm:ss" value="${brd.up_date}" />
				<fmt:formatDate var="up" pattern="yyyy-MM-dd HH:mm" value="${upDate}" />
				<td colspan="3">${reg}<c:if test="${null ne brd.up_date}"> (${up})</c:if></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea class="content" name="content" required="required" readonly onfocus="this.blur();">${brd.content}</textarea>
				</td>
			</tr>
		</table>
	</c:if>
	
	<p>
	
	<div align="center">
		<button onclick="location.href='list.do?pageNum=${pageNum}'">목록</button>
		<c:if test="${null ne m_no}">
			<button onclick="location.href='${pageContext.request.contextPath}/board2/update.do?no=${no}&pageNum=${pageNum}'">수정</button>
			<button onclick="return brdDelChk()">삭제</button>
			<c:if test="${brd.refcount == 1}">
				<button onclick="location.href='${pageContext.request.contextPath}/board2/write.do?no=${no}&pageNum=${pageNum}&re=1'">답변</button>
			</c:if>
		</c:if>
	</div>
