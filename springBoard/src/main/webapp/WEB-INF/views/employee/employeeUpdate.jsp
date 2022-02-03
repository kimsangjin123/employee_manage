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
		

		// �ֹι�ȣ Ȯ��
		
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
		
		
		// �۾���
		$j("#submit").on("click",function(){
			
			if(!ssNumberValidate()){
				alert('���Ŀ� ���� �ʴ� �ֹι�ȣ�Դϴ�');
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
					// alert("�ۼ��Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/employee/employeeView.do?employeeId="+employeeId;
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("����");
			    }
			});
			
			
}

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var roadAddr = data.roadAddress; // ���θ� �ּ� ����
            var extraRoadAddr = ''; // ���� �׸� ����

            // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
            // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
            if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
           
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

// �ֹι�ȣ ��ȿ��
function ssNumberValidate(){
        
        var ssNumber1=$j('input[name="ssNumber1"]');
        var ssNumber2=$j('input[name="ssNumber2"]');
        var num1 = ssNumber1.val();
        var num2 = ssNumber2.val();
		
        var arrNum1 = new Array(); // �ֹι�ȣ ���ڸ����� 6���� ���� �迭
        var arrNum2 = new Array(); // �ֹι�ȣ ���ڸ����� 7���� ���� �迭

        // -------------- �ֹι�ȣ -------------

        for (var i=0; i<num1.length; i++) {
            arrNum1[i] = num1.charAt(i);
        } // �ֹι�ȣ ���ڸ��� �迭�� ������� ��´�.

        for (var i=0; i<num2.length; i++) {
            arrNum2[i] = num2.charAt(i);
        } // �ֹι�ȣ ���ڸ��� �迭�� ������� ��´�.

        var tempSum=0;

        for (var i=0; i<num1.length; i++) {
            tempSum += arrNum1[i] * (2+i);
        } // �ֹι�ȣ �˻����� �����Ͽ� �� ��ȣ�� ��� ����Ͽ� ����

        for (var i=0; i<num2.length-1; i++) {
            if(i>=2) {
                tempSum += arrNum2[i] * i;
            }
            else {
                tempSum += arrNum2[i] * (8+i);
            }
        } // ����������� �� ��ȣ ����Ѱ��� �տ� �޹�ȣ ����Ѱ��� ��� ����

        if((11-(tempSum%11))%10!=arrNum2[6]) {
            $j('#ssNumberText').text('�ùٸ� �ֹι�ȣ�� �ƴմϴ�').css('color','red');
			
            ssNumber.focus();
            return false;
        }else{
        	$j('#ssNumberText').text('���Ŀ� �´� �ֹι�ȣ�Դϴ�').css('color','green');
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
						�̸�
						</td>
						<td width="400">
						<input type="text" name="employeeName" maxlength="7" value="${evo.employeeName}"> 
						</td>
					</tr>
					<tr>
						<td align="center">
						�ֹι�ȣ
						</td>
						<td valign="top">
						<input type="text" name="ssNumber1" maxlength="6" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="width:60px;" value="${evo.ssNumber1}"> -
						<input type="text" name="ssNumber2" maxlength="7" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" style="width:80px;" value="${evo.ssNumber2}">
						<input type="button" id="ssNumberChk" value="�ֹι�ȣȮ��">
						<div id="ssNumberText"> </div>
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
						<input type="date" name="startDate" maxlength="10" value="${evo.startDate}">
						</td>
					</tr>
					<tr>
						<td align="center">
						�����
						</td>
						<td valign="top">
						<input type="date" name="regiDate" maxlength="10" value="${evo.regiDate}">
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
						�ּ�
						</td>
						
						<td>
						<input type="text" id="sample4_postcode" name="employeeAddr1" placeholder="�����ȣ" readonly  value="${evo.employeeAddr1}">
						<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��">
						<input type="text" id="sample4_roadAddress" name="employeeAddr2" placeholder="���θ��ּ�" readonly style="width:400px;" value="${evo.employeeAddr2}"> <br>
					
						<input type="text" id="sample4_jibunAddress" name="employeeAddr3" placeholder="�����ּ�" readonly style="width:400px;" value="${evo.employeeAddr3}"> <br>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="sample4_detailAddress"  name="employeeAddr4" placeholder="���ּ�" style="width:400px;" value="${evo.employeeAddr4}"> <br>
						<input type="text" id="sample4_extraAddress"  name="employeeAddr5" placeholder="�����׸�" value="${evo.employeeAddr5}">
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