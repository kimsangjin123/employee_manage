<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>

<style>
#rowMinus{display:none;}
</style>


<script type="text/javascript">

	$j(document).ready(function(){
		
		//alert('table').rows.length;
		var rowChk=0;
		
		
		
		
		
		// ���߰�(��� ù��°�� ������� �޼����� �״�� ����)
		$j('#rowPlus').on("click",function(){
		
		
		if (rowChk==4){
			return alert('�� �߰� ����');		
		}
		rowChk+=1;
		if (rowChk>=1){
			$j('#rowMinus').show(); // display="block";
		}
		
		var board = $j('#boardWriteTbody').clone();
		$j('tbody.writer').before(board);
		
		});
		
		
		// �����
		$j('#rowMinus').click(function(){
		//alert('minus');
		
		if(rowChk==0){
			$j('#rowMinus').hide();
			return alert('����� �Ұ�');
		}
		rowChk-=1;
		$j('.boardWriteTbody').last().remove();
		
		
		});
		 
		
		
		// �۾���
		$j("#submit").on("click",function(){
			
			var $frm = $j('.boardWriteForm :input');
			var param = $frm.serialize();
			
			alert(param);
			writeAction(param);
			
			
			
		});
	
	
	
	});
	
function writeAction(param){

			$j.ajax({
			    url : "/board/testWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					// alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
			
			
}


</script>
<body>
<form:form commandName="boardVo" class="boardWriteForm" action="/board/testWriteAction.do">
	<table id="writeTable" align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="�ۼ�">
			<input id="rowPlus" type="button" value="���߰�">
			<input type="button" id="rowMinus" value="�����">
			</td>
		</tr>
		<tr>
			<td>

				<table id="boardWriteTable" border ="1">
				<tbody class="boardWriteTbody" id="boardWriteTbody">

					<tr>
						<td width="120" align="center">
						type
						</td>
						<td width="400">
							<select name="boardVoList[0].boardType">
							<c:forEach items="${comCode}" var="menu">
						
							<option value="${menu.codeId}">${menu.codeName}</option>
							</c:forEach>				
							</select>
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardVoList[0].boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardVoList[0].boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
	
				</tbody>
				
				<tbody class="writer">
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						</td>
					</tr>
				</tbody>
				
				</table>

				
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>