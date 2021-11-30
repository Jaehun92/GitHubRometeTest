<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="model.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/IsMember.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	//검색을 위한 한글처리]
	request.setCharacterEncoding("UTF-8");
	
	//시작 및 끝 행번호 와 검색 관련 데이타 저장용
	Map map = new HashMap();
	
	//검색과 관련된 파라미터 받기]
	String searchColumn=request.getParameter("searchColumn");
	String searchWord=request.getParameter("searchWord");
	String queryString="";//검색용 쿼리 스트링
	if(searchColumn !=null){
		map.put("searchColumn",searchColumn);
		map.put("searchWord",searchWord);
		//검색시 생성된 페이징번호 클릭시 처리하기 위한 추가 쿼리스트링
		queryString=String.format("searchColumn=%s&searchWord=%s&",searchColumn,searchWord);
	}/////////////
	//전체 글 목록 가져오기
	BbsDAO dao = new BbsDAO(application);
	//페이징을 위한 로직 시작]
	//전체 레코드수	
	int totalRecordCount = dao.getTotalRowCount(map);
	//페이지 사이즈
	int pageSize =Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	//블락페이지
	int blockPage=Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
	//전체 페이지수
	int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
	//현재 페이지 번호
	int nowPage = request.getParameter("nowPage")==null ? 1 : Integer.parseInt(request.getParameter("nowPage"));
	//시작 및 끝 ROWNUM구하기
	int start= (nowPage-1)*pageSize+1;
	int end = nowPage*pageSize;
	//페이징을 위한 로직 끝]
	map.put("start",start);
	map.put("end",end);
	List<BbsDTO> list=dao.selectList(map);
	dao.close();


%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>List.jsp</title>
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
				<fieldset style="width:85%;padding:10px 20px">
					<legend>회원제 게시판 목록(<%=nowPage%>/<%=totalPage %>)</legend>
					<!-- 글쓰기 버튼 -->
					<table style="width:100%">
						<tr>
							<td style="text-align: right"><a href="Write.jsp">글작성</a></td>
						</tr>
					</table>
					<table style="border-spacing: 1px; background-color: gray;width:100%">
						<tr style="background-color: white" style="text-align: center" align="center">
							<th width="10%"> 번호</th>
							<th width="45%"> 제목</th>
							<th width="15%"> 작성자</th>
							<th width="15%"> 조회수</th>
							<th width="30%"> 작성일</th>
						</tr>

						<%if(list.isEmpty()){ %>
						<tr style="background-color: white" align="center">
							<td colspan="5">등록된 글이 없어요</td>
						</tr>
						<!-- 아래 반복 -->
						<%}else{
							int countNum=0;
							for(BbsDTO dto:list){
						%>						
						<tr style="background-color: white" align="center">
							<td><%=totalRecordCount - (((nowPage - 1) * pageSize) + countNum) %></td>
							<td style="text-align: left"><a href="View.jsp?no=<%=dto.getNo() %>&nowPage=<%=nowPage%>&<%=queryString%>"><%=dto.getTitle() %></a></td>
							<td><%=dto.toString() %></td>
							<td><%=dto.getVisitCount() %></td>
							<td><%=dto.getPostDate() %></td>
						</tr>
						<%
								countNum++;
							}//for
						}//else%>

					</table>
					<!-- 페이징 -->
					<table width="100%">
						<tr align="center">
							<td><%=PagingUtil.pagingText(totalRecordCount, pageSize, blockPage, nowPage, "List.jsp?"+queryString) %></td>
						</tr>
					</table>
					<!-- 검색UI -->
					<form method="post">
						<table width="100%">
							<tr align="center">
								<td><select name="searchColumn">
										<option value="title">제목</option>
										<option value="name">작성자</option>
										<option value="content">내용</option>
									</select> 
									<input type="text" name="searchWord" /> 
									<input type="submit" value="검색" />
								</td>
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