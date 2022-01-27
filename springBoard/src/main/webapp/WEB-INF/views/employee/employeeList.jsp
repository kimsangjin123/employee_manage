<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="euc-kr"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){

			getPage(1);
			
		
	});

// 페이징
function getPage(pageNo){
			$j('input[name="pageNo"]').val(pageNo);
			var $frm = $j('#frmSearch :input');
			var param = $frm.serialize();

			$j.ajax({
			    url : "/employee/listAjax.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    contentType: 'application/x-www-form-urlencoded; charset=euc-kr',

			    success: function(data, textStatus, jqXHR)
			    {
					// alert("작성완료");
			
					const totalCnt=data.totalCnt;
					const eList=data.eList;
					const employeePageVo=data.employeePageVo;
					

					// 리스트
					var rowData="";
					for(var i=0; i<eList.length; i++){
				
					rowData+="<tr>";
					rowData+="<td>"+eList[i]['department']+"</td>";
					rowData+="<td>"+eList[i]['employeeJob']+"</td>";
					
					// 랙
					rowData+="<td><a href='./employeeView.do?";
				
					rowData+="employeeId="+eList[i]['employeeId'];
					rowData+="'</a>"+eList[i]['employeeName']+"</td>";
					rowData+="</tr>";
					}
					$j("#boardSelect").empty();
					$j("#boardSelect").html(rowData);
					$j("#totalCnt").text("total"+totalCnt);
					
					// paging
					
					var startPage= employeePageVo.pageStart;
					var endPage= employeePageVo.pageEnd;
					var pageTotalCnt = employeePageVo.pageTotalCnt;
					var pageNo = employeePageVo.pageNo;
					var pagingRowData="";
					
					pagingRowData+="<tr><td colspan='3'>";
					
					if(pageNo<=10){
					
					}else{
					pagingRowData+="<a href='javascript:getPage("+(startPage-1)+")'>"
					pagingRowData+="[PREV]</a>";
					}
					
					for(var i=startPage;i<=endPage;i++){
						
						if(pageNo==i){
							pagingRowData+=i;
						}
						else{
						pagingRowData+="<a href='javascript:getPage("+i+")'> ";
						pagingRowData+=i;
						pagingRowData+=" </a>";
						}
					}
					
					if(endPage!=pageTotalCnt){
					pagingRowData+="<a href='javascript:getPage("+(endPage+1)+")'>"
					 
				
					pagingRowData+="[NEXT]</a>";
					}
					
					pagingRowData+="</td></tr>";
					
					
					
					$j("#pagingBoard").empty();
					$j('#pagingBoard').html(pagingRowData);
					// alert("메세지:"+data.succcess); //undefined 라고 뜬다 찾아보자
				
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});


}


</script>
<body>


<table  align="center">


	<tr>
	
		<td align="right" id="totalCnt">
		
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						부서
					</td>
					<td width="40" align="center">
						직무
					</td>
					<td width="300" align="center">
						이름
					</td>
				</tr>


				<tbody id="boardSelect">

				</tbody>
				<tbody id="pagingBoard" align="center">
				
				</tbody>

			</table>
		</td>
	</tr>
	<tr>
		<td align="right">

			

			<a href ="./employeeWrite.do">사원입력하기</a>

		</td>
	</tr>
	<tr>
		<td align="left">
			<form id="frmSearch">
				<input type="hidden" name="pageNo" value="1">	


			</form>
		</td>
	</tr>
</table>	
</body>
</html>