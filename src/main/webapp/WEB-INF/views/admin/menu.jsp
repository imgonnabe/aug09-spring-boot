<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="menu">
	<div style="height: 50px;"></div>
		<div class="menu-item" onclick="url('multiboard')"><i class="xi-forum xi-2x xi-fw"></i>게시판 관리</div>
		<div class="menu-item" onclick="url('post?cate=0')"><i class="xi-library-books xi-2x xi-fw"></i>게시물 관리</div>
		<div class="menu-item" onclick="url('member')"><i class="xi-user xi-2x xi-fw"></i>회원 관리</div>
		<div class="menu-item" onclick="url('air')"><i class="xi-comment xi-2x xi-fw"></i>공기질 관리</div>
		<div class="menu-item" onclick="url('mail')"><i class="xi-mail xi-2x xi-fw"></i>메일 보내기</div>
		<div class="menu-item" onclick="url('corona')"><i class="xi-message xi-2x xi-fw"></i>코로나</div>
		<div class="menu-item" onclick="url('notice')"><i class="xi-bell xi-2x xi-fw"></i>공지사항</div>
		<div class="menu-item" onclick="url('logout')"><i class="xi-log-out xi-2x xi-fw"></i>로그아웃</div>
</div>
<script type="text/javascript">
	function url(url){
		location.href="./" + url;
	}
</script>