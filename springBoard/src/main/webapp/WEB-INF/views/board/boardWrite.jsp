<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>

<style>
#rowMinus{display:none;}
.delRow{display:none;}
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
		
		/*
		if (rowChk>=1){
			$j('#rowMinus').show(); // display="block";
		}
		*/
		
		var board = $j('#boardWriteTbody').clone();
		var index=$j(".boardWriteTbody").length;
		
		// ���߰� �޼ҵ�
		$j('tbody.writer').before(board);
		$j('.delRow').last().show();
		// �Ӽ� ���̹�
		$j('.boardTypeIndex').last().attr('name','boardVoList['+index+'].boardType');
		$j('.boardTitleIndex').last().attr('name','boardVoList['+index+'].boardTitle');
		$j('.boardCommentIndex').last().attr('name','boardVoList['+index+'].boardComment');
		$j('.creatorIndex').last().attr('name','boardVoList['+index+'].creator');
		});
		
		
		// �����, Ư�� ������� rowChk�� ���� �ʾ� ���������־����
		/*
		$j('#rowMinus').click(function(){
		//alert('minus');
		
		
		rowChk-=1;
		$j('.boardWriteTbody').last().remove();
		if(rowChk==0){
			$j('#rowMinus').hide();
			// return alert('����� �Ұ�');
		}
		
		});
		*/
		
		
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
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					// alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
			
			
}

// Ư�� �� ����
function delRow(parameter){
var tbody=parameter.parentNode.parentNode.parentNode;

tbody.remove();

$j('.boardWriteTbody').each(function(index,item){
	
$j(item).find('.boardTypeIndex').attr('name','boardVoList['+index+'].boardType'); 		//prop
$j(item).find('.boardTitleIndex').attr('name','boardVoList['+index+'].boardTitle');
$j(item).find('.boardCommentIndex').attr('name','boardVoList['+index+'].boardComment');
$j(item).find('.creatorIndex').attr('name','boardVoList['+index+'].creator');

});


}

</script>
<body>
<form:form commandName="boardVo" class="boardWriteForm">
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
							<select class="boardTypeIndex" name="boardVoList[0].boardType">
							<c:forEach items="${comCode}" var="menu">
						
							<option value="${menu.codeId}">${menu.codeName}</option>
							</c:forEach>				
							
							
							</select>
							
							<input type="button" class="delRow" value="����" onclick="delRow(this);">
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input class="boardTitleIndex" name="boardVoList[0].boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea class="boardCommentIndex" name="boardVoList[0].boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
						<input type="hidden" class="creatorIndex" name="boardVoList[0].creator" value="${sessionScope.userId}">
				</tbody>
				
				<tbody class="writer">
					<tr>
						<td align="center">
						writer
						</td>
						<td>
						${sessionScope.userId}
						
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