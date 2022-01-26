<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>

<script type="text/javascript">

	$j(document).ready(function(){
		
		var career=$j('#careerCertificate');
		var contract=$j('#contractCertificate');
		var employee=$j('#employmentCertificate');
		
		
		$j("#delete").on("click",function(){
		
			if(confirm('정말 삭제하시겠습니까')){
			param=$j('input[name="employeeId"]');
			$j.ajax({
			    url : "/employee/employeeDelete.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("삭제완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/employee/employeeList.do?pageNo=";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});			
			
			
			}

			
			
			
		});
	

	});
	

</script>
</head>
<body>
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					이름
					</td>
					<td width="400">
					${evo.employeeName}
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					주민번호
					</td>
					<td width="400">
					${fn:substring(evo.ssNumber,0,8)}xxxxxx
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					부서
					</td>
					<td width="400">
					${evo.department}
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					직책
					</td>
					<td width="400">
					${evo.employeeJob}
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					입사일
					</td>
					<td width="400">
					${evo.startDate}
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					퇴사일
					</td>
					<td width="400">
					${evo.regiDate}
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					서류 다운로드
					</td>
					<td width="400">
					    <form action="/employee/career.do" method="get">
					    <input type="hidden" name="employeeId" value="${evo.employeeId}">
           				 <button id="careerCertificate" type="submit">경력증명서.docx</button>
       				    </form>
						<form action="/employee/employeement.do" method="get">
						<input type="hidden" name="employeeId" value="${evo.employeeId}">
					<button id="employmentCertificate" type="submit">재직증명서.docx</button>
						</form>
					</td>
				</tr>				
			</table>
		</td>
	</tr>
	<tr>
				<td align="right">
			<a href="./employeeList.do">List</a>
			
			<a href="./employeeUpdate.do?employeeId=${evo.employeeId}">update</a>
			
			<input id="delete" type="button" value="delete">
			<input type="hidden" name="employeeId" value="${evo.employeeId}">
		</td>

	</tr>
</table>	
</body>
</html>