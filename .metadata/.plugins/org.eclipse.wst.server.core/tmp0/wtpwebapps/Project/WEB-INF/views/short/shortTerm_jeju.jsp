<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <title>단기렌트카_제주</title>
  <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
 
</head>
 <script>
    $(function () {
    	
    	let date = new Date();
    	
    	$('#datetimepicker7').datetimepicker({
        	format: 'L'
        	});
        $('#datetimepicker8').datetimepicker({
        	format: 'L',
            useCurrent: false
        });
        	$('#datetimepicker7').datetimepicker('minDate',date);
        
        $("#datetimepicker7").on("change.datetimepicker", function (e) {
        	$('#datetimepicker8').datetimepicker('minDate', e.date);
           
            
        });
        $("#datetimepicker8").on("change.datetimepicker", function (e) {
            $('#datetimepicker7').datetimepicker('maxDate', e.date);
            
        });
    });
</script>

<script type="text/javascript">

		function checkTest() {

			let testValue11 = new Date(document.getElementById("datep7").value);
			let testValue22 = new Date(document.getElementById("datep8").value);
			let testValue33 = document.getElementById("time_hour7").value;
			let testValue44 = document.getElementById("time_hour8").value;
			
			var total_day=((testValue22-testValue11)/(24*60*60*1000));
			
			if(testValue33<testValue44){
				var hourhour=	testValue44-testValue33;
			}else{
				var hourhour=0;
			}
			
			document.getElementById("total_day").innerHTML = total_day;
			document.getElementById("hourhour").innerHTML = hourhour;

			/* alert(testValue11); */
			let year = testValue22.getFullYear();
			var month = (1 + testValue22.getMonth());
			month = month >=10 ? month: '0' + month;
			var day = testValue22.getDate();
			day = day >=10? day:'0' + day;
			/* alert(year+"-"+month+"-"+day); */
			document.getElementById("date8888h").value = year+"-"+month+"-"+day+"&nbsp;"+testValue33+":00";
			}
		
			function insurance(){
			 	var insuranceFrame = window.open("z_shortTerm_Insurance.jsp","", "left=600, top=300, width=600, height=600,toolbar=no, scrollbars=no, status=no, resizable=no");
			}
			function reser(){
				 if( form.datep7.value  == "" ) { alert("대여일을 입력해주세요."); form.datep7.focus(); return;} 
			else if( form.datep8.value  == "" ) { alert("반납일을 입력해주세요."); form.datep8.focus(); return;} 
		/* 	else if( form.branch_inland7.value  == "" ) { alert("대여일을 입력해주세요."); form.branch_inland7.focus(); return;} 
			else if( form.branch_inland8.value  == "" ) { alert("대여일을 입력해주세요."); form.branch_inland8.focus(); return;}  */
		/* 	else if( form.datep7.value  == "" ) { alert("대여일을 입력해주세요."); form.datep7.focus(); return false;}   */
			/*  else if(form.datep8.value == "" ){form.datep8.focus();} */
			}
			
			function dd7(){
				 
				 let testValue11 = new Date(document.getElementById("datep7").value);
				/* alert(testValue11); */
				let year = testValue11.getFullYear();
				var month = (1 + testValue11.getMonth());
				month = month >=10 ? month: '0' + month;
				var day = testValue11.getDate();
				day = day >=10? day:'0' + day;
				let testValue33 = document.getElementById("time_hour7").value; 
				document.getElementById("date7777").innerHTML=year+"-"+month+"-"+day+"&nbsp;"+testValue33+":00";
				/* document.getElementById("date7777h").innerHTML=year+"-"+month+"-"+day+"&nbsp;"+testValue33+":00"; */
				document.getElementById("date7777h").value = year+"-"+month+"-"+day+"&nbsp;"+testValue33+":00";
				
		 }
			function addop(add){
				let addoption = document.getElementById(add).value;
				document.getElementById("addoptionh").innerHTML=addoption;
				alert(addoption);
			}
			
			function addselec(seq){
				/* let addselect = document.getElementById(selec).value; */
				var seq=seq;
				//document.getElementById("addselech").innerHTML=result;

				$.ajax({
			  		  type:'get',
			  		  url:'/short/carInfo?segment_seq='+seq,
			  		  //data:JSON.stringify(reply),
			  		 //contentType:"application/json; charset=utf-8",
			  		  success:function(result,status,xhr){
			  		    
			  		      alert(JSON.stringify(result));
			  		      alert(result.seq);
			  		      alert(result.model);
			  		     var str="<ul>";
			  		         str+="<li>"+result.model+"</li>"; 
			  		         str+="</ul>"
			  		     $(".carInfo").html(str);
			  		},
			  		 error:function(xhr, status, er){
			  		    if(error){error(er);}
			         }
			})
			}	
			
