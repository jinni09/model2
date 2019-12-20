<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.js"></script>
<%@ include file="/session/sessionChk.jsp" %>

<script type="text/javascript">
	function chk() {
		if(frm.m_passwd.value != frm.m_passwd2.value) {
			alert("비밀번호를 다시 입력하세요");
			frm.m_passwd.value = "";
			frm.m_passwd2.value = "";
			frm.m_passwd.focus();
			return false;
		}
		if(frm.m_passwd.value.length < 6) {
			alert("비밀번호는 6~20자로 입력해주세요");
			frm.m_passwd.value = "";
			frm.m_passwd2.value = "";
			frm.m_passwd.focus();
			return false;
		}
		if(frm.m_passwd.value.indexOf(" ")>=0) {
			alert("비밀번호는 공백없이 입력해 주세요.");
			frm.m_passwd.value = "";
			frm.m_passwd2.value = "";
			frm.m_passwd.focus();
			return false;
	    }
		if(frm.m_nick.value.length < 2) {
			alert("닉네임은 2~10자로 입력해주세요");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
		}
		if(frm.m_nick.value.indexOf(" ")>=0) {
			alert("닉네임은 공백없이 입력해 주세요.");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
	    }
		var regex = /^[가-힝A-Za-z0-9]{2,10}$/;
		if (regex.test(frm.m_nick.value) === false) {
			alert("닉네임이 한글 또는 영문 또는 숫자가 아닙니다. ");
			frm.m_nick.value = "";
			frm.m_nick.focus();
			return false;
		}
		return true;
	}
	
	$(function() {
		$('#m_nick').blur(function() {
			var regex = /^[가-힝A-Za-z0-9]{2,10}$/;
			var str_space = /\s/;
			if (regex.test($('#m_nick').val()) === false) {
				$('#check').html("<font>한글,영문,숫자 2~10자</font>");
				if($("#m_nick").val().length < 2) {
					$('#check').html("<font>2~10자로 입력</font>");
				}
				if(str_space.test($('#m_nick').val())) {
					$('#check').html("<font class=red>공백 불가능</font>");
				}
			}else {
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/member/nickChk.do",
				data : {
					"m_nick" : $('#m_nick').val(),
					"m_no" : $('#m_no').val()
				},
				success : function(data) {
					if ($.trim(data) == "FALSE") {
						$('#check').html("<font>사용가능</font>");
					} else if($.trim(data) == "TRUE"){
						$('#check').html("<font class=red>사용불가</font>");
					} else {
						$('#check').html("<font></font>");
					}						
				}
			});
			}
		});
	});
</script>
	
	<form action="mbupdatePro.do" name="frm" onsubmit="return chk()">
		<input type="hidden" name="check" value="false">
		<input type="hidden" name="m_no" id="m_no" value="${m_no}">
		<table class="tab">
			<caption>회원정보수정</caption>
			<tr height="50">
				<td class="title"><font class="red">*</font>이메일</td>
				<td><input type="hidden" name="m_email"
					value="${mb.m_email}"> <label>${mb.m_email}</label></td>
			</tr>
			<tr height="50">
				<td class="title"><font class="red">*</font>비밀번호</td>
				<td><input type="password" name="m_passwd" id="m_passwd" 
					value="${mb.m_passwd}" required="required" maxlength="20">
				<span id="pass"></span>
				</td>
			</tr>
			<tr height="50">
				<td class="title"><font class="red">*</font>비밀번호 확인</td>
				<td><input type="password" name="m_passwd2" required="required" maxlength="20"></td>
			</tr>
			<tr height="50">
				<td class="title"><font class="red">*</font>닉네임</td>
				<td><input type="text" name="m_nick" id="m_nick"
					value="${mb.m_nick}" required="required" maxlength="10">
					<span id="check"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정">
					&nbsp; <input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/member/my/mypagetemp.do'">
				</td>
			</tr>
		</table>
	</form>
