<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	
	<table class="tab">
		<caption>마이페이지</caption>
		<tr>
		<td> <a href="${pageContext.request.contextPath}/member/my/myinfo.do" > 내정보보기 </a> </td>
		</tr>
		<tr>
		<td> <a href="${pageContext.request.contextPath}/member/my/mbupdate.do" > 회원정보수정 </a> </td>
		</tr>
		<tr> 
		<td> <a href="${pageContext.request.contextPath}/member/my/mbdelete.do"> 회원탈퇴 </a> </td>	
		</tr>
	</table>
