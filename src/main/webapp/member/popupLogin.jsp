<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/member/css/popupLogin.css">
<script>
$(document).ready(function(){
	$("#btnCanlcel").on("click",function(){
		self.close(); // 취소버튼 클릭 시 팝업 창닫기
	});


	$("#btnLogin").on("click", function() {
		let id = $("#id").val();
		let pw = $("#pw").val();

		if ($("#id").val() === "" || $("#pw").val() === "") {
			alert("아이디 혹은 비밀번호를 정확히 입력하세요.");
			return;
		}
		console.log("id : " , id);
		console.log("pw : " , pw);
		$("#loginForm").submit();

	});

	console.log("${rs}");
	if("${rs}" === "ok"){
		console.log("${rs}");
		alert("로그인 성공!");
		opener.document.location.href ="/Tohome";
		self.close();	


	}else if("${rs}" === "no"){
		console.log("${rs}");
		alert("로그인 실패!");
	}



	$("#btnFindID").on("click", function() {
		if( $("#find_name").val() === "" || $("#find_phone2").val() === "" || $("#find_phone3").val() === "" ){
			alert("이름과 전화번호를 입력해주세요.");
			return;
		}

		let phone = $("#find_phone1 option:selected").val() + $("#find_phone2").val() + $("#find_phone3").val();
		$("#find_phone").val(phone);

		let regexPhone = /[0-9]{11}/;

		if(!regexPhone.test(phone)){
			alert("올바르지 않은 형식의 전화번호 입니다.");
			return;
		}

		let data = $("#findIdForm").serialize();


		$.ajax({
	
			url : "/findId.mem"
			, type : "post"
			, data : data
			, dataType : "json"
			, success : function(id){
				console.log("받아온 id",id);
				if(id != "fail"){
					$(".findId_body").css("display", "none");
					$(".findId_hiddenbody").css("display", "block");
			
					for(let data of id){
						let rs = $("<p>").html(data.user_id);
						let col = $("<div>").addClass("col d-flex justify-content-center").append(rs);
						let row = $("<div>").addClass("row").append(col);
						$("#findId_result").append(row);
					}
			
				}else{
					alert("가입된 아이디가 없습니다.");
				}
		
			}, error : function(e){
				console.log(e);
			}

		})

	});//findId 끝

	
	$("#btnFindPW").on("click", function() { //비밀번호찾기
		if( $("#findPw_name").val() === "" || ( $("#findPw_id").val() === "")){
			alert("이름 혹은 아이디를 입력해주세요");
			return;
		}
		
		let data = $("#findPwForm").serialize();
		
		$.ajax({
			url : "/findPw.mem"
			, type : "post"
			, data : data
			, success : function(rs){
				console.log("받아온 rs",rs);
				if(rs == "exist"){	
					$(".findPw_body").empty();
					//prop("type", "password");
					let input = $("<input>").addClass("form-control")
					
					
				}else if(rs === "no"){
					alert("가입된 아이디가 없습니다.");
				}
				
				
			}, error : function(e){
				console.log(e);
			}
			
		})
		
	});//findPw 끝
	
	$('#btnSignup').on("click", function() {
		window.opener.location.href = "/toSignup.mem";
		self.close();
	})
	
	
	
});//document.ready 종료
	
</script>
</head>
<body>
<form id="loginForm" action="/toLoginProc.mem" method="post">
 <div class="container">
        <!-- X아이콘 -->
        <div class = "row m-2 icon">
            <div class = "col-12 d-flex justify-content-end">
                <i id="btnCanlcel" class="bi bi-x-lg"></i>
            </div>
        </div>
        <!-- 로그인 타이틀 -->
        <div class = "row m-2 header">
            <div class = "col-12 d-flex justify-content-center" style="text-align: center;">
                <h2>로그인</h2>
            </div>
        </div>
        <!-- 아이디 비밀번호 입력창 -->
        <div class = "row p-3 inputBox">
            <div class="col-12">
                <input type = "text" class="form-control idLogin" id="id" name="id" placeholder="아이디를 입력해주세요."> 
            </div>
        </div>
        <div class = "row p-3 inputBox">
            <div class="col-12">
                <input type = "password" class="form-control idLogin" id="pw" name="pw" placeholder="비밀번호를 입력해주세요."> 
            </div>
        </div>
        <!-- 로그인 버튼 -->
        <div class = "row p-4">
            <div class="col-12  d-flex justify-content-center">
                <button type = "button" class = "btn btn-primary" id = "btnLogin">로그인</button>
            </div>
        </div>

				<!-- 회원가입 버튼 -->
				<div class = "row p-4">
            <div class="col-12  d-flex justify-content-center">
                <button type = "button" class = "btn btn-danger" id = "btnSignup">회원가입</button>
            </div>
        </div>

        <!-- 카카오 로그인 -->
        <div class = "row">
            <div class="col-12  d-flex justify-content-center kakaoLogin">
                <a href = ""><img src = "/resources/images/kakao_login.png"></a>                
            </div>
        </div>
        <!-- 아이디, 비밀번호 찾기-->
        <div class = "row m-3">
            <div class = "col-12 d-flex justify-content-center kakaoLogin">
                <p data-bs-toggle="modal" data-bs-target="#staticBackdrop1">아이디 찾기&emsp;</p>

                <p data-bs-toggle="modal" data-bs-target="#staticBackdrop2">&emsp;비밀번호 찾기</p>
            </div>
        </div>
      </div>
