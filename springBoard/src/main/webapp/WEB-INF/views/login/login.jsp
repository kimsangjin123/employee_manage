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
						alert('�α��ν���');
					
					}else
					{
					alert('ȯ���մϴ�.');
						location.href="/board/boardList.do";
					}
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
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
	���̵�
	</td>
	<td>
	 <input type="text" name="userId">
	</td>
</tr>
<tr>
	<td>
	��й�ȣ
	</td>
	<td>
	 <input type="password" name="userPw">
	</td>
</tr>
<tr>

	<td Colspan="2" align="center">
	 <input id="loginBtn" type="button" value="login">
	 <a href="./join.do">ȸ������</a>
	 <a href="../board/boardList.do">�������</a>
	</td>
</tr>
</table>

</form>
</body>
</html>