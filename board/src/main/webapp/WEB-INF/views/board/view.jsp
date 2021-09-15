<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<style>
@font-face {
    font-family: 'Pretendard-Thin';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Thin.woff') format('woff');
    font-weight: 100;
    font-style: normal;
}

.btn{
text-decoration: none;
      font-size: 13px;
      color: white;
      padding: 6px 6px;
      margin: 1px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -2px rgba(0, 0, 0, 0.44);
      font-family: 'Pretendard-Black', normal; 
      
}
.btn:active{
      transform: translateY(3px);
    }
.blue{
	  background-color: #1f75d9;
      border-bottom:5px solid #165195;
}
.red{
	background-color: #FF5631;
	border-bottom:5px solid #B9462C;
}

</style>
</head>
<body>

	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>


	<!-- 
		<label>제목</label>
		${view.title}<br />
		<label>작성자</label>
		${view.writer}<br />
		<label>내용</label><br />
		${view.content}<br />
 -->

	<h2>${view.title}</h2>

	<hr />
	<div class="writer">
		<span>작성자 : </span>${view.writer}
	</div>

	<hr />

	<div class="content">${view.content}</div>

	<hr />

	<div>
		<a href="/board/modify?bno=${view.bno}" class="btn blue">게시물 수정</a> 
		<a href="/board/delete?bno=${view.bno}" class="btn red">게시물 삭제</a>
	</div>

	<!-- 댓글 시작 -->

	<hr />

	<ul>
		<!-- <li>
		<div>
			<p>첫번째 댓글 작성자</p>
			<p>첫번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>두번째 댓글 작성자</p>
			<p>두번째 댓글</p>
		</div>
	</li>
	<li>
		<div>
			<p>세번째 댓글 작성자</p>
			<p>세번째 댓글</p>
		</div>
	</li> -->

		<c:forEach items="${reply}" var="reply">
			<li>
				<div>
					<p>${reply.writer}
						/
						<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd hh:mm" />
						<a href="/reply/update?rno=${reply.rno}&bno=${reply.bno}"> 수정 </a> 
						<a href="/reply/delete?rno=${reply.rno}&bno=${reply.bno}"> 삭제 </a> 
						
						<!-- 
						<form method="post" action="/reply/delete">
						<input type="hidden" name="rno" value="${reply.rno}">
						<input type="hidden" name="bno" value="${reply.bno}">
						<button type="submit">삭제</button>
						
						</form>
						 -->
					</p>
					
					<p>${reply.content}</p>
				</div>
			</li>
		</c:forEach>
	</ul>

	<div>

		<form method="post" action="/reply/write">

			<p>
				<label>댓글 작성자</label> <input type="text" name="writer">
			</p>
			<p>
				<textarea rows="5" cols="50" name="content"></textarea>
			</p>
			<p>
				<input type="hidden" name="bno" value="${view.bno}">
				<button type="submit">댓글 작성</button>
			</p>
		</form>

	</div>

	<!-- 댓글 끝 -->

</body>
</html>