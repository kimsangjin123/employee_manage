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
		

		var ssNumber= $j("input[name='ssNumber']");
		
		ssNumber.on('keypress',function(){
		
		var reqExp=/^(\d{6})(\d{7})$/g;
		
		ssNumber= $j("input[name='ssNumber']");
		ssNumber.val(ssNumber.val().replace(/[^0-9]/g,'').replace(reqExp,"$1-$2").replace('--','-'));

		
		});
		
		// �۾���
		$j("#submit").on("click",function(){
			
			var $frm = $j('.employeeWriteFrm :input');
			var param = $frm.serialize();
			
			alert(param);
			writeAction(param);
			
			
			
		});
	

	
	
	});
	
function writeAction(param){

			$j.ajax({
			    url : "/employee/writeAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					// alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/employee/employeeList.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
			
			
}


</script>
<body>
<form class="employeeWriteFrm">
	<table id="writeTable" align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="�ۼ�">

			</td>
		</tr>
		<tr>
			<td>

				<table id="boardWriteTable" border ="1">
				<tbody class="boardWriteTbody" id="boardWriteTbody">
	
					<tr>
						<td width="120" align="center">
						�μ�
						</td>
						<td width="400">
							<select name="department">
						
								<c:forEach var="item" items="${employeeCodeVoList}">
									
									<c:if test="${item.codeType == 'department'}">
										<option value="${item.codeId}">${item.codeName} </option>
									</c:if>
							
								</c:forEach>
						
							</select>		
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						�̸�
						</td>
						<td width="400">
						<input type="text" name="employeeName" maxlength="7"> 
						</td>
					</tr>
					<tr>
						<td align="center">
						�ֹι�ȣ
						</td>
						<td valign="top">
						<input type="text" name="ssNumber" maxlength="14">
						</td>
					</tr>
					<tr>
						<td align="center">
						����
						</td>
						<td valign="top">
						<select name="employeeJob">
							<c:forEach var="item" items="${employeeCodeVoList}">
								
								<c:if test="${item.codeType eq 'job'}">
								<option value="${item.codeId}">${item.codeName} </option>
								</c:if>
						
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td align="center">
						�Ի���
						</td>
						<td valign="top">
						<input type="date" name="startDate" maxlength="10">
						</td>
					</tr>
					<tr>
						<td align="center">
						�ٹ�����
						</td>
						<td valign="top">
						<select name="workType">
						
							<c:forEach var="item" items="${employeeCodeVoList}">
								
								<c:if test="${item.codeType eq 'worktype'}">
									<option value="${item.codeId}">${item.codeName} </option>
								</c:if>
						
							</c:forEach>
						
						</select>
						</td>
					</tr>
					<tr>
						<td align="center">
						�ּ�
						</td>
						
						<td>
						<textarea name="employeeAddress" maxlength="50"></textarea>
						</td>
						
					</tr>
				</tbody>
				

				
				</table>

				
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="./employeeList.do">List</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>