</script>

<script>
	$(document).ready(function(){
		$("#driver_qualification, #insurance").mouseover(function(){
			$(this).css("cursor","pointer");
		});
		
	});
</script>
<script>
function reset(){
	var result = confirm("정말 취소하시겠습니까?");
	if(result){
	/* $("#reservationForm").ready(function(){
		$("#reset").click(function(){
			$(body).each( function () {
	            this.reset();
			});
		});
	}); */
	location.reload();
	}else{
	   result.close();
	}
}
</script>
<style>
	strong{color: orange;}
	hr{background-color:black;}
</style>
</head>
<body>

<!-- 단기렌트 제목틀-->
<div class="jumbotron bg-white">
  <div class="container col-sm-6">
  <h1>단기렌터카 예약/확인</h1>
  </div>
</div>


<div class="container col-sm-6">
<!-- 메뉴바 -->
<nav class="navbar navbar-expand-sm bg-light navbar-light"><!--  style="text-align: center;" --><!--  style="position:fixed;" -->
  <ul class="select container navbar-nav">
    <li class="nav-item active">    
      <a class="nav-link" href="shortTerm_jeju.jsp">제주예약</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="shortTerm_inland.jsp">내륙예약</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="shortTerm_history.jsp">예약확인</a>
    </li>
  </ul>
</nav>
<br>
<br>
  
  <form class="col-sm-12" action="../payment/z_shortTerm_navbar.jsp" name="reservationForm">
  <div class="comment row col-sm-10"><h3>기간/지점 선택&nbsp;<span style="font-size: 12px;"><strong>기간ㆍ지점ㆍ차량</strong>은 순서와 관계없이 <strong>선택 예약이 가능</strong>합니다.</span></h3></div>
  
  <hr>
  <!-- 기간지점선택테이블 -->
  <table style="width: 100%">
  <tr class="row">
  	<td class="col-sm-5">
        <div class="col-sm-12"> <!-- class="col-md-6" -->
         <div class="row form-group">
           <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
                <input type="text" id="datep7" name="datep7" class="form-control datetimepicker-input" data-target="#datetimepicker7" placeholder="대여일 선택" name="datep7"/>
                <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
         <select class="form-control" id="time_hour7" name="time_hour7">
        <c:forEach var="time" varStatus="i" begin="6" end="22" step="1">
			<option value="<fmt:formatNumber value='${time}' pattern='00' />">
				<fmt:formatNumber value="${time }" pattern="00시" />
			</option>
		</c:forEach>
	</select>
            </div>
    </div>
        </div>
  	</td>
  	<td class="col-sm-5">
     <div class="col-sm-12">
      <div class="row form-group">
           <div class="input-group date" onchange="checkTest()" id="datetimepicker8" data-target-input="nearest">
                <input type="text" id="datep8"  class="form-control datetimepicker-input" data-target="#datetimepicker8" placeholder="반납일 선택"name="datep8"/>
                <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
         <select class="form-control" id="time_hour8" name="time_hour8">
        <c:forEach var="time" varStatus="i" begin="6" end="22" step="1">
			<option value="<fmt:formatNumber value='${time}' pattern='00' />">
				<fmt:formatNumber value="${time }" pattern="00시" />
			</option>
		</c:forEach>
	</select>
            </div>
        </div>
        </div>
  	</td>
  	<td>
  <div class="border float-right" align="center">
  					<strong>총 대여일</strong>
  								<p><b id="total_day">0</b>일&nbsp;<b id="hourhour">0</b>시간</p>
  					</div>
  	</td>
  </tr>
  <tr class="row"><!-- col-sm-10 -->
  	<td class="col-sm-5">
  	<div class="row">
  		<div class="col input-group-append">
  		<select class="form-control col-sm-8" id="branch" value="제주" name="branch" disabled="disabled">
  				<option>제주/제주지점</option>
  		</select>
  		&nbsp;
  			<button type="button" class="btn btn-dark col-sm-4" data-toggle="modal" data-target="#location_jeju" >지도보기</button>
  			</div>
  			</div>
  	</td>
  	<td class="col-sm-5">
  	<div class="row">
  		<div class="col input-group-append">
  	<select class="form-control col-sm-8" id="branch2" value="제주" name="branch2" disabled="disabled">
  				<option>제주/제주지점</option>
  			</select>
  			&nbsp;
  			<button type="button" class="btn btn-dark col-sm-4" data-toggle="modal" data-target="#location_jeju" >지도보기</button>
  			</div>
  			</div>
  	</td>
  	<td class="col-sm-2"></td>
  </tr>
  <tr>
  	<td colspan="3">
  	  <br>
  <br>
  		<div class="form-group" style="border: 1px solid orange;">
    	<fieldset>
    	  <br>
    		<ul>
    			<li>예약가능시간 : 제주지점(대여/반납 06:00 ~ 22:00)</li>
    			<li>반려동물 동반 탑승은 불가합니다. (케이지 포함) <br>
    					(* 다음 이용 고객에 알레르기 등 불편을 줄 수 있어, 동반 탑승 시 클리닝 비용(10만원 이상)이 추가 발생할 수 있습니다.)   
    			</li>
    		</ul>
    		 <br>
  		</fieldset>
  		</div>
  	</td>
  </tr>
  </table>
  <br>
  <br>
  
 <div class="comment row col-sm-7"><h3>차량 선택<span style="font-size: 12px;">예약완료된 차량은 선택이 불가합니다.</span></h3></div>
