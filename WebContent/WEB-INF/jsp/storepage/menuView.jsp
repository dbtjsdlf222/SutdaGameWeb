<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴판</title>
</head>
<body>
<jsp:include page="../mainpage/header.jsp" flush="false" />
   		<c:forEach var="menu" items="${menuList}" varStatus="status">
   			번호: <c:out value="${menu.no}"/> <br/>
   			이름: <c:out value="${menu.name}"/><br/>
   			영문명: <c:out value="${menu.engName}"/><br/>
   			가격: <c:out value="${menu.price}"/><br/>
   			설명: <c:out value="${menu.description}"/><br/>
			 <img src="/upload_img/menu/<c:out value="${menu.img}"/>" width="300px" height="300px"><br/><br/>
		</c:forEach>
</body>
</html>