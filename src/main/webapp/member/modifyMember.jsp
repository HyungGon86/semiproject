<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Favicon-->
      <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
      <!-- Bootstrap icons-->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"
        type="text/css" />
      <!-- Google fonts-->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
        rel="stylesheet" type="text/css" />
      <!-- Core theme CSS (includes Bootstrap)-->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
      <!-- fontAwessome-->
      <script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
      <script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <link rel="stylesheet" href="<%=request.getContextPath()%>/member/css/modifyMember.css">
      <title>회원정보수정</title>

    </head>
    <style>
      @charset "UTF-8";

      i {
        margin: 5px;
      }

      .navbar-light {
        width: 100%;
        position: fixed;
        top: 0;
        z-index: 1;
        left: 0%;
      }

      body {
        padding-top: 100px;
      }

      /*네비바 속성*/
      .navbar-anchor a {
        text-decoration: none;
        color: black;
        font-weight: bold;
      }

      #userIcon {
        text-align: right;
        font-size: 25px;
        padding: 5px;
      }

      #navbar-search {
        text-align: right;
      }

      #searchIcon {
        color: lightgrey;
      }

      /* 네비바 드롭다운 */
      .dropdown-toggle:hover {
        color: #83bf7b;
        border-color: aliceblue;
      }

      .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0;
        font-weight: bold;
      }

      /* 회원가입 테이블 */
      table {
        margin-top: 5rem;
      }

      tr {
        border-top: 1px solid #00000050;
        border-bottom: 1px solid #00000050;
        text-align: left;
      }

      .star {
        color: red;
      }

      #id,
      #pw,
      #memberChkpw,
      #user_date,
      #user_name {
        font-size: 0.8rem;
        width: 200px;
      }

      .phoneWrap {
        margin-right: 20px;
      }

      .phone {
        width: 100px;
        height: 30px;
        border: 1px solid lightgray;
      }

      .email {
        width: 150px;
        font-size: 0.8rem;
      }

      .form-control,
      .btn-primary {
        font-size: 0.8rem;
      }
      .button{
        width: 150px;
      }



      /*풋터 영역*/
      .footerBox {
        height: 200px;

      }

      footer.footer {
        padding-top: 4rem;
        padding-bottom: 4rem;
      }

      .footer a {
        text-decoration: none;
        color: black;
        font-weight: 40px;
        font-weight: bold;
      }
    </style>

    <body>
      <div class="container MainBox" id="header">
        <!-- 네비바 -->
        <nav class="navbar navbar-light bg-light fixed">
          <div class="container navbar-head">
            <a class="navbar-brand" href="#!" id="logo">로고</a>
            <div class="col-md-1 navbar-anchor"><a href="/">COMPANY</a></div>

            <div class="dropdown ">
              <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"
                style="font-weight: bold;">
                CLOTHES
              </button>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                <li><a class="dropdown-item" href="#">Top</a></li>
                <li><a class="dropdown-item" href="#">Bottom</a></li>
                <li><a class="dropdown-item" href="#">Accessory</a></li>
              </ul>
            </div>

            <div class="col-md-1 navbar-anchor"><a href="/">매장찾기</a></div>
            <div class="col-md-1 navbar-anchor"><a href="/">고객센터</a></div>
            <!-- 네비바 검색창 -->
            <div class="col-md-4 navbar-anchor" id="navbar-search">
              <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                  <button class="btn btn-link" style="border: 1px solid lightgrey;" id="btnSearch" type="button"><i
                      id="searchIcon" class="fas fa-search"></i></button>
                  <input class="form-control" type="text" aria-describedby="btnNavbarSearch" />
                </div>
              </form>
              </button>
            </div>
            <div class="col-md-2 navbar-anchor" id="userIcon">
              <a href=""><i class="fa-solid fa-cart-plus"></i></a>
              <a href=""><i class="fa-solid fa-user"></i></a>
            </div>
          </div>
        </nav>
      </div>

      <div class="container">

        <form action="/toModifyMemProc.mem" id="signupForm" method="post">
          <table class="join_table">
            <colgroup>
              <col width="20%">
              <col width="40%">
            </colgroup>
            <tbody>
              <tr>
              <tr style="height: 70px;">
                <th>
                  <label for="user_name">이름</label>
                  <span class="star">*</span>
                </th>
                <td colspan="2">
                  <input type="text" id="user_name" value="${dto.user_name}" disabled>
                </td>
              </tr>
              </tr>
              <tr style="height: 70px;">
                <th>
                  <label for="user_id">아이디</label>
                  <span class="star">*</span>
                </th>
                <td colspan="2">
                  <input type="text" id="id" name="id" value="${dto.user_id}" disabled>
                </td>
              </tr>
              <tr style="height: 70px;">
                <th>
                  <label for="user_password">비밀번호</label>
                  <span class="star">*</span>
                </th>
                <td>
                  <input type="password" id="pw" name="pw">
                </td>
                
              </tr>
              <tr style="height: 70px;">
                <th>
                  <label for="memberChkpw">비밀번호 확인</label>
                  <span class="star">*</span>
                </th>
                <td>
                  <input type="password" id="memberChkpw" name="memberChkpw">
                </td>
              </tr>
              <tr style="height: 70px;">
                <th>
                  <label for="phone1">휴대폰</label>
                  <span class="star">*</span>
                </th>
                <td colspan="2">
                  <div class="row">
                    <div class="col-2 phoneWrap">
                      <input type="text" class="form-control phone" id="phone1" value="${phone1}">
                    </div>
                    <div class="col-2 phoneWrap">
                      <input type="text" class="form-control phone" id="phone2" value="${phone2}">
                    </div>
                    <div class="col-2 phoneWrap">
                      <input type="text" class="form-control phone" id="phone3" value="${phone3}">
                    </div>
                  </div>
                </td>
              </tr>
              <div class="col d-none">
                <input type="text" id="user_phone" name="user_phone">
              </div>
              <tr style="height: 70px;">
                <th>
                  <label for="user_date">생년월일</label>
                  <span class="star">*</span>

                </th>
                <td>
                  <input type="text" id="user_date" value="${dto.user_date}" disabled>
                </td>
              </tr>
              <tr style="height: 70px;">
                <th rowspan="2">
                  <label for="emailAdress">이메일</label>
                </th>
                <td colspan="2">
                  <div class="row">
                    <div class="col">
                      <input type="text" id="emailAdress" value="${email1}" style="width: 150px; font-size: 0.8rem;"> @
                      <input type="text" id="emailAdress2" value="${email2}" style="width: 100px; font-size: 0.8rem;">
                </td>
              </tr>
              <div class="col d-none">
                <input type="text" id="user_email" name="user_email">
              </div>

              <tr>
                <td>
                  <ul class="desc mt-2" style="font-size: 0.7rem; opacity: 0.6;">
                    <li>
                      「정보통신망 이용 촉진 및 정보 보호 등에 관한 법률 (이하 정보통신망법)」
                      제 23조의2의 "주민등록번호의 사용 제한"에 따라 하이프랜드 온라인 스토어는 주민등록번호를 수집 및 이용하지 않습니다.
                    </li>
                  </ul>
                </td>
              </tr>
              <tr>
                <th>
                  <label for="adress">주소</label>
                </th>
                <td colspan="2">
                  <div class="row p-2">
                    <div class="col">
                      <input type="text" class="form-control" id="postCode" name="user_postCode" placeholder="우편번호"
                        value="${dto.user_postCode}">
                    </div>
                    <div class="col">
                      <button type="button" class="btn btn-primary w-100" id="btnPostCode">우편번호 찾기</button>
                    </div>
                  </div>
                  <div class="row p-2">
                    <div class="col">
                      <input type="text" class="form-control" id="roadAddr" name="user_roadAddr" placeholder="도로명주소"
                        value="${dto.user_roadAddr}">
                    </div>
                  </div>
                  <div class="row p-2">
                    <div class="col mb-2">
                      <input type="text" class="form-control" id="detailAddr" name="user_detailAddr" placeholder="상세주소"
                        value="${dto.user_detailAddr}">
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>

          <div class="row mt-5 mb-5">
            <div class="col" style="text-align: center;">
              <p><strong>이용약관과 개인정보 수집 및 이용을 동의하십니까?</strong></p>
              <button type="button" id="submitBtn" class="btn btn-danger button">수정</button>
              <button type="button" id="btnBack" class="btn btn-dark button">뒤로가기</button>
            </div>
          </div>
      </div>
      </form>

      <!-- Footer-->
      <footer class="footer bg-light">
        <div class="container">
          <div class="row">
            <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
              <ul class="list-inline mb-2">
                <li class="list-inline-item"><a href="#!">COMPANY</a></li>
                <li class="list-inline-item">⋅</li>
                <li class="list-inline-item"><a href="#!">매장찾기</a></li>
                <li class="list-inline-item">⋅</li>
                <li class="list-inline-item"><a href="#!">고객센터</a></li>
                <li class="list-inline-item">⋅</li>
                <li class="list-inline-item"><a href="#!" style="color: red; font-weight: bold;">개인정보처리방침</a></li>

              </ul>
              <p class="text-muted small mb-4 mb-lg-0">하잇프랜드(주) 대표 : 이호준 | 개인정보관리책임자 : 김영완 | 사업자등록번호 : 22-02-22</p>
              <p class="text-muted small mb-4 mb-lg-0">주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩</p>
              <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2022. All Rights Reserved.</p>
            </div>
            <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
              <ul class="list-inline mb-0">
                <li class="list-inline-item me-4">
                  <a href="#!"><i class="bi-facebook fs-3"></i></a>
                </li>
                <li class="list-inline-item me-4">
                  <a href="#!"><i class="bi-twitter fs-3"></i></a>
                </li>
                <li class="list-inline-item">
                  <a href="#!"><i class="bi-instagram fs-3"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>

    </body>

    <script>
      // 다음 우편번호 api 띄우기
      $('#btnPostCode').on('click', function () {
        new daum.Postcode({
          oncomplete: function (data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
              extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다
            if (data.buildingName !== '' && data.apartment === 'Y') {
              extraRoadAddr +=
                extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName;
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
              extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('#postCode').val(data.zonecode);
            $('#roadAddr').val(roadAddr);

            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if (roadAddr !== '') {
              $('#extraAddr').val(extraRoadAddr);
            } else {
              $('#extraAddr').val('');
            }
          }
        }).open();
      });

      $('#emailAdress2').focusout(function () {
        let email = '';
        if ($('#emailAdress').val() !== '') {
          email = $('#emailAdress').val() + '@' + $('#emailAdress2').val();
          $('#user_email').val(email);
        }
      });

      $('#submitBtn').on('click', function () {
        let regexPhone = /^[0-9]{11}$/;
        //phone번호 합쳐주는 작업 select 박스에서 선택된 값을 가져오는방법
        let phone = $('#phone1').val() + $('#phone2').val() + $('#phone3').val();

        $('#user_phone').val(phone);

        if ($('#pw').val() === '') {
          alert('비밀번호를 입력해주세요.');
          return;
        } else if ($('#emailAdress').val() === '') {
          alert('이메일을 입력해주세요.');
          return;
        } else if ($('#emailAdress2').val() === '') {
          alert('도메인을 입력해주세요.');
          return;
        } else if ($('#memberChkpw').val() !== $('#pw').val()) {
          alert('비밀번호와 비밀번호 확인창이 일치하지 않습니다.');
          return;
        } else if (!regexPhone.test(phone)) {
          // 숫자 데이터에 대한 별도의 형변환 x
          alert('형식에 맞지 않는 전화번호입니다.');
          return;
        } else if ($('#postCode').val() === '' || $('#roadAddr').val() === '') {
          alert('주소를 입력해 주세요.');
          return;
        }

        let email = $('#emailAdress').val() + '@' + $('#emailAdress2').val();;
        $('#user_email').val(email);

        let data = $('#signupForm').serialize();

        $.ajax({
          url: '/toLoginProc.mem',
          type: 'post',
          data: data,
          success: function (resultData) {
            console.log('받아온 id', resultData);
            if (resultData === 'loginSuccess') {
              //form 제출
              document.getElementById('signupForm').submit();
            }
          },
          error: function (e) {
            console.log(e);
          }
        });
      });

      $('#btnBack').on("click", function() {
        location.href = "/toMypage.mem";
      })

    </script>

    </html>