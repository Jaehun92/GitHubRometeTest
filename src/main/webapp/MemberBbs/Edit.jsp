<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/IsMember.jsp"%>
<%
	//1]파라미터(키값) 받기
	String no = request.getParameter("no");
	//검색과 관련된 파라미터 받기]	
	String searchColumn=request.getParameter("searchColumn");
	String searchWord=request.getParameter("searchWord");
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	//2]CRUD작업용 BbsDAO생성
	BbsDAO dao = new BbsDAO(application);
	BbsDTO dto = dao.selectOne(no,"");	
	dao.close();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>Edit.jsp</title>
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
			<div class="main" style="width : 1000px; margin-top: 50px;">
				<fieldset style="width: 85%; padding: 10px 20px">
					<legend>글 수정 페이지</legend>
					<form action="EditOk.jsp" method="post">
						<input type="hidden" name="no" value="<%=no%>"/>
						<input type="hidden" name="nowPage" value="<%=nowPage%>"/>
						<input type="hidden" name="searchColumn" value="<%=searchColumn%>"/>
						<input type="hidden" name="searchWord" value="<%=searchWord%>"/>
						<table width="75%" bgcolor="gray" cellspacing="1">
							<tr bgcolor="white">
								<td width="30%" align="center">제목</td>
								<td style="padding: 5px"><input value="<%=dto.getTitle() %>" type="text" name="title" style="width: 98%" /></td>
							</tr>
							<tr bgcolor="white">
								<td align="center">내용</td>
								<td style="padding: 5px"><textarea rows="10"
										style="width: 98%" name="content"><%=dto.getContent() %></textarea></td>

							</tr>
							<tr bgcolor="white" align="center">
								<td colspan="2"><input type="submit" value="수정" /></td>
							</tr>
						</table>
					</form>
				</fieldset>
			</div>
		</div>
		<div class="footer">
			<jsp:include page="/template/Footer.jsp" />
		</div>
	</div>
</body>
</html>