<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>로그인</title>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>
</head>
<body>
    <!-- 카카오 로그인 버튼 (a 태그만 사용) -->
    <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=키&redirect_uri=http://localhost:8080/login&response_type=code">
        <img src="<c:url value='/static/kakao_login_medium_narrow.png' />" alt="카카오 로그인" style="height:60px">
        <!-- 또는 텍스트: "카카오로 로그인" -->
    </a>
</body>
</html>
ㄴ