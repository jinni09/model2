<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<form action="loginPro.do" name="frm">
		<table class="tab">
			<caption>로그인</caption>
			<tr>
				<td><input type="text" name="m_email" placeholder="이메일" required="required"></td>
			</tr>
			<tr>
				<td><input type="password" name="m_passwd" placeholder="비밀번호" required="required"></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>

	<p>
	<div align="center">
		<a href="join.do">
		<font style="text-decoration: underline;" size="2"> 회원가입 </font>
		</a>
	</div>
