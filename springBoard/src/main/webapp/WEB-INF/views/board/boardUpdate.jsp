<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
				
			var creator =$j('input[name="creator"]').val();
			var modifier=$j('input[name="modifier"]').val();
			if(creator==modifier || modifier=='admin')
			{
			R
				updateAction();
			}else
			{
				alert('������ �����ϴ�');
				location.href = "/board/boardList.do?pageNo=";
			}
		});
	
	
	
	});
	
function updateAction(){
		var $frm = $j('.boardUpdate :input');
		var param = $frm.serialize();
			$j.ajax({
			    url : "/board/boardUpdateAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
			

}
</script>
<body>
<form class="boardUpdate">
	<input type="hidden" name="boardType" value="${board.boardType}">
	<input type="hidden" name="boardNum" value="${board.boardNum}">
	<table align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="����">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						${board.creator}
						<input type="hidden" name="creator" value="${board.creator}">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
		<input type="hidden" name="modifier" value="${sessionScope.userId}">
	</table>
</form>	
</body>
</html>