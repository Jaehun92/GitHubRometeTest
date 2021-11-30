<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/Directive/IncludePage.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>회원가입</title>
<!-- 부트스트랩 -->

<link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="../js/validate.js"></script>
<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- 두번째 테이블의 테이블 헤더행의 세로폭 설정 및 텍스트 수직으로 가운데 설정 -->
   <style>
    .container {
	width:1440px;
	margin:0 auto;
	}

	header {
	 display: grid;
 	 grid-auto-flow: column;
  	 grid-template-columns: 1fr;
	}
	header .topMenu {
	
	}
	.content{
	position: absolute; left: 50%; transform: translateX(-50%);

	}
	
   </style>
</head>
<body>
	<div class="container">
		<header style="background-color: #272822;">			
			<span class="glyphicon glyphicon-education" style="color: #6699FF;font-size:2em">KOSMO</span>			
			<nav class="topMenu" role="navigation">
				<%@ include file="/template/Top.jsp"%>
			</nav>
		</header>
		<div class="content">
			<div class="main">
				<h2>회원가입</h2>
				<form name="frmObj" method="POST" action="<c:url value="/Basic/post.kosmo"/>">
					<div class="form-group">						
						<label for="InputId">아이디</label>
						<input name="user" class="form-control" placeholder="아이디를 입력하세요."/> 
						<span style="color: red; font-size: 0.8em" id="idError"></span>
						
					</div>
					<div class="form-group">						
						<label for="InputPassword">비밀번호</label>
						<input name="password" class="form-control" type="password" placeholder="비밀번호를 입력하세요."/> 
					</div>
					<div class="form-group">						
						<label for="InputPassword2">비밀번호확인</label>
						<input name="password2" class="form-control" type="password" placeholder="비밀번호 확인을 입력하세요."/> 
					</div>											
					<div class="form-group">						
						<label>성별</label>	
						<div>					
							<label class="radio-inline">
							  <input type="radio" name="gender" id="inlineRadio1" value="man"> 남
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" id="inlineRadio2" value="woman"> 녀
							</label>
						</div>
					</div>
					<div class="form-group">
						<label>관심 사항</label>
						<div class="checkbox">
						  <label>
						    <input type="checkbox" name="inter" value="pol"/>정치
						  </label>
						  <label>
						    <input type="checkbox" name="inter" value="eco" />경제
						  </label>
						  <label>
							<input type="checkbox" name="inter" value="ent" />연예
					      </label>	
					     </div>
					</div>
					<div class="form-group">
						<label>학력 사항</label>
						<select name="grade" class="form-control">
						    <option value="">==학력을 선택하세요==</option>
							<option value="ele">초등학교</option>
							<option value="mid">중학교</option>
							<option value="hig">고등학교</option>
							<option value="uni">대학교</option>
						</select>
					</div>		
					<div class="form-group">
						<label>자기 소개</label>
						<div>					
						    <textarea cols="60" rows="5" name="self"></textarea>
					    </div>				    
					</div>
					<div style="background-color: white; text-align: center">
						<span><input type="submit" style="background-color:#272822; border-color: #6699FF; color:#FFFFFF;" value="회원등록" title="type=submit" /></span>
					</div>
				</form>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/template/Footer.jsp"%>
		</div>
	</div>
</body>
</html>