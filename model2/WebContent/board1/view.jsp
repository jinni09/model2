<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(function() {
		$('#btnLike').click(function(){
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/board1/recommendChk.do",
				data : {
					"no" : $('#like_no').val()
				},
				success : function(data){
					if ($.trim(data) == "TRUE") {
						$('#btnLike').text("좋아요");
					} else if($.trim(data) == "FALSE"){
						$('#btnLike').text("좋아요 취소");
					}
				} 
			});
		});
	});
	
	function chk() {
		alert("로그인 후 사용하실 수 있습니다.");
	}
	
	// 게시글 삭제
	function brdDelChk() {
		var brdDel = confirm("해당 게시글을 삭제 하시겠습니까?");
		if (brdDel) {
			location.href='${pageContext.request.contextPath}/board1/delete.do?no=${no}&pageNum=${pageNum}';
		} else {
			return false;
		}
	}
</script>
	
	<c:if test="${not empty brd}">
		<table class="view">
			<caption>게시글 보기</caption>
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
				<td colspan="4"><pre>${brd.content}</pre></td>
			</tr>
		</table>
	</c:if>
	
	<p>
	
	<div align="center">
	<c:if test="${null ne m_no}">
		<button id="btnLike">
		<c:if test="${recommend > 0}">
			좋아요 취소
		</c:if>
		<c:if test="${recommend <= 0}">
			좋아요
		</c:if>
		</button>
	</c:if>
	<c:if test="${null eq m_no}">
		<button id="disableBtnLike" onclick="chk()">좋아요</button>
	</c:if>
		<input type="hidden" id="like_no" value="${no}">
	</div>

	<p>
	
	<div align="center">
		<button
			onclick="location.href='list.do?pageNum=${pageNum}'">목록</button>
		<c:if test="${null ne m_no}">
			<c:if test="${m_no == brd.m_no}">
				<button onclick="location.href='${pageContext.request.contextPath}/board1/update.do?no=${no}&pageNum=${pageNum}'">수정</button>
				<button onclick="return brdDelChk()">삭제</button>
			</c:if>
		</c:if>
	</div>