</form>
<!-- id찾기 -->

<div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">아이디 찾기</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
       	<form id="findIdForm" action="/findIdForm.mem" method="post">
	       	<div class="modal-body findId_body">   
	            <div class="row nameBox m-2">
	                <div class="col-3 d-flex justify-content-center">
	                    <label for="name" class="form-label">이름</label>
	                </div>
	                <div class="col-9 d-flex justify-content-center">
	                    <input type="text" class="form-control" placeholder="ex)홍길동" name="find_name" id="find_name">
	                </div>
	            </div>
	            <div class="row phoneBox m-2 mt-4">
	                <div class="col-3 d-flex justify-content-center">
	                    <label for="phone" class="form-label">휴대폰 번호</label>
	                </div>
	                <div class="col-9 d-flex justify-content-center">
	                    <div class="col-4">
	                        <select class="form-select" id="find_phone1" style="margin-top:8px;">
	                            <option value="010" selected>010</option>
	                            <option value="011">011</option>
	                            <option value="016">016</option>
	                            <option value="017">017</option>
	                            <option value="018">018</option>
	                            <option value="019">019</option>
	                        </select>
	                    </div>
	                    <div class="col-4 p-2">
	                        <input type="text" class="form-control" id="find_phone2" maxlength="4">
	                    </div>
	                    <div class="col-4 p-2">
	                        <input type="text" class="form-control" id="find_phone3" maxlength="4">
	                    </div>
	                    <div class="col d-none">
	                        <input type="text" id="find_phone" name="find_phone">
	                    </div>
	                </div>
	            </div> 
	            <div class="row btns mt-4">
	                <div class="col-12 d-flex justify-content-center">
	                    <button type="button" class="btn btn-primary" id="btnFindID">아이디 찾기</button>
	                </div>
	            </div>
	            <div class="row anchor mt-4">
	                <div class="col-12 d-flex justify-content-center">
	                    <a href="" id="findPw"  data-bs-toggle="modal" data-bs-target="#staticBackdrop2">비밀번호 찾기</a>
	                </div>
	            </div>
	        </div>
	        <div class="modal-body findId_hiddenbody" style="display: none;">   
	            <div class="row nameBox m-2">
	                <div class="col-12 d-flex justify-content-center">
	                    <label for="name" class="form-label">가입된 ID</label>
	                </div>
	             </div>
	             <div id="findId_result">
	                
	            </div>
	            <div class="row anchor mt-4">
	                <div class="col-12 d-flex justify-content-center">
	                    <a href="" id="findPw"  data-bs-toggle="modal" data-bs-target="#staticBackdrop2">비밀번호 찾기</a>
	                </div>
	            </div>
	        </div>
	       </div>
	        </form>  
      </div>
    </div>
  </div>

<!-- 비밀번호찾기-->

<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">비밀번호 찾기</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body findPw_body">   
            <div class="row nameBox m-2">
                <div class="col-3 d-flex justify-content-center">
                    <label for="name" class="form-label">이름</label>
                </div>
        <form id="findPwForm" action="/findPw.mem" method="post">
                <div class="col-9 d-flex justify-content-center">
                    <input type="text" class="form-control" placeholder="ex)홍길동" name="findPw_name" id="findPW_name">
                </div>
            </div>
            <div class="row phoneBox m-2 mt-4">
                <div class="col-3 d-flex justify-content-center">
                    <label for="id" class="form-label">아이디</label>
                </div>
                <div class="col-9 d-flex justify-content-center">
                    <input type="text" class="form-control" name="findPw_id" id="findPw_id">
                </div>
            </div> 
            <div class="row btns mt-4">
                <div class="col-12 d-flex justify-content-center">
                    <button type="button" class="btn btn-primary" id="btnFindPW">비밀번호 찾기</button>
                </div>
            </div>
        </form>
            <div class="row anchor mt-4">
                <div class="col-12 d-flex justify-content-center">
                    <a href="" id="findID" data-bs-toggle="modal" data-bs-target="#staticBackdrop1" >아이디 찾기</a>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
 
</body>
<%-- <script src="<%=request.getContextPath()%>script/popupLogin.js"></script> --%>
</html>