<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>employeeUpdate</title>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<script type="text/javascript">

	$j(document).ready(function(){
		

		// 주민번호 확인
		
		var ssNumber1=$j('input[name="ssNumber1"]');
		var ssNumber2=$j('input[name="ssNumber2"]');
		
		ssNumber1.on('keyup',function(){
		ssNumber=$j('input[name="ssNumber1"]');
		if(ssNumber.val().length==6){
			ssNumber2.focus();
		}
		});
		
		var ssNumberChk=$j('#ssNumberChk');
		ssNumberChk.click(function(){
		ssNumberValidate();
		
		});
		
		
		// 글쓰기
		$j("#submit").on("click",function(){
			
			if(!ssNumberValidate()){
				alert('형식에 맞지 않는 주민번호입니다');
				ssNumber1.focus();
			}else{
				updateAction();
			}

			
			
			
		});
	

	
	
	});
	
function updateAction(){
			var $frm = $j('.employeeWriteFrm :input');
			var param = $frm.serialize();
			var employeeId=$j('input[name="employeeId"]').val();
			$j.ajax({
			    url : "/employee/employeeUpdateAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					// alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/employee/employeeView.do?employeeId="+employeeId;
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
			
			
}

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
           
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

// 주민번호 유효성
function ssNumberValidate(){
        
        var ssNumber1=$j('input[name="ssNumber1"]');
        var ssNumber2=$j('input[name="ssNumber2"]');
        var num1 = ssNumber1.val();
        var num2 = ssNumber2.val();
		
        var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
        var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

        // -------------- 주민번호 -------------

        for (var i=0; i<num1.length; i++) {
            arrNum1[i] = num1.charAt(i);
        } // 주민번호 앞자리를 배열에 순서대로 담는다.

        for (var i=0; i<num2.length; i++) {
            arrNum2[i] = num2.charAt(i);
        } // 주민번호 뒷자리를 배열에 순서대로 담는다.

        var tempSum=0;

        for (var i=0; i<num1.length; i++) {
            tempSum += arrNum1[i] * (2+i);
        } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함

        for (var i=0; i<num2.length-1; i++) {
            if(i>=2) {
                tempSum += arrNum2[i] * i;
            }
            else {
                tempSum += arrNum2[i] * (8+i);
            }
        } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함

        if((11-(tempSum%11))%10!=arrNum2[6]) {
            $j('#ssNumberText').text('올바른 주민번호가 아닙니다').css('color','red');
			
            ssNumber.focus();
            return false;
        }else{
        	$j('#ssNumberText').text('형식에 맞는 주민번호입니다').css('color','green');
        	return true;
        }



}

</script>
<body>
<form class="employeeWriteFrm">
	<input type="hidden" name="employeeId" value="${evo.employeeId}">
	<table id="writeTable" align="center">
		<tr>
			<td align="right">
			<input id="submit" type="button" value="작성">

			</td>
		</tr>
		<tr>
			<td>

				<table id="boardWriteTable" border ="1">
				<tbody class="boardWriteTbody" id="boardWriteTbody">
	
					<tr>
						<td width="120" align="center">
						부서
						</td>
						<td width="400">
							<select name="department">
						
								<c:forEach var="item" items="${employeeCodeVoList}">
									
									<c:if test="${item.codeType == 'department'}">
										<option value="${item.codeId}"
										
											<c:if test="${item.codeId==evo.department}">
												selected
											</c:if>
										
										>${item.codeName} </option>
									</c:if>
							
								</c:forEach>
						
							</select>		
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						이름
						</td>
						<td width="400">
						<input type="text" name="employeeName" maxlength="7" value="${evo.employeeName}"> 
						</td>
					</tr>
					<tr>
						<td align="center">
						주민번호
						</td>
						<td valign="top">
						<input type="text" name="ssNumber1" maxlength="6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="width:60px;" value="${evo.ssNumber1}"> -
						<input type="text" name="ssNumber2" maxlength="7" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="width:80px;" value="${evo.ssNumber2}">
						<input type="button" id="ssNumberChk" value="주민번호확인">
						<div id="ssNumberText"> </div>
						</td>
					</tr>
					<tr>
						<td align="center">
						직급
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
						입사일
						</td>
						<td valign="top">
						<input type="date" name="startDate" maxlength="10" value="${evo.startDate}">
						</td>
					</tr>
					<tr>
						<td align="center">
						퇴사일
						</td>
						<td valign="top">
						<input type="date" name="regiDate" maxlength="10" value="${evo.regiDate}">
						</td>
					</tr>
					<tr>
						<td align="center">
						근무형태
						</td>
						<td valign="top">
						<select name="workType">
						
							<c:forEach var="item" items="${employeeCodeVoList}">
								
								<c:if test="${item.codeType eq 'worktype'}">
									<option value="${item.codeId}"
										<c:if test="${item.codeId==evo.workType}">
											selected
										</c:if>
									
									>${item.codeName} </option>
								</c:if>
						
							</c:forEach>
						
						</select>
						</td>
					</tr>
					<tr>
						<td align="center">
						주소
						</td>
						
						<td>
						<input type="text" id="sample4_postcode" name="employeeAddr1" placeholder="우편번호" readonly  value="${evo.employeeAddr1}">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
						<input type="text" id="sample4_roadAddress" name="employeeAddr2" placeholder="도로명주소" readonly style="width:400px;" value="${evo.employeeAddr2}"> <br>
					
						<input type="text" id="sample4_jibunAddress" name="employeeAddr3" placeholder="지번주소" readonly style="width:400px;" value="${evo.employeeAddr3}"> <br>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress"  name="employeeAddr4" placeholder="상세주소" style="width:400px;" value="${evo.employeeAddr4}"> <br>
						<input type="text" id="sample4_extraAddress"  name="employeeAddr5" placeholder="참고항목" value="${evo.employeeAddr5}">
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