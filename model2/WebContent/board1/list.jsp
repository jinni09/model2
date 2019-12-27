<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function locate(pageNum){
		var searchType = document.getElementById("searchType");
		var searchTxt = document.getElementById("searchTxt");
		location.href="list.do?pageNum="+pageNum+"&searchType="+searchType.value+"&searchTxt="+searchTxt.value;
	}
</script>
	
	<p>
	<p>
	
	<table class="brd">
		<caption>게시판</caption>
		<tr height="30">
			<th width="5%">번호</th>
			<th width="31%">제목</th>
			<th width="8%">글쓴이</th>
			<th width="8%">날짜</th>
			<th width="4%">조회</th>
			<th width="4%">추천</th>
		</tr>
		
		<c:set var="tot" value="${total}" />
		<tr height="1" bgcolor="#e2e2e2"><td colspan="6"></td></tr>
		<c:if test="${not empty list}">
			<c:forEach var="brd" items="${list}">
			<tr height="30">
				<td class="default">${tot}</td>
				<td class="subject">
				<a href="${pageContext.request.contextPath}/board1/view.do?no=${brd.no}&pageNum=${nowPage}">${brd.subject}</a>
				</td>
				<td class="nickname">${brd.m_nick}</td>
				<td class="default">${brd.reg_date}</td>
				<td class="default">${brd.readcount}</td>
				<td class="default">${brd.recommend}</td>
			</tr>
			<tr height="1" bgcolor="#e2e2e2"><td colspan="6"></td></tr>
			<c:set var="tot" value="${tot - 1}"></c:set>
		</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr height="30">
				<td colspan="6" class="default">데이터가 없습니다</td>
			</tr>
		</c:if>
	</table>
	
	<br>
		
	<div class="list">
		<c:if test="${startPage > pagePerBlock}">
			<a href="javascript:locate(${startPage-pagePerBlock})">[이전] </a>
			<a href="javascript:locate(1)">[1]</a>				
			...
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:if test="${i eq nowPage}">
				<b class="b">[${i}]</b>
			</c:if>
			<c:if test="${i ne nowPage}">
				<a href="javascript:locate(${i})">[${i}]</a>
			</c:if>
		</c:forEach>
		<c:if test="${totalPage > endPage}">
			...
			<a href="javascript:locate(${totalPage})">[${totalPage}]</a>
			<a href="javascript:locate(${startPage+pagePerBlock})">[다음]</a>
		</c:if>
		
		<c:set var="m_no" value="${sessionScope.m_no}"></c:set>
		<c:if test="${not empty m_no}">
			<p>
			<button onclick="location.href='${pageContext.request.contextPath}/board1/write.do?pageNum=${pageNum}'">글쓰기</button>
		</c:if>
		
		<p>
		
		<select id="searchType">
			<c:if test="${searchType eq 'all'}">
				<option value="all" selected="selected">제목 + 내용</option>
			</c:if>
			<c:if test="${searchType ne 'all'}">
				<option value="all">제목 + 내용</option>
			</c:if>
				
			<c:if test="${searchType eq 'subject'}">
				<option value="subject" selected="selected">제목</option>
			</c:if>
			<c:if test="${searchType ne 'subject'}">
				<option value="subject">제목</option>
			</c:if>
			
			<c:if test="${searchType eq 'content'}">	
				<option value="content" selected="selected">내용</option>
			</c:if>
			<c:if test="${searchType ne 'content'}">
				<option value="content">내용</option>
			</c:if>
				
			<c:if test="${searchType eq 'm_nick'}">
				<option value="m_nick" selected="selected">글쓴이</option>
			</c:if>
			<c:if test="${searchType ne 'm_nick'}">
				<option value="m_nick">글쓴이</option>
			</c:if>
		</select>
		<input type="text" id="searchTxt" value="${searchTxt}">
		<input type="submit" value="검색" onclick="locate(1)">
	</div>
