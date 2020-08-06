<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="../">DatePlanner</a>
        </div>
        <c:choose>
            <c:when test="${empty loginInfo}">
                <ul class="nav navbar-nav navbar-right">

                    <li><a href="../user/join"><span
                            class="glyphicon glyphicon-user"></span>회원가입</a></li>

                    <li><a href="../user/login"><span
                            class="glyphicon glyphicon-log-in"></span>로그인</a></li>

                </ul>
            </c:when>
            <c:otherwise>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/user/mypage"><span
                            class="glyphicon glyphicon-user"></span><strong>${loginInfo.nickname}</strong>로
                        로그인중</a></li>
                    <li><a href="../../user/logout">로그아웃</a></li>
                </ul>
            </c:otherwise>

        </c:choose>

    </div>
</nav>

