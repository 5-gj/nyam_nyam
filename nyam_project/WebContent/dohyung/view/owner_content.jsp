<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style type="text/css">
.start_btn {
	display: flex;
	flex-direcion: row;
}

#char {
	padding-left: 5px;
}

ul li {
	list-style: none;
}

.shop_insert {
	width: 100%;
	height: 100%;
}

.shop_insert h1 {
	padding-bottom: 2vh;
}

.shop_cont1 {
	width: 60vw;
	height: 30vh;
	display: flex;
}

.imgCon {
	width: 30vw;
	height: 30vh;
	background-color: skyblue;
}

.cont1_info {
	width: 40vw;
	margin-left: 3vw;
	margin-top: 2vh;
}

.cont1_info textarea {
	width: 25vw;
	height: 20vh;
}

.shop_cont2 {
	width: 60vw;
	height: 45vh;
	margin-top: 3vh;
}

.cont2_info {
	width: 26vw;
	height: 30vh;
	margin-top: 1vh;
	float: left;
}

.cont2_info table {
	margin-bottom: 20vh;
	margin-left: 1vw;
}

.cont2_info table th {
	text-align: right;
	padding-right: 1vw;
}

.cont2_info table input {
	width: 15vw;
	height: 3vh;
}

.submitBtn:hover {
	cursor: pointer;
	background-color: #e0e0e0;
}

.loca {
	width: 25vw;
	height: 35vh;
	background-color: skyblue;
	margin-left: 28vw;
}

.map {
	width: 25vw;
	height: 35vh;
}

.loca p {
	margin-top: 1vh;
}

.container {
	background-color: pink;
	width: 80vw;
	height: 100vh;
}

.comment {
	margin-top: 10vh;
}

.review li {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	padding: 20px 0 50px;
}

.review .cont img {
	margin-right: 30px;
}

.review .cont {
	display: table;
	width: 100%;
	table-layout: fixed;
	margin-top: 11px;
	display: flex;
	justify-content: center;
	margin-bottom: 11px;
}

.star span {
	margin-right: 30px;
}

.openReview {
	float: right;
}

.cont em {
	height: 27px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: block;
	font-size: 16px;
	font-weight: 700;
	line-height: 22px;
	width: 588px;
}

.cont p {
	overflow: hidden;
	min-height: 121px;
	max-height: 110px;
	margin-top: 3px;
	font-size: 13px;
	line-height: 22px;
	color: #666;
	word-break: break-all;
	width: 588px;
}

li div {
	margin-right: 50px;
	margin-left: 50px;
}

#top_re{
margin-left: -8px;
}
#bottom_re{
margin-left: 12px;

}

#bottom_re p{
width: 95%;}

.table div {
display: flex;}

#top_re p:nth-child(1) {
font-weight: bold;
font-size: 17px;

}

#bottom_re p{
font-weight: bold;
}



</style>
<script type="text/javascript">
	$(function() {
		
		var reviewnum = 0;
		
		
		if ("${rno }" !== "no") {
			
			
			
			var divid = "div-" + ${rno};
			var clickid = "click-" + ${rno};
			
			
			

			$('#' + clickid).parents("li").css({
				"background-color" : "rgb(255 254 241)"
			});


			var offset = $('#' + divid).offset();
			$('html').animate({
				scrollTop : offset.top
				
			}, 400);
			//$('#'+divid).parents("li").children((".openReview a")).get(0).click();

		}
		
		
		$.fn.comment = (function(a){
			
			
			var snum = ${snum};
			var cnum = ${ceoNum};
			if(snum == cnum){
			var review = a;
				if($("#comment_text-"+review).val() == ""){
				}else{
					$.ajax({
						mathod : "post",
						url : "<%=request.getContextPath()%>/ogj/data/reply.jsp", 
						data : {
							
							type : "${stype}",
							id : "${sid}",
							text : $("#comment_text-"+review).val(),
							ceonum : "${ceoNum}",
							reviewnum : review
						},
						success : function(data) {
							
							$().conview(review)
							if (data == 1) {
								alert("????????????");
							}else{
								alert("??????");	
							}
												},
						error : function(data) {
							alert("?????? ?????? ?????????.~~");
						}
					});
				}
			}else{
				alert("??? ?????? ???????????? ????????? ??? ??? ????????????.");
			}
			
		});
		
		
		
		$.fn.conview = (function(num){
			var reviewnum = num;
			
			$.ajax({
			url: "<%=request.getContextPath()%>/ogj/data/reply2.jsp",
			datatype : "xml",		 //?????? ????????? ??????
			data: {
				   reviewnum : reviewnum, 
				   ceonum: "${ceoNum}"
				   },
			success : function(data){ 
				 $("#table-"+reviewnum+" tbody tr").remove(); 
				//????????? ????????? ????????? ???(?????????(??????) ??????)??? ???????????? 
				//????????? ?????? ?????? ??????????????? ??????.
				let top = "";
				let type = $(this).find("type").text();
				$(data).find("reply").each(function(){
					
					
					top +="<tr>";
					top +="<td>";
					top +="<div id='top_re'>";
					if(type == "ceo"){
						top += "<p>????????? ??????</p>";
					}else{
					top +="<p>"+$(this).find("name").text()+"</p>";
					}
					top +="&nbsp;&nbsp;<p>"+$(this).find("date").text()+"</p>";
					top +="</div>";
					top +="<br>";
					top +="<div id='bottom_re'>";
					top +="<p>"+$(this).find("cont").text()+"</p>";
					top +="<a href='#;'>??????</a>";
					top +="</div>";
					top +="</td>";
					top +="</tr>";
				});

					
					//???????????? ????????? ?????? ????????? table ??????
					$("#table-"+reviewnum+" tbody:last").append(top);
			},
				error:function(){
					alert('?????? ?????? ??????');
				}
			});
		});
		
	});
		

