<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>multiboard</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	
});
</script>
<style type="text/css">
.container {
	text-align: center;
}

.boardlist {
	display: inline-block;
}
</style>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<h1>multiboard</h1>
			<c:forEach items="${boardlist }" var="row">
				<div class="boardlist">
					<button style="margin: 10px;" class="btn btn-secondary" onclick="location.href='${row.b_url }'">${row.b_catename }</button>
				</div>
			</c:forEach>
			<c:choose>
				<c:when test="${fn:length(list) gt 0 }">
					<table class="table table-dark table-hover table-striped">
						<thead>
							<tr class="row">
								<th class="col-1">번호</th>
								<th class="col-6">제목</th>
								<th class="col-2">글쓴이</th>
								<th class="col-2">날짜</th>
								<th class="col-1">조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list }" var="row">
							<tr class="row detail" onclick="location.href='./mbdetail?board=${param.board}&mbno=${row.mbno }'">
								<td class="col-1">${row.rowNum }</td>
								<td class="col-6 title">${row.mbtitle }<c:if test="${row.commentcount ne 0 }">&nbsp;<span class="badge bg-secondary">${row.commentcount }</span></c:if></td>
								<td class="col-2">${row.m_name }</td>
								<td class="col-2">${row.mbdate }</td>
								<td class="col-1">${row.mbread }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<h1 style="display: block;">게시판에 글이 없습니다.</h1>
				</c:otherwise>
			</c:choose>
			<c:if test="${sessionScope.m_id ne null }">
				<button type="button" class="btn btn-secondary" onclick="location.href='./mbwrite?board=${param.board}'">글쓰기</button>
			</c:if>
		</div>
	</header>
	
	<!-- 다 로딩된 후에 js 띄운다 -->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>