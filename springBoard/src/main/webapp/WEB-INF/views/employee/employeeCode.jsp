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
		

		
		
		// �۾���
		$j("#submit").on("click",function(){
			
			var $frm = $j('.employeeUpdateFrm :input');
			var param = $frm.serialize();
			
			alert(param);
			updateAction(param);
			
			
			
		});
	

	
	
	});
	
function updateAction(param){

			$j.ajax({
			    url : "/employee/employeeUpdateAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					// alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/employee/employeeView.do?employeeId=${evo.employeeId}";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
			
			
}


</script>
<body>
<form class="employeeCodeFrm">
<table align="center" border="1">
	<tr>
		<td>�ڵ�Ÿ������</td>
		<td>
		<select name="codeType">
		<c:forEach var="item" items="${codeList}" >
		<option value="${item.codeType}">${item.codeType} </option>
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>

	</tr>
</table>
</form>
</body>
</html>