<hr>
<div class="col-sm-12">
   <table style="width: 100%;">
  	<tr class="row border" align="center" style="height:100px;">
  		<td class="col" style=" margin:0%; padding:0%;"><button type="button" class="col-sm-12 btn btn-outline-warning" id="addselec1" name="addselec1" value="전체" onclick="addselec('0')"style="height:100%;">전체</button></td>
  		<td class="col" style=" margin:0%; padding:0%;"><input type="button" class="col-sm-12 btn btn-outline-warning" id="addselec2" name="addselec2" value="소형" onclick="addselec('1')"style="height:100%;"></input></td>
  		<td class="col" style=" margin:0%; padding:0%;"><input type="button" class="col-sm-12 btn btn-outline-warning" id="addselec3" name="addselec3" value="중형" onclick="addselec('2')"style="height:100%;"></input></td>
  		<td class="col" style=" margin:0%; padding:0%;"><input type="button" class="col-sm-12 btn btn-outline-warning" id="addselec4" name="addselec4" value="대형" onclick="addselec('3')"style="height:100%;"></input></td>
  		<td class="col" style=" margin:0%; padding:0%;"><input type="button" class="col-sm-12 btn btn-outline-warning" id="addselec5" name="addselec5" value="승합" onclick="addselec('4')"style="height:100%;"></input></td>
  		<td class="col" style=" margin:0%; padding:0%;"><input type="button" class="col-sm-12 btn btn-outline-warning" id="addselec6" name="addselec6" value="SUV/5인승" onclick="addselec('5')"style="height:100%;"></input></td>
  		<td class="col" style=" margin:0%; padding:0%;"><input type="button" class="col-sm-12 btn btn-outline-warning" id="addselec7" name="addselec7" value="수입/전기차" onclick="addselec('6')"style="height:100%;"></input></td>
  	</tr>
  	<tr class="overflow-auto row border" style="max-height: 150px">
  		<c:forEach begin="0" end="1">
  		<td class="border col-sm-6" colspan="3">
  			<c:forEach begin="0" end="5">
      	 	 <div class="row">
      	 	 <div class="carInfo"></div>
        	</div>
        	</c:forEach>
        	</td>
        	</c:forEach>
  	</tr>
  </table> 
  </div>
<br>
<br>

 <div  class="comment row col-sm-7"><h3>차량손해면책제도 선택</h3>&nbsp;&nbsp;
 <svg id="insurance" onclick="insurance()" class="float-right" style="color:orange;" width="1em" height="2em" viewBox="0 0 16 16" class="bi bi-question-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path  fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path  d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
</svg>
</div>
  <hr>
  <div class="col-sm-12">
  <table style="width: 100%">
  	<tr class="border row">
  		<td class="col"style=" margin:0%; padding:0%;"><button type="button" class="col-sm-12 btn btn-outline-warning" id="addoption1" name="addoption1" value="선택안함" onclick="addop('addoption1')" style="height:100%;">선택안함</button></td>
  		<td class="col"style=" margin:0%; padding:0%;"><button type="button" class="col-sm-12 btn btn-outline-warning" id="addoption2" name="addoption2" value="완전 자차-면책금 0원" onclick="addop('addoption2')" style="height:100%;">완전 자차<p>면책금 0원</p></button></td>
  		<td class="col "style=" margin:0%; padding:0%"><button type="button" class="col-sm-12 btn btn-outline-warning" id="addoption3" name="addoption3" value="일반 자차-면책금 50만원" onclick="addop('addoption3')" style="height:100%;">일반 자차<p>면책금 50만원</p></button></td>
  		
  	</tr>
	<tr class="row"><td colspan="3"height="20px;"></td></tr>
  	<tr class="border row">
  		<td colspan="3">
  	<div class="form-group">
  			<br>
  			<ul>
  				<li>제주지점에서는 스마트폰 거치대를 무료로 대여해드립니다. (수량한정)</li>
  				<li>부가서비스 (카시트/유모차) 예약 및 문의는 TT렌터카 제주지점&nbsp;064-111-1111 또는 홈페이지 www.TTrent.com 로 문의바랍니다.
  						<p>(* 지정 업체인 ‘제주아이’ 외 타 업체 이용 시 분실 우려가 있어, SK렌터카 제주지점을 통한 인수/반납 및 사전 장착 서비스 이용이 불가합니다.)</p>
  				</li>
  			</ul>
  		</div>
  		</td>
  	</tr>
  </table>
  </div>
  <br>
  <br>
  
