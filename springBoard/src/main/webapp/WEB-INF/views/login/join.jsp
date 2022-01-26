<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
<style>
#joinTable{margin:auto;}
</style>
</head>
<script type="text/javascript">

$j(document).ready(function(){
	
			
		var userId=$j('input[name="userId"]');
		var idChk=$j('#idChk');
		var userPw=$j('input[name="userPw"]');
		var userPw1=$j('input[name="userPw1"]');
		var userAddr1=$j('input[name="userAddr1"]');
		var userName=$j('input[name="userName"]');
		var userPhone1=$j('input[name="userPhone1"]');
		var userPhone2=$j('input[name="userPhone2"]');
		var userPhone3=$j('input[name="userPhone3"]');
		var idChkHidden=$j('#idChkHidden');
		

		
		// 아이디 체크
		userId.on('keyup',function(){
			userIdChk();
			idChkHidden.val('0');
		});

		idChk.click(function(){
			userIdChkAjax();
		});
		
		
		
		// 비밀번호체크
		userPw.on('keyup',function(){
			userPwChk();
		});
		
		userPw1.keyup(function(){
			userPwChk1();
		});
		
		// 이름 체크
		userName.change(function(){
		
			userNameChk();
		
		});
		
		
		// 전화번호 체크

		userPhone2.on('keyup',function(){
			
			userPhone2=$j('input[name="userPhone2"]');
			
			
			if(userPhone2.val().length==4)
			{	
				userPhone3.focus();
			}
			if(userPhone2.val().length>2 && userPhone3.val().length==4)
			{
				$j('#userPhoneText').text('사용 가능한 전화번호 입니다').css('color','blue');
			}

		});
		userPhone3.on('keyup',function(){
			userPhone3=$j('input[name="userPhone3"]');
			userPhone2=$j('input[name="userPhone2"]');
			
			
			if(userPhone3.val().length==4)
			{
			userAddr1.focus();
			}
			
			if(userPhone2.val().length>2 && userPhone3.val().length==4)
			{
				$j('#userPhoneText').text('사용 가능한 전화번호 입니다').css('color','blue');
			}
			
		});
		
		
		
		
		// 우편번호 체크
		var reqAddr1=/^(\d{3})(\d{3})$/;
		userAddr1.on('keyup',function(event){

		
			userAddr1=$j('input[name="userAddr1"]');
		
		// setCursorPosition 을 만들어서 하는 방법도 있다
		/*
			if(userAddr1.val().length==3 && event.keyCode===8){
			alert('이벤트 키코드');
			userAddr1.val(userAddr1.val()+'-');
			userAddr1.focus().setCursorPosition(2); // 함수 정의 안됨, 인터넷에서 찾아서 해보기
			
			}
		*/	
			
			userAddr1.val(userAddr1.val().replace(/[^0-9]/g,'').replace(reqAddr1,"$1-$2").replace('--','-'));
			// 하이픈을 아예 고정하고 포커스를 왔다갔다 하고 싶다
		
		});
		
		
		// 데이터 전송
		
		$j('#joinSubmit').click(function(){
		
		userPhone2=$j('input[name="userPhone2"]');
		userPhone3=$j('input[name="userPhone3"]');
		
		if(!userIdChk())
		{
			alert('아이디 형식을 맞춰주세요');
		
			
		}else if(idChkHidden.val()!='1')
		{
			alert('중복검사를 해주세요');
			userId.focus();
		
		}
		else if(!userIdChkAjax())
		{
			userId.focus();
		}else if(!userPwChk())
		{
			alert('비밀번호 형식에 맞지 않아요');
			userPw.focus();
			
		}else if(!userPwChk1())
		{
			alert('비밀번호가 같지 않아요');
			userPw1.focus();
		}else if(!userNameChk())
		{
			alert('이름을 형식에 맞춰 입력해주세요');
			userPw1.focus();
		}else if(userPhone2.val()<3)
		{
			alert('전화번호를 정확히 입력해주세요');
			userPhone2.focus();
			$j('#userPhoneText').text('가운데 번호는 3자 이상 입력해주세요').css('color','red');
			
		}else if(userPhone3.val()<4)
		{
			alert('전화번호를 정확히 입력해주세요');
			userPhone3.focus();
			$j('#userPhoneText').text('마지막 번호는 4자를 입력해주세요').css('color','red');
			
		}
		else
		{
			var $frm= $j('#joinFrm :input');
			var param=$frm.serialize();
			alert('성공');
			insertAction(param);
		}
		
		
	
		
		
		});

});


// 데이터 전송

