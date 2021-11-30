<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<ul class="nav nav-pills">
  <li role="presentation"><a href="<%=request.getContextPath() %>/Directive/Index.jsp">HOME</a></li>
  <% if(session.getAttribute("USER_ID") ==null){ %>
  <li role="presentation"><a href="<%=request.getContextPath() %>/session/Login.jsp">로그인</a></li>
  <%}else{ %>
  <li role="presentation"><a href="<%=request.getContextPath() %>/session/Logout.jsp">로그아웃</a></li>
  <% } %>
  <li role="presentation"><a href="<%=request.getContextPath() %>/Directive/Member.jsp">회원가입</a></li>
  <li role="presentation"><a href="<%=request.getContextPath() %>/MemberBbs/List.jsp">게시판</a></li>
</ul>