<div class="comment row col-sm-6"><h3>계약자 정보입력 (제1운전자)</h3></div>
<hr>
<div class="col-sm-12">
<p class="row">여객자동차운수사업법 제34조 2항 개정에 따른 대여자동차 운전자의 자격 확인
  <b>&nbsp;<svg id="driver_qualification" data-toggle="modal" data-target="#myModal" onclick="confirm0()" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-question-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
</svg></b>
</p>
<p class="row" style="color: orange;">※ 실제 운전자 정보를 입력해주세요! 입력한 제1운전자와 예약자가 상이할 경우 대여가 제한될 수 있습니다.</p>
<div class="row">
<input type="text" class="col form-control"  id="name" name="name" placeholder="이름 입력" disabled="disabled">
<input class="col form-control" type="text" id="birth" name="birth" placeholder="생년월일 (20170101)입력" disabled="disabled">
<input class="col form-control" type="text" id="phone" name="phone" placeholder="휴대폰번호 (-없이)입력">
</div>
<br>
  <div class="row">
  <input type="text" class="col form-control" placeholder="이메일 입력" id="email1" name="email1">
    <span class="input-group-text">@</span>
 <input type="text" class="col form-control" placeholder="직접 입력" id="email2" name="email2">
  </div>
<br>  
  <div class="row">
<input class="col-sm-2 form-control" type="text" id="name" name="name" placeholder="우편번호 검색" disabled="disabled">
<input class="col-sm-4 form-control" type="text" id="birth" name="birth" placeholder="주소 입력" disabled="disabled">
<input class="col-sm-4 form-control" type="text" id="phone" name="phone" placeholder="나머지 주소 입력" disabled="disabled">
<button class="col-sm-2 btn btn-dark" disabled="disabled">우편번호 검색</button>
</div>
<br>
 <div class="row">
<select class="col form-control" id="license_type" name="license_type" disabled="disabled">
	<option>면허종류 선택</option>
</select>
<input class="col form-control" type="text" id="birth" name="birth" placeholder="면허번호 (-없이) 입력" disabled="disabled">
</div>
<br>
 <div class="row">
<input class="col form-control" type="text" id="name" name="name" placeholder="적성검사 만료일 (20170101) 입력" >
<input class="col form-control" type="text" id="birth" name="birth" placeholder="운전면허 발급일 (20170101) 입력">
</div>
<br>
</div>
<ul class="row">
	<li>면허번호 입력 예) (구)면허번호 : 서울-01-123456-00 (신)면허번호 : 11-01-123456-00</li>
	<li><p style="color: orange;">면허정보 입력 시 아래 ‘대여자격 확인 동의’를 꼭 확인하세요!</p></li>
</ul>
<br>
<br>

<div class="comment row col-sm-6"><h3>이용약관</h3></div>
<hr>
<div class="form-group">
	<p style="font-size: 14px;">TT렌터카㈜는 적법하고 공정한 방법으로 개인정보를 수집하며, 고객의 개인정보를 최우선으로 생각하여 안전하게 보유·관리하고 있습니다.</p>
	<h5>개인정보 제공 활용 동의</h5>
	
<%@include file="z_agreement_collpase.jsp" %>

</div>	
	<ul class="row">
		<li>고객님께서는 동의를 거부할 권리가 있으나, 미 동의시 렌터카 서비스 이용이 불가능합니다.</li>
	</ul>
<br>
<br>
<input type="hidden" id="date7777h" value="" name="date7777h"/>
<input type="hidden" id="date8888h" value="" name="date8888h"/>
<input type="hidden" id="addoptionh" value="" name="addoptionh"/>
<input type="hidden" id="addselech" value="" name="addselech"/>

</form>
</div>
<br>
<br>
<br>
<br>
<br>
<%@ include  file="z_shortTerm_show.jsp"%>
<%@ include file="z_shortTerm_show_brachLocation.jsp" %>
<%@ include file="./z_shortTerm_navbar.jsp" %>
</body>
</html>
