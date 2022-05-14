<%@page import="com.review.model.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.review.model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ReviewDAO dao = ReviewDAO.getInstance();

List<ReviewDTO> list = dao.getReviewList(1, 15);

request.setAttribute("List", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NyamNyam</title>
<link rel="icon" href="favicon.ico">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/main.css">

</head>
<body>


	<jsp:include page="../../navi/main_navi.jsp" />
	<jsp:include page="../../ogj/newtest.jsp" /> 
	
	


	<section class="rightCon post-slider">
		<div class="main_title">
			<div class="mainSearch">
				<form method="post"
					action="<%=request.getContextPath()%>/review_search.do">
					<select class="mainSelect" name="search_field">
						<option value="title_content" select>내용</option>
						<option value="adress">위치</option>
						<option value="rate">별점</option>
					</select> <input class="mainInput" name="search_keyword"
						placeholder="맛집을 검색해보세요!"> <input type="submit" value="검색"
						class="btn btn-primary">
				</form>
			</div>
		</div>
		<br> <br> <br>
		
		

								 <i class="fas fa-chevron-left prev">ddd</i>
        <i class="fas fa-chevron-right next">ddd</i>
		<div class="mainReviewCon slide_div post-wrapper">
			<c:set var="list" value="${List}" />
			<c:if test="${empty list}">
				<span>리뷰 목록이 없습니다.</span>
				<br>
			</c:if>
			

			
			


			<c:if test="${!empty list}">
			

				<c:forEach items="${list }" var="dto">
				
				
					<c:set var="count" value="${count+1 }" />
					<div class="post">
						<a
							href="<%=request.getContextPath()%>/owner_content.do?no=${dto.getReview_ceo_num()}">
							<img
							src="<%=request.getContextPath()%>/image/userimage/${dto.getReview_image()}"
							class="slider-image" width="300" height="300">
						</a>
					</div>
					
					<c:if test="${count%7==0 }">
		</div>
		</c:if>

						</c:forEach>
					



				<%-- <table class="main_table">
					<tr>
						<c:forEach items="${list }" var="dto">
							<c:set var="count" value="${count+1 }" />
							<td><a
								href="<%=request.getContextPath()%>/owner_content.do?no=${dto.getReview_ceo_num()}">
									<img
									src="<%=request.getContextPath()%>/image/userimage/${dto.getReview_image()}"
									width="150" height="150">
							</a></td>
							<c:if test="${count%7==0 }">
					</tr>

					<tr>
						</c:if>

						</c:forEach>
					</tr>
				</table> --%>
				<!-- 'review_write.do?page=${page}'"> -->
			</c:if>
		</div>
	</section>
	</div>
	</div>
</body>
</html>