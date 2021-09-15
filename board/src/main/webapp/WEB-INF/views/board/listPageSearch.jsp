<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<style>
	.div1{
	width:70%;
	margin: auto;
	}
	.divA {
	width: 15%;
	float:left;
	}
	.divB {
	width: 60%;
	float:left;
	}
	.divC {
	width: 10%;
	float:left;
	}
	.table-responsive
	{
	width: 95%;
	margin:auto;
	}

	</style>
</head>
<body>

	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>
	<br>
	<br>	
	<div class="table-responsive">
	<table class ="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno}</td>
					<td><a href="/board/view?bno=${list.bno}">${list.title}</a></td>
					<td><fmt:formatDate value="${list.regDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${list.writer}</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</div>

<nav class="text-center">
	<ul class="pagination" style="justify-content: center;">
	<c:if test="${page.prev}">
			<li class="page-item">
			<a href="/board/listPageSearch?num=${page.startPageNum - 1}" class="page-link">이전</a></li>	
		</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<li class="page-item"><c:if test="${select != num}">
					<a href="/board/listPageSearch?num=${num}" class="page-link">${num}</a>
				</c:if></li> <c:if test="${select == num}">
					<li class="page-item active"><a href="#" class="page-link"><b>${num}</b></a></li>
				</c:if>
			
		</c:forEach>

		<c:if test="${page.next}">
			 <li class="page-item"><a href="/board/listPageSearch?num=${page.endPageNum + 1}" class="page-link">다음</a>
			</li>
		</c:if>
		</ul>
</nav>
	<div class="div1">	
	<div class="divA">
		<select name="searchType" class="form-control">
			<option value="title"
				<c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value="content"
				<c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
			<option value="title_content"
				<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
			<option value="writer"
				<c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
		</select></div><div class="input-group divB"> <input type="text" name="keyword" value="${page.keyword}" class="form-control"/></div>
		<div class="divC"><button type="button" id="searchBtn" class="btn btn-default">검색</button></div>
	
	</div>

	<script>
		document.getElementById("searchBtn").onclick = function() {

			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;

			location.href = "/board/listPageSearch?num=1" + "&searchType="
					+ searchType + "&keyword=" + keyword;

			console.log(searchType)
			console.log(keyword)
		};
	</script>
	
	
</body>
</html>