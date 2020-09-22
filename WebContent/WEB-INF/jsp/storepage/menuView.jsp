<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../mainpage/header.jsp" flush="false" />

   		<c:forEach var="menu" items="${menuList}" varStatus="status">
   			<c:out value="${menu.no}"/>
   			<c:out value="${menu.name}"/>
   			<c:out value="${menu.engName}"/>
   			<c:out value="${menu.price}"/>
   			<c:out value="${menu.description}"/>
			 <img src= ${imgRoot}<c:out value="${menu.img}"/>>
		</c:forEach>

</body>
</html>