function insertAction(param)
{

			$j.ajax({
			    url : "/login/userInsertAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    
			    success: function(data, textStatus, jqXHR)
			  	{
					alert("메세지:"+data.success);
						
				
					location.href = "./login.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});


}

// user 아이디 체크
function userIdChk()
{
	var userId=$j('input[name="userId"]');
	
	var req=/^(?=.*[a-z])(?=.*[\d])[a-z\d\-\_]{4,15}$/;
	
	if(!req.test(userId.val()))
	{
		$j('#userIdText').text('숫자,영어소문자1자 이상(대문자제외) 4~15자로 작성해주세요').css('color','red');
		return false;
	}
	else{
		$j('#userIdText').text('중복체크를 해주세요').css('color','red');
		$j('#idChk').show(); 
		return true;
	}
	
		


}
// 아이디 중복체크
function userIdChkAjax()
{
	var userId=$j('input[name="userId"]');
	var param=userId.serialize();
	var textArea=$j('#'+userId.prop('name')+'Text');
	var idChkHidden=$j('#idChkHidden');
	var chk;
		$j.ajax({
			    url : "/login/userIdChk.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    async: false,
			    success: function(data, textStatus, jqXHR)
			    {
					// alert("작성완료");
					
					// alert("메세지:"+data.success);
					chk= data.success;
					
				
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
		});
	
	if(chk=="N") // count가 0이면
	{	
		alert('중복된 아이디입니다');
		textArea.text("중복되거나 탈퇴한 아이디 입니다").css('color','red');
		// idChkHidden.val('0');
		userId.focus();
		return false;
						
	}else if(chk=="Y")
	{
		// alert('사용할 수 있는 아이디입니다');
		textArea.text("사용할 수 있는 아이디 입니다").css('color','blue');
		$j('input[name="userPw"]').focus();
		idChkHidden.val('1');
		return true;
					
	}
					

}




// 비밀번호 체크
function userPwChk()
{

	var userPw=$j('input[name="userPw"]');
	var req=/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
	
	// var req=/^[0-9]{6,12}$/;
	
	var textArea=$j('#userPwText');
	
	
	if(!req.test(userPw.val()))
	{
		textArea.text('6자~12자 사이,영어 대소문자,숫자 최소 한자 이상').css('color','red');
		return false;
	}else
	{
		textArea.text('사용 가능한 비밀번호 입니다').css('color','blue');
		
		return true;
		
	}
}

// 비밀번호 확인 체크
function userPwChk1()
{
	var userPw=$j('input[name="userPw"]');
	var userPw1=$j('input[name="userPw1"]');
	var textArea=$j('#'+userPw1.prop('name')+'Text');
	
	if(userPw.val()!=userPw1.val())
	{
		textArea.text('비밀번호가 달라요').css('color','red');
		return false;
	}else
	{
		textArea.text('비밀번호가 일치합니다').css('color','blue');
		$j('input[name="userName"]').focus();
		return true;	
	}
}


// 이름 체크
function userNameChk()
{

var req=/^[\uac00-\ud7a3]{2,7}/;
var userName=$j('input[name="userName"]');

	if(!req.test(userName.val()))
	{
		$j('#userNameText').text('한글 2~7자로 적어주세요').css('color','red');
			return false;
	}else
	{
		$j('#userNameText').text('사용 가능한 이름').css('color','blue');
			return true;
	}
}

// 전화번호 체크
function userPhoneChk()
{
	var userPhone2= $j('input[name="userPhone2"]');
	var userPhone3= $j('input[name="userPhone3"]');
	var userPhoneText=$j('#userPhoneText');
	var req=/^[\d]{3,4}$/;
		
	
	if(!(req.test(userPhone2.val()) && req.test(userPhone3.val())))
	{
		userPhoneText.text('잘못된번호입니다.').css('color','red');
		return false;
	}else
	{
		// 데이터 번호랑 비교해서 사용 불가로 전환
		userPhoneText.text('사용 가능한 번호 입니다').css('color','blue');
		return true;
	}

}

function postNoChk(){
var postNo=$j('input[name="userAddr1"]');
var textArea=$j('#'+postNo.prop('name')+'Text');
var req=/^\d{2,3}-\d{3}$/;

	if(!req.test(postNo.val()))
	{
		textArea.text('111-111형식으로 적어주세요').css('color','red');
		return false;
	}else
	{
		textArea.text('사용 가능한 우편번호 입니다').css('color','blue');
		return true;
	}

}


</script>
<body>

<form id="joinFrm">
<table id="joinTable">
	<tr>
		<td align="left"><a href="../board/boardList.do">List</a></td>
	<tr>
	<tr>
		<td>
		<table border="1" align="center">
			<tr>
				<td>id</td>
				<td><input type="text" name="userId" placeholder="id를 입력하세요" maxlength="15">
				<input type="button" id="idChk" value="id check">
				<input type="hidden" id="idChkHidden" value="0">
				<div class="userIdTextClass" id="userIdText"></div>
				</td>
				
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="userPw" placeholder="6~12자">
				<div id="userPwText"></div>
				</td>
				
			</tr>
			<tr>
				<td>pw check</td>
				<td><input type="password" name="userPw1">
				<div id="userPw1Text"></div>
				</td>
				
			</tr>
			<tr>
				<td>name</td>
				<td><input type="text" name="userName" placeholder="홍길동" maxlength="7">
				<div id="userNameText"></div>
				</td>
			
			</tr>
			<tr>
				<td>phone</td>
				<td>
			 	<select name="userPhone1">
			 	<c:forEach items="${phoneList}" var="list">
			 	
			 	<option value="${list.codeName}">${list.codeName }</option>
			 	</c:forEach>
			 	</select>-
				<input type="text" name="userPhone2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" style="width:40px;">-
				<input type="text" name="userPhone3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" style="width:40px;">
				<div id="userPhoneText"></div>
				</td>
			</tr>	
			<tr>
				<td>postNo</td>
				<td><input type="text" name="userAddr1" maxlength="7">
				<div id="userAddr1Text"></div>
				</td>
				
			</tr>	
			<tr>
				<td>address</td>
				<td><input type="text" name="userAddr2" maxlength="70">
				<div id="userAddr2Text"></div>
				</td>
				
			</tr>	
			<tr>
				<td>company</td>
				<td><input type="text" name="userCompany" maxlength="30">
				<div id="userCompanyText"></div>
				</td>
			</tr>		
		</table>
		</td>
	</tr>
	
	<tr>
		<td><input id="joinSubmit" type="button" value="join"></td>
	</tr>
</table>
</form>	
</body>
</html>