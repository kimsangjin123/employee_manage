<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="euc-kr"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>test</title>

</head>
<script type="text/script">

$j(document).ready(function(){
// let const var
// 호이스팅 var는  어디서든 선언되어도 위로 올라감, 대신 할당은 호이스팅 안됨
// 호이스팅 스코프 내부 어디서든 변수 선언은 위로 간다
// Temporal Dead Zone = TDZ
/* 
	javascript 공부

	호이스팅은 스코프단위로 일어난다.
	변수 생성과정 선언 초기화 할당
	var 선언 초기화 동시에 됨
	let 선언단계초기화 단계가 분리됨
	const 선언 초기화 할당 동시에 됨 선언만 불가능
	
	var 함수 스코프
	let const 블록 스코프
	
	-> if 문 안에서 선언된 var txt는 밖에서도 사용 가능하다
	대신 function 안에서는 var를 밖에서 사용 못한다
	
	생성자 함수
	객체 리터럴
	let user ={
		name : 'Mike',
		age : 30,
	}
	
	개발시에 이런 함수를 여러개 만들 수 있다
	생성자 함수 첫글자를 대문자로 
	
	document.getElementById("test");
	
*/
});
</script>
<body>
<div id="test"></div>
</body>
</html>