</script>

</head>
<body>



	<jsp:include page="../../navi/main_navi.jsp" />
	<c:set var="num" value="${num }" />
	<c:set var="dto" value="${cont }" />
	<section class="shop_insert">
		<h1>?????? ?????????</h1>
		<div class="shop_cont1">
			<div class="imgCon">
				<img
					src="<%=request.getContextPath()%>/image/ceoimage/${dto.getCeo_image()}"
					width="350" height="255">


			</div>
			
			<table id="testtable">
<tbody>
</tbody>
</table>

			<div class="cont1_info">
				<h1>${dto.getCeo_name() }</h1>

				<c:choose>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=4.8 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/5star.png"
							width="80">
					</c:when>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=4.4 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/4_5star.png"
							width="80">
					</c:when>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=4.0 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/4star.png"
							width="80">
					</c:when>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=3.5 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/3_5star.png"
							width="80">
					</c:when>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=3.0 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/3star.png"
							width="80">
					</c:when>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=2.5 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/2_5star.png"
							width="80">
					</c:when>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=2.0 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/2star.png"
							width="80">
					</c:when>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=1.5 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/1_5star.png"
							width="80">
					</c:when>
					<c:when test="${Double.parseDouble(dto.getCeo_avgrate())>=1.0 }"> 
							${dto.getCeo_avgrate() }<img
							src="<%=request.getContextPath()%>/dohyung/upload/1star.png"
							width="80">
					</c:when>

				</c:choose>





				<p>${dto.getCeo_cont() }</p>


			</div>
		</div>

		<div class="shop_cont2">
			<h1>????????????</h1>
			<div class="cont2_info">
				<table>
					<tr>
						<th>?????????:</th>
						<td><p>${dto.getCeo_phone() }</p></td>
					</tr>

					<tr>
						<th>??????:</th>
						<td><p>${dto.getCeo_addr() }</p></td>
					</tr>

					<tr>
						<th>??????????????????:</th>
						<td><p>${dto.getCeo_car() }</p></td>
					</tr>
				</table>

			</div>

			<div class="loca">
				<div class="map" id="map">
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=692e1f73c3a0256f966eeb53fcd5a257"></script>
					<script>
						var mapContainer = document.getElementById('map'), // ????????? ????????? div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667), // ????????? ????????????
							level : 3
						// ????????? ?????? ??????
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????

						// ????????? ????????? ????????? ????????? ???????????????
						var marker = new kakao.maps.Marker({
							// ?????? ??????????????? ????????? ??????????????? 
							position : map.getCenter()
						});
						// ????????? ????????? ???????????????
						marker.setMap(map);

						// ????????? ?????? ???????????? ???????????????
						// ????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????????
						kakao.maps.event.addListener(map, 'click', function(
								mouseEvent) {

							// ????????? ??????, ?????? ????????? ??????????????? 
							var latlng = mouseEvent.latLng;

							// ?????? ????????? ????????? ????????? ????????????
							marker.setPosition(latlng);

							var message = '????????? ????????? ????????? ' + latlng.getLat()
									+ ' ??????, ';
							message += '????????? ' + latlng.getLng() + ' ?????????';

							console.log(message);

						});
					</script>
				</div>
			</div>
		</div>


		<br> <br> <br> <input type="hidden" name="r_c_num"
			value="${ceoNum }"> <br>


		<script>
			$(function() {
				$(".openReview a").click(
						function() {
							var at = $(this).html();
							if (at == "?????? ??????") {
								$(this).html("?????? ?????????");
								$(this).next().html("keyboard_arrow_down");
								$(this).parents().siblings(".bigimage").css({
									"display" : "none"
								});
								$(this).parents("li").css({
									"background-color" : "transparent"
								});
								$(this).parents("li").children().children()
										.children("p").css({
											"min-height" : "121px",
											"max-height" : "110px"
										});

							} else if (at == "?????? ?????????") {
								$(this).html("?????? ??????");
								$(this).next().html("expand_less");
								$(this).parents().siblings(".bigimage").css({
									"display" : "block"
								});
								$(this).parents("li").css({
									"background-color" : "#f3f3f3"
								});

								var li = $(this).parents("li");

								$(this).parents("li").children().children()
										.children("p").css({
											"min-height" : "unset",
											"max-height" : "unset"
										});

							}

						});
				
				
				
				$.fn.reset = function(){
					$(".review .review_a").html("?????? ?????????");
					$(".review .review_a").next().html("keyboard_arrow_down");
					$(".review .review_a").parents().siblings(".bigimage").css({
						"display" : "none"
					});
					$(".review .review_a").parents("li").css({
						"background-color" : "transparent"
					});
					$(".review .review_a").parents("li").children().children()
							.children("p").css({
								"min-height" : "121px",
								"max-height" : "110px"
							});
					
				}
					
				});

		</script>
		


		<div class="review" style="width: 1000px;">
			<ul>
				<c:set var="list" value="${List }" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<li>
							<div class="star" id="div-${dto.getReview_num() }">
								<span><img
									src="<%=request.getContextPath()%>/image/star/star-${dto.getReview_rate()}.png"
									width="110" height="40">${dto.getReview_rate()}</span><span>${dto.getReview_id() }</span><span>${dto.getReview_date().substring(0, 10) }</span>
							</div>
							<div class="cont">
								<div style="width: 1200px;">
									<em>${dto.getReview_cont() }</em>
									<p>${dto.getReview_cont() }</p>

								</div>
								<div>
									<c:if test="${!empty dto.getReview_image() }">
										<img
											src="<%=request.getContextPath()%>/image/userimage/${dto.getReview_image()}"
											width="100" height="100">
									</c:if>
									<c:if test="${empty dto.getReview_image() }">
										<div style="width: 100px; height: 100px; margin-right: 30px;"></div>
									</c:if>

								</div>



							</div>
							<div class="bigimage" style="display: none;">
								<c:if test="${!empty dto.getReview_image() }">
									<img
										src="<%=request.getContextPath()%>/image/userimage/${dto.getReview_image()}"
										width="250" height="250">
								</c:if>
								<c:if test="${empty dto.getReview_image() }">
									<div></div>
								</c:if>
								<form action="">
								<div class="comment" style="margin : 50px 50px 50px -50px">
								<div>
								
								
									<table class="table" id="table-${dto.getReview_num() }">
									<tbody></tbody>

									</table>
									<input type="hidden" id="hidden" value="${dto.getReview_num() }">
									
								</div>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="comment_text-${dto.getReview_num() }"
										placeholder="Recipient's username"
										aria-label="Recipient's username"
										aria-describedby="button-addon2">
									<button class="btn btn-outline-secondary" type="button"
										id="button-addon2 commentinput combtn" onclick="$().comment('${dto.getReview_num()}')">??????</button>
								</div>
								</div>
								</form>


							</div>
							<div class="openReview">
							
								<a href="#;" id="click-${dto.getReview_num() }" onclick="$().conview('${dto.getReview_num()}')">?????? ?????????</a><span
									class="material-icons review_a"> keyboard_arrow_down </span>
							</div>
						</li>
					</c:forEach>
				</c:if>

			</ul>



		</div>

		<c:if test="${page >block }">
			<a href="owner_contents.do?no=${ceoNum }&page=1">?????? </a>
			<a href="owner_contents.do?no=${ceoNum }&page=${startBlock -1 }">???</a>
		</c:if>
		<c:forEach begin="${startBlock }" end="${endBlock}" var="i">
			<c:if test="${i==page }">
				<b><a href="owner_contents.do?no=${ceoNum }&page=${i}">[${i}]</a></b>

			</c:if>
			<c:if test="${i!=page }">
				<a href="owner_contents.do?no=${ceoNum }&page=${i }">[${i }]</a>

			</c:if>

		</c:forEach>
		<c:if test="${endBlock < allPage }">
			<a href="owner_contents.do?no=${ceoNum }&page=${endBlock +1 }">???</a>
			<a href="owner_contents.do?no=${ceoNum }&page=${allPage }">??????</a>

		</c:if>
		<br> <br>

		<!-- -----------------???????????? ??????-------------- -->
		<button href="#" data-bs-toggle="modal" data-bs-target="#reviewinsert"
			data-test='${ceoNum }'>?????? ??????</button>






	</section>






	</div>
	</div>
</body>
</html>