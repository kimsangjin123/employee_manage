<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
<style>
#loginTable{margin:auto;}
</style>
</head>
<script type="text/javascript">
	
	
	$j(document).ready(function(){
	
	
		$j('#loginBtn').click(function(){
		
		var $frm=$j('#loginFrm :input');
		var param=$frm.serialize();
		
			$j.ajax({
			    url : "/login/loginAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    contentType: 'application/x-www-form-urlencoded; charset=euc-kr',

			    success: function(data, textStatus, jqXHR)
			    {
					var chk=data.success;
					if(chk!='Y')
					{
						alert('로그인실패');
					
					}else
					{
					alert('환영합니다.');
						location.href="/board/boardList.do";
					}
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		
		
		});
		
	
	});

</script>
<body>
<form id="loginFrm">

<table id="loginTable" border="1">
<tr>
	<td>
	아이디
	</td>
	<td>
	 <input type="text" name="userId">
	</td>
</tr>
<tr>
	<td>
	비밀번호
	</td>
	<td>
	 <input type="password" name="userPw">
	</td>
</tr>
<tr>

	<td Colspan="2" align="center">
	 <input id="loginBtn" type="button" value="login">
	 <a href="./join.do">회원가입</a>
	 <a href="../board/boardList.do">목록으로</a>
	</td>
</tr>
</table>

</form>
</body>
</html>