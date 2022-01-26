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
		

		
		// ���̵� üũ
		userId.on('keyup',function(){
			userIdChk();
			idChkHidden.val('0');
		});

		idChk.click(function(){
			userIdChkAjax();
		});
		
		
		
		// ��й�ȣüũ
		userPw.on('keyup',function(){
			userPwChk();
		});
		
		userPw1.keyup(function(){
			userPwChk1();
		});
		
		// �̸� üũ
		userName.change(function(){
		
			userNameChk();
		
		});
		
		
		// ��ȭ��ȣ üũ

		userPhone2.on('keyup',function(){
			
			userPhone2=$j('input[name="userPhone2"]');
			
			
			if(userPhone2.val().length==4)
			{	
				userPhone3.focus();
			}
			if(userPhone2.val().length>2 && userPhone3.val().length==4)
			{
				$j('#userPhoneText').text('��� ������ ��ȭ��ȣ �Դϴ�').css('color','blue');
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
				$j('#userPhoneText').text('��� ������ ��ȭ��ȣ �Դϴ�').css('color','blue');
			}
			
		});
		
		
		
		
		// �����ȣ üũ
		var reqAddr1=/^(\d{3})(\d{3})$/;
		userAddr1.on('keyup',function(event){

		
			userAddr1=$j('input[name="userAddr1"]');
		
		// setCursorPosition �� ���� �ϴ� ����� �ִ�
		/*
			if(userAddr1.val().length==3 && event.keyCode===8){
			alert('�̺�Ʈ Ű�ڵ�');
			userAddr1.val(userAddr1.val()+'-');
			userAddr1.focus().setCursorPosition(2); // �Լ� ���� �ȵ�, ���ͳݿ��� ã�Ƽ� �غ���
			
			}
		*/	
			
			userAddr1.val(userAddr1.val().replace(/[^0-9]/g,'').replace(reqAddr1,"$1-$2").replace('--','-'));
			// �������� �ƿ� �����ϰ� ��Ŀ���� �Դٰ��� �ϰ� �ʹ�
		
		});
		
		
		// ������ ����
		
		$j('#joinSubmit').click(function(){
		
		userPhone2=$j('input[name="userPhone2"]');
		userPhone3=$j('input[name="userPhone3"]');
		
		if(!userIdChk())
		{
			alert('���̵� ������ �����ּ���');
		
			
		}else if(idChkHidden.val()!='1')
		{
			alert('�ߺ��˻縦 ���ּ���');
			userId.focus();
		
		}
		else if(!userIdChkAjax())
		{
			userId.focus();
		}else if(!userPwChk())
		{
			alert('��й�ȣ ���Ŀ� ���� �ʾƿ�');
			userPw.focus();
			
		}else if(!userPwChk1())
		{
			alert('��й�ȣ�� ���� �ʾƿ�');
			userPw1.focus();
		}else if(!userNameChk())
		{
			alert('�̸��� ���Ŀ� ���� �Է����ּ���');
			userPw1.focus();
		}else if(userPhone2.val()<3)
		{
			alert('��ȭ��ȣ�� ��Ȯ�� �Է����ּ���');
			userPhone2.focus();
			$j('#userPhoneText').text('��� ��ȣ�� 3�� �̻� �Է����ּ���').css('color','red');
			
		}else if(userPhone3.val()<4)
		{
			alert('��ȭ��ȣ�� ��Ȯ�� �Է����ּ���');
			userPhone3.focus();
			$j('#userPhoneText').text('������ ��ȣ�� 4�ڸ� �Է����ּ���').css('color','red');
			
		}
		else
		{
			var $frm= $j('#joinFrm :input');
			var param=$frm.serialize();
			alert('����');
			insertAction(param);
		}
		
		
	
		
		
		});

});


// ������ ����

