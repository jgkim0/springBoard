<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.nav {
	padding: 10px;
	display: inline-block;
	
}
.navbtn{
	text-decoration: none;
      font-size: 13px;
      color: white;
      margin: 1px;
      display:inline-block;
      border-radius: 10px;
      transition:all 0.1s;
      text-shadow: 0px -0px rgba(0, 0, 0, 0.44);
      font-family: 'Pretendard-Black', normal; 
     
}
.navbtn:active{
      transform: translateY(3px);
    }
.blue{
	  background-color: #3498db;
      }
.navbtn:hover
{
	background-color: #2980b9;
	}
.white{
	color: white;
	font-size: 1.2em;	
}
.white:hover{
	color: white;
}
}    
 
</style>
<ul>
	<br>
	<li class="nav navbtn blue"><a class="white" href="/board/listPageSearch?num=1">글 목록(페이징 + 검색)</a></li>
	
	<li class="nav navbtn blue"><a class="white" href="/board/listPage?num=1">글 목록(페이징)</a></li>
	
	<li class="nav navbtn blue"><a class="white" href="/board/list">글 목록</a></li>
	
	<li class="nav navbtn blue"><a class="white" href="/board/write">글 작성</a></li>
	
</ul>