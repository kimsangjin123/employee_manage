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
			var $frm = $j('#frmSearch :input');
			var param = $frm.serialize();
			getPage(param);
			
			
			// 조회클릭시 페이지 가져오기 작동
			$j('#search').on('click',function(){
				// alert('조회클릭');
				$j("#boardSelect").empty();
				var $frm = $j('#frmSearch :input');
				var param = $frm.serialize();
				getPage(param);
			});
			
			
			
			
			
			/*
			$j.ajax({
			    url : "/board/boardSelectAjax.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    contentType: 'application/x-www-form-urlencoded; charset=euc-kr',

			    success: function(data, textStatus, jqXHR)
			    {
					// alert("작성완료");
					const totalCnt=data.totalCnt;
					const boardList=data.boardList;
					var rowData="";
					for(var i=0; i<boardList.length; i++){
					rowData+="<tr>";
					rowData+="<td>"+boardList[i]['comCode']['codeName']+"</td>";
					rowData+="<td>"+boardList[i]['boardNum']+"</td>";
					rowData+="<td>"+boardList[i]['boardTitle']+"</td>";
					rowData+="</tr>";
					}
					
					$j("#boardSelect").html(rowData);
					
					$j("#totalCnt").text("total"+totalCnt);
					// alert("메세지:"+data.succcess); 
				
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
			*/
		

		
		
		/*
		var boardTypeAll = $j('input:checkbox[name="boardTypeAll"]');
		var boardTypeList = $j('input:checkbox[name="boardTypeList"]');

		*/
		
		
		// 전체 클릭시 모두 체크 or 해제
		$j('input:checkbox[name="boardTypeAll"]').click(function(){
			if($j('input:checkbox[name="boardTypeAll"]').is(":checked"))
			{
				// alert('모두체크');

				$j('input:checkbox[name="boardTypeList"]').each(function(){this.checked=true;});

			}else
			{
				// alert('체크해제');

				$j('input:checkbox[name="boardTypeList"]').each(function(){this.checked=false;});

			}
		
		
		});
		
		// boardtypeList 체크 해제시 전체선택해제
		$j('.boardTypeList').click(function(){
		
		if($j('input[name=boardTypeList]:checked').length==4){
			$j('#boardTypeAll').prop("checked",true);
		}else{
			$j('#boardTypeAll').prop("checked",false);
		}	
		
		
		});
	});

// 페이징
function getPage(param){

			$j.ajax({
			    url : "/board/boardSelectAjax.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    contentType: 'application/x-www-form-urlencoded; charset=euc-kr',

			    success: function(data, textStatus, jqXHR)
			    {
					// alert("작성완료");
					
					
					const totalCnt=data.totalCnt;
					const boardList=data.boardList;
					const pageVo=data.pageVo;
					// alert(pageVo.pageNo);
					var rowData="";
					for(var i=0; i<boardList.length; i++){
					//alert(boardList[i]['boardType']+boardList[i]['boardNum']);
				
					rowData+="<tr>";
					rowData+="<td>"+boardList[i]['comCode']['codeName']+"</td>";
					rowData+="<td>"+boardList[i]['boardNum']+"</td>";
					
					// 랙
					rowData+="<td><a href='/board/";
					rowData+=boardList[i]['boardType'];
					rowData+="/"
					rowData+=boardList[i]['boardNum'];
					rowData+="/boardView.do?pageNo=";
					rowData+=pageVo.pageNo+"'>";
					rowData+=boardList[i]['boardTitle'];
					rowData+="</a></td>";
					rowData+="</tr>";
					}
					
					$j("#boardSelect").html(rowData);
					
					$j("#totalCnt").text("total"+totalCnt);
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
		<td>
		
		<c:if test="${empty sessionScope.userId}">
		<a href="../login/login.do">login<a/>
		<a href="../login/join.do">join<a/>
		</c:if>
		<c:if test="${sessionScope.userId != null}">
		<a href="/login/logout.do">로그아웃</a>
		</c:if>
		</td>
		<td align="right" id="totalCnt">
		
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>


				<tbody id="boardSelect">

				</tbody>

			</table>
		</td>
	</tr>
	<tr>
		<td align="right">

			

			<a href ="/board/boardWrite.do">글쓰기</a>

		</td>
	</tr>
	<tr>
		<td align="left">
			<form id="frmSearch">
				<input type="hidden" name="page" value="1">
				<input type="checkbox" id="boardTypeAll" name="boardTypeAll" value="all">
			
					<label for="boardTypeList">전체</label>

				<c:forEach items="${comCodeList}" var="list">

				<input type='checkbox' class="boardTypeList" id="${list.codeId}" name="boardTypeList" value="${list.codeId}">
				<label for="${list.codeId}" >${list.codeName}</label>
				
				</c:forEach>
				
			<input type="button" id="search" value="조회">
			</form>
		</td>
	</tr>
</table>	
</body>
</html>