function insertAction(param)
{

			$j.ajax({
			    url : "/login/userInsertAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    
			    success: function(data, textStatus, jqXHR)
			  	{
					alert("�޼���:"+data.success);
						
				
					location.href = "./login.do";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});


}

// user ���̵� üũ
function userIdChk()
{
	var userId=$j('input[name="userId"]');
	
	var req=/^(?=.*[a-z])(?=.*[\d])[a-z\d\-\_]{4,15}$/;
	
	if(!req.test(userId.val()))
	{
		$j('#userIdText').text('����,����ҹ���1�� �̻�(�빮������) 4~15�ڷ� �ۼ����ּ���').css('color','red');
		return false;
	}
	else{
		$j('#userIdText').text('�ߺ�üũ�� ���ּ���').css('color','red');
		$j('#idChk').show(); 
		return true;
	}
	
		


}
// ���̵� �ߺ�üũ
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
					// alert("�ۼ��Ϸ�");
					
					// alert("�޼���:"+data.success);
					chk= data.success;
					
				
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
		});
	
	if(chk=="N") // count�� 0�̸�
	{	
		alert('�ߺ��� ���̵��Դϴ�');
		textArea.text("�ߺ��ǰų� Ż���� ���̵� �Դϴ�").css('color','red');
		// idChkHidden.val('0');
		userId.focus();
		return false;
						
	}else if(chk=="Y")
	{
		// alert('����� �� �ִ� ���̵��Դϴ�');
		textArea.text("����� �� �ִ� ���̵� �Դϴ�").css('color','blue');
		$j('input[name="userPw"]').focus();
		idChkHidden.val('1');
		return true;
					
	}
					

}




// ��й�ȣ üũ
function userPwChk()
{

	var userPw=$j('input[name="userPw"]');
	var req=/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{6,12}$/;
	
	// var req=/^[0-9]{6,12}$/;
	
	var textArea=$j('#userPwText');
	
	
	if(!req.test(userPw.val()))
	{
		textArea.text('6��~12�� ����,���� ��ҹ���,���� �ּ� ���� �̻�').css('color','red');
		return false;
	}else
	{
		textArea.text('��� ������ ��й�ȣ �Դϴ�').css('color','blue');
		
		return true;
		
	}
}

// ��й�ȣ Ȯ�� üũ
function userPwChk1()
{
	var userPw=$j('input[name="userPw"]');
	var userPw1=$j('input[name="userPw1"]');
	var textArea=$j('#'+userPw1.prop('name')+'Text');
	
	if(userPw.val()!=userPw1.val())
	{
		textArea.text('��й�ȣ�� �޶��').css('color','red');
		return false;
	}else
	{
		textArea.text('��й�ȣ�� ��ġ�մϴ�').css('color','blue');
		$j('input[name="userName"]').focus();
		return true;	
	}
}


// �̸� üũ
function userNameChk()
{

var req=/^[\uac00-\ud7a3]{2,7}/;
var userName=$j('input[name="userName"]');

	if(!req.test(userName.val()))
	{
		$j('#userNameText').text('�ѱ� 2~7�ڷ� �����ּ���').css('color','red');
			return false;
	}else
	{
		$j('#userNameText').text('��� ������ �̸�').css('color','blue');
			return true;
	}
}

// ��ȭ��ȣ üũ
function userPhoneChk()
{
	var userPhone2= $j('input[name="userPhone2"]');
	var userPhone3= $j('input[name="userPhone3"]');
	var userPhoneText=$j('#userPhoneText');
	var req=/^[\d]{3,4}$/;
		
	
	if(!(req.test(userPhone2.val()) && req.test(userPhone3.val())))
	{
		userPhoneText.text('�߸��ȹ�ȣ�Դϴ�.').css('color','red');
		return false;
	}else
	{
		// ������ ��ȣ�� ���ؼ� ��� �Ұ��� ��ȯ
		userPhoneText.text('��� ������ ��ȣ �Դϴ�').css('color','blue');
		return true;
	}

}

function postNoChk(){
var postNo=$j('input[name="userAddr1"]');
var textArea=$j('#'+postNo.prop('name')+'Text');
var req=/^\d{2,3}-\d{3}$/;

	if(!req.test(postNo.val()))
	{
		textArea.text('111-111�������� �����ּ���').css('color','red');
		return false;
	}else
	{
		textArea.text('��� ������ �����ȣ �Դϴ�').css('color','blue');
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
				<td><input type="text" name="userId" placeholder="id�� �Է��ϼ���" maxlength="15">
				<input type="button" id="idChk" value="id check">
				<input type="hidden" id="idChkHidden" value="0">
				<div class="userIdTextClass" id="userIdText"></div>
				</td>
				
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="userPw" placeholder="6~12��">
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
				<td><input type="text" name="userName" placeholder="ȫ�浿" maxlength="7">
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