<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="text/javascript">
	function delchk() {
		var del = confirm("정말로 탈퇴하시겠습니까?");
		if (del) {
			return true;
		} else {
			return false;
		}
	}
</script>

	<form name="frm" action="mbdeletePro.do" method="post" onsubmit="return delchk()">
		<table class="tab">
			<caption>회원탈퇴</caption>
			<tr>
				<td class="title">암호</td>
				<td><input type="password" name="m_passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="확인">
					&nbsp; <input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/member/my/mypagetemp.do'"></td>
			</tr>
		</table>
	</form>
