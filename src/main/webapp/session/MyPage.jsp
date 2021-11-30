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
<title>마이 페이지</title>
<!-- 부트스트랩 -->

<link href="<c:url value="/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">

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
<!--클라이언트단에서 유효성 체크 -->
<script src="../js/validate.js"></script>
<link href="<%=request.getContextPath()%>/css/layout.css" rel="stylesheet" />
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
				<div class="main" style="margin-top: 150px">
					<h2>마이 페이지</h2>
					<fieldset style="padding: 10px">
						<legend>마이 페이지</legend>
						<form method="post">
							<div class="form-group">
								<label for="InputId">아이디</label>
								<label><%=session.getAttribute("USER_ID")%></label>
							</div>
						
						<div style="background-color: white; text-align: center">
							<span colspan="2"><a href="Logout.jsp" type="button" style="background-color:#272822; border-color: #6699FF; color:#FFFFFF;" value="로그아웃" />로그아웃</a></span>
						</div>							
						</form>
					</fieldset>
				</div>
			</div>
			<div class="footer">
				<jsp:include page="/template/Footer.jsp"/>
		</div>
	</div>
	
</body>
</html>