<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
p{font-size: 15px;
	line-height: 1;
}
</style>


<link rel="icon" href="favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <script type="text/javascript" src="/js/bootstrap.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS --> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> <!-- 부가적인 테마 --> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> <!-- 제이쿼리 --> <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- 합쳐지고 최소화된 최신 자바스크립트 --> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">

function check(num){
	let res = confirm("댓글을 삭제하시겠습니까?");
	
	if(res){
		location.href="admin_reply_delete.do?num="+num;
	}
}

</script>

</head>
<body>

	<jsp:include page="../../navi/main_navi.jsp"/>

	<div class="main_title">

	</div>

	<div class="panel panel-primary">
	<div class="panel-heading">댓글목록</div>
			
		<table class="table">
			<tr class="user-info-header">
				<th>가게번호</th>
				<th>리뷰번호</th>
				<th>댓글번호</th>
				<th>댓글내용</th>
				<th>댓글작성자</th>
				<th>작성일</th>
				<th>신고</th>
				<th>삭제</th>
				
			</tr>
			
			<c:set var="list" value="${replylist }" />
			<c:if test="${!empty replylist }">
				<c:forEach items="${replylist }" var="dto">
					<tr class="user-info-items">
				
						<td class="cont">${dto.getReply_ceo_num() }</td>
						<td class="cont">${dto.getReply_review_num() }</td>
						<td class="cont">${dto.getReply_num() }</td>
						<td class="cont">${dto.getReply_cont() }</td>
						<td class="cont">${dto.getReply_id() }</td>
						<td class="cont">${dto.getReply_date() }</td>
						<td class="cont">${dto.getReply_bad() }</td>
						<td class="cont">
							<input type="button" value="삭제"
								onclick="check(${dto.getReply_num() })">
						</td>
					
					</tr>
					
				</c:forEach>
			</c:if>
			<c:if test="${empty replylist }">
				<tr class="user-info-items">
					<td colspan="8" class="cont">
						<h3 align="center">작성된 댓글이 없습니다</h3>
					</td>
				</tr>
			</c:if>
		</table>
	</div>	
	
	
	<%--페이징 --%>
	<nav class="tac">
  <ul class="pagination">
    <li>
     <c:if test="${page == 1 }">
     	<a href="admin_reply_Management.do?page=${startBlock }" aria-label="Previous">
     </c:if>
     
     <c:if test="${page != 1 }">
      	<a href="admin_reply_Management.do?page=${page -1 }" aria-label="Previous">
     </c:if>
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
 
     <li>

    	<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
			<c:if test="${i == page }">
				<a href="admin_reply_Management.do?page=${i }">${i }</a>
			</c:if>
			
			<c:if test="${i != page }">
				<a href="admin_reply_Management.do?page=${i }">${i }</a>
			</c:if>
			
		</c:forEach>
	</li>
 

  <li>
     <c:if test="${endBlock == allPage }">
     	<a href="admin_reply_Management.do?page=${endBlock }" aria-label="Next">
     </c:if>
     
     <c:if test="${endBlock != allPage }">
      	<a href="admin_reply_Management.do?page=${page + 1 }" aria-label="Next">
     </c:if>
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
   
  </ul>
  
</nav>

	<%--페이징 --%>
			
		<form method="post" action="<%=request.getContextPath() %>/admin_reply_search.do"  class="tac">
			<select class="sel" name="search_field">
				<option value="id">아이디</option>
				<option value="cont">내용</option>

			</select>

			<input class="searchInput" name="search_keyword">
			<input class="btn btn-primary" type="submit" value="검색">		
		</form>

			
 		<jsp:include page="../../navi/footer.jsp"/>
		 </div>
		</div>
	</div>

</body>
</html>