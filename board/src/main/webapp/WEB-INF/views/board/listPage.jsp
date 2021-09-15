<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>

	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>
	<table>
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
<nav>
<ul class="pagination" style="justify-content: center;">

	<c:if test="${page.prev}">
	<li>
		<span> <a href="/board/listPage?num=${page.startPageNum - 1}" aria-label="Previous" class="page-link"><span aria-hidden="true">이전</span>	</a>
			</span>
		<li>
	</c:if>


	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span> <c:if test="${select != num}">
				<li class="page-item " ><a href="/board/listPage?num=${num}" class="page-link">${num}</a></li>
			</c:if> <c:if test="${select == num}">
				<li class="page-item active"><a href="#" class="page-link"><b>${num}</b></a></li>
			</c:if>
		</span>
	</c:forEach>

	<c:if test="${page.next}">
	<li class="page-item">
		<span> <a href="/board/listPage?num=${page.endPageNum + 1}" aria-label="Next" class="page-link"><span aria-hidden="true">다음</span></a>
			
		</span>
		</li>
	</c:if>
	</ul>
</nav>

<nav>
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a href="#" class="page-link">1</a></li>
    <li class="page-item"><a href="#" class="page-link">2</a></li>
    <li class="page-item"><a href="#" class="page-link">3</a></li>
    <li class="page-item"><a href="#" class="page-link">4</a></li>
    <li class="page-item"><a href="#" class="page-link">5</a></li>
    <li class="page-item">
      <a href="#" aria-label="Next"  class="page-link">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

</body>
</html>