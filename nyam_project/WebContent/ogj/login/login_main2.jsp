<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/ogj/css/style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
		$(function() {

			var check = $("#check").html();
			$("#checktest").html("");
			var usersearchURL = "<%=request.getContextPath()%>/ogj/data/SearchUserId.jsp";
			var searchUser = 1;

			$("button[name='user']").click(function() {
				$(".text-muted a").attr("data-bs-target", "#staticBackdrop2");
				$(".login_main button").attr("onclick" , "$().login()");
				$().reset();
				$(".user-choice").css({
					"border" : "1px solid #919191",
					"border-bottom" : "0px",
					"background-color" : "white"
				});
				$(".ceo-choice").css({
					"border" : "1px solid #ddd",
					"border-bottom" : "1px solid #919191",
					"border-left" : "1px solid #91919",
					"background-color" : "#ededed"
				});
				usersearchURL = "<%=request.getContextPath()%>/ogj/data/SearchUserId.jsp";

			});
			$("button[name='ceo']").click(function() {
				$(".text-muted a").attr("data-bs-target", "#staticBackdrop3");
				$(".login_main button").attr("onclick" , "$().ceologin()");
				
				$().reset();
				$(".ceo-choice").css({
					"border" : "1px solid #919191",
					"border-bottom" : "0px",
					"background-color" : "white"
				});
				$(".user-choice").css({
					"border" : "1px solid #ddd",
					"border-bottom" : "1px solid #919191",
					"border-right" : "1px solid #91919",
					"background-color" : "#ededed"
				});
				usersearchURL = "<%=request.getContextPath()%>/ogj/data/SearchCeoId.jsp";
			});
			$("button[name='useridSearch']").click(function() {

				$().reset();
				$(".id_search").css({
					"border" : "1px solid #919191",
					"border-bottom" : "0px",
					"background-color" : "white"
				});
				$(".pwd_search").css({
					"border" : "1px solid #ddd",
					"border-bottom" : "1px solid #919191",
					"border-left" : "1px solid #91919",
					"background-color" : "#ededed"
				});
				$(".searchIdDiv").css({
					"display" : "block"
				});
				$(".searchPwdDiv").css({
					"display" : "none"
				});
				$("#searchinput1").attr("required", true);
				$("#searchinput2").attr("required", false);
				if (usersearchURL == "<%=request.getContextPath()%>/ogj/data/SearchUserPwd.jsp") {
					usersearchURL = "<%=request.getContextPath()%>/ogj/data/SearchUserId.jsp";
				} else if (usersearchURL == "<%=request.getContextPath()%>/ogj/data/SearchCeoPwd.jsp") {
					usersearchURL = "<%=request.getContextPath()%>/ogj/data/SearchCeoId.jsp";
				}
				searchUser = 1;

			});
			$("button[name='userpwdSearch']").click(function() {
				$().reset();
				$(".pwd_search").css({
					"border" : "1px solid #919191",
					"border-bottom" : "0px",
					"background-color" : "white"
				});

				$(".id_search").css({
					"border" : "1px solid #ddd",
					"border-bottom" : "1px solid #919191",
					"border-right" : "1px solid #91919",
					"background-color" : "#ededed"
				});
				$(".searchPwdDiv").css({
					"display" : "block"
				});
				$(".searchIdDiv").css({
					"display" : "none"
				});
				$("#searchinput1").attr("required", false);
				$("#searchinput2").attr("required", true);
				if (usersearchURL == "<%=request.getContextPath()%>/ogj/data/SearchUserId.jsp") {
					usersearchURL = "<%=request.getContextPath()%>/ogj/data/SearchUserPwd.jsp";
				} else if (usersearchURL == "<%=request.getContextPath()%>/ogj/data/SearchCeoId.jsp") {
					usersearchURL = "<%=request.getContextPath()%>/ogj/data/SearchCeoPwd.jsp";
				}
				searchUser = 2;
			});

			//-----------------------------???????????? ????????? ????????? ??????--------------------------
			/* var regid = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/; */
			var regid = /^[a-zA-Z0-9]{6,12}$/;
			var regpwd = /^[a-zA-Z0-9]{4,12}$/;
			var regname = /^[???-???]{2,8}$/;
			var regemail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			var regphone = /^\d{3}-\d{3,4}-\d{4}$/;
			var regceonum = /^(\d{3,3})+[-]+(\d{2,2})+[-]+(\d{5,5})/;
			var shopname = /^[???-???a-zA-Z0-9]{2,15}$/;
			var regnickname = /^[???-???0-9]{2,8}$/;
			
			var idok = 0;
			var pwok = 0;
			var pw2ok = 0;
			var nameok = 0;
			var emailok = 0;
			var phoneok = 0;
			var nickname = 0;

			$("#user_join_id").keyup(function() { //-----id ????????? ??????
				var inputvalue = $("#user_join_id").val();
				if (!regid.test(inputvalue)) {
					$("#join_id_check").html("6~12?????? ?????? ??????????????? ???????????? ??????????????????.");

					$("#join_id_check").css({
						"color" : "red"
					});
					idok = 0;
				} else {
					$("#join_id_check").html("???");
					$("#join_id_check").css({
						"color" : "blue"

					});
					idok = 1;
				}

			});

			$("#ceo_join_id").keyup(function() { //-----ceo id ????????? ??????
				var inputvalue = $("#ceo_join_id").val();
				if (!regid.test(inputvalue)) {
					$("#join_ceoid_check").html("6~12?????? ?????? ??????????????? ???????????? ??????????????????.");

					$("#join_ceoid_check").css({
						"color" : "red"
					});
					idok = 0;
				} else {
					$("#join_ceoid_check").html("???");
					$("#join_ceoid_check").css({
						"color" : "blue"

					});
					idok = 1;
				}

			});

			$("#user_join_pwd ").keyup(function() { //-------pwd ???????????????
				var inputvalue = $("#user_join_pwd").val();
				if (!regpwd.test(inputvalue)) {
					$("#join_pwd_check").html("4~12?????? ?????? ??????????????? ???????????? ??????????????????.");
					$("#join_pwd_check").css({
						"color" : "red"
					});
					pwok = 0;
				} else {
					$("#join_pwd_check").html("???");
					$("#join_pwd_check").css({
						"color" : "blue"
					});
					pwok = 1;
				}
			});

			$("#user_join_pwd_check").keyup(function() { //-------pwd ?????? ???????????????
				var pwd1 = $("#user_join_pwd").val();
				var pwd2 = $("#user_join_pwd_check").val();
				if (pwd1 !== pwd2) {
					$("#join_pwd2_check").html("??????????????? ????????????.");
					$("#join_pwd2_check").css({
						"color" : "red"
					});
					pw2ok = 0;
				} else {
					$("#join_pwd2_check").html("???");
					$("#join_pwd2_check").css({
						"color" : "blue"
					});
					pw2ok = 1;
				}
			});
			$("#ceo_join_pwd").keyup(function() { //------- ceo pwd ???????????????
				var inputvalue = $("#ceo_join_pwd").val();
				if (!regpwd.test(inputvalue)) {
					$("#ceo_pwd_check").html("4~12?????? ?????? ??????????????? ???????????? ??????????????????.");
					$("#ceo_pwd_check").css({
						"color" : "red"
					});
					pwok = 0;
				} else {
					$("#ceo_pwd_check").html("???");
					$("#ceo_pwd_check").css({
						"color" : "blue"
					});
					pwok = 1;
				}
			});

			$("#ceo_join_pwd2").keyup(function() { //------- ceo pwd ?????? ???????????????
				var pwd1 = $("#ceo_join_pwd").val();
				var pwd2 = $("#ceo_join_pwd2").val();
				if (pwd1 !== pwd2) {
					$("#ceo_pwd_check2").html("??????????????? ????????????.");
					$("#ceo_pwd_check2").css({
						"color" : "red"
					});
					pw2ok = 0;
				} else {
					$("#ceo_pwd_check2").html("???");
					$("#ceo_pwd_check2").css({
						"color" : "blue"
					});
					pw2ok = 1;
				}
			});
			$("#user_join_name").keyup(function() { //-------name ????????? ??????
				var inputvalue = $("#user_join_name").val();
				if (!regname.test(inputvalue)) {
					$("#join_name_check").html("????????? ?????? ?????????.");
					$("#join_name_check").css({
						"color" : "red"
					});
					nameok = 0;
				} else {
					$("#join_name_check").html("???");
					$("#join_name_check").css({
						"color" : "blue"
					});
					nameok = 1;
				}
			});
			$("#ceo_join_name").keyup(function() { //-------ceo ????????? ????????? ??????
				var inputvalue = $("#ceo_join_name").val();
				if (!shopname.test(inputvalue)) {
					$("#ceo_name_check").html("2~15?????? ????????? ?????? ???????????? ????????? ?????????.");
					$("#ceo_name_check").css({
						"color" : "red"
					});
					nameok = 0;
				} else {
					$("#ceo_name_check").html("???");
					$("#ceo_name_check").css({
						"color" : "blue"
					});
					nameok = 1;
				}
			});

			$(".emailgroup").keyup(

					function() { //-------email ????????? ??????
						var inputvalue = $("#user_join_email-1").val() + "@"
								+ $("#user_join_email-2").val();
						if (!regemail.test(inputvalue)) {
							$("#join_email_check").html("????????? ?????? ?????????.");
							$("#join_email_check").css({
								"color" : "red"
							});
							emailok = 0;
						} else {
							$("#join_email_check").html("???");
							$("#join_email_check").css({
								"color" : "blue"
							});
							emailok = 1;
						}
					});
			$(".ceo_email_group").keyup(

					function() { //-------  ceo email ????????? ??????
						var inputvalue = $("#ceo_join_email1").val() + "@"
								+ $("#ceo_join_email2").val();
						if (!regemail.test(inputvalue)) {
							$("#ceo_email_check").html("????????? ?????? ?????????.");
							$("#ceo_email_check").css({
								"color" : "red"
							});
							emailok = 0;
						} else {
							$("#ceo_email_check").html("???");
							$("#ceo_email_check").css({
								"color" : "blue"
							});
							emailok = 1;
						}
					});
			$("#searchinput1").keyup(function() { //-------name ????????? ??????
				var inputvalue = $("#searchinput1").val();
				if (!regname.test(inputvalue)) {
					$("#search_name_check").html("????????? ?????? ?????? ?????????.");
					$("#search_name_check").css({
						"color" : "red"
					});
					idok = 0;
				} else {
					$("#search_name_check").html("???");
					$("#search_name_check").css({
						"color" : "blue"
					});
					idok = 1;
				}
			});
			$("#searchinput2").keyup(function() { //-------name ????????? ??????
				var inputvalue = $("#searchinput2").val();
				if (!regid.test(inputvalue)) {
					$("#search_id_check").html("6~12?????? ?????? ??????????????? ???????????? ??????????????????.");
					$("#search_id_check").css({
						"color" : "red"
					});
					idok = 0;
				} else {
					$("#search_id_check").html("???");
					$("#search_id_check").css({
						"color" : "blue"
					});
					idok = 1;
				}
			});
			$(".search_email_group").keyup(

					function() { //-------  search email ????????? ??????
						var inputvalue = $("#search_email1").val() + "@"
								+ $("#search_email2").val();
						if (!regemail.test(inputvalue)) {
							$("#search_email_check").html("????????? ?????? ?????????.");
							$("#search_email_check").css({
								"color" : "red"
							});
							emailok = 0;
						} else {
							$("#search_email_check").html("???");
							$("#search_email_check").css({
								"color" : "blue"
							});
							emailok = 1;
						}
					});

			$(document)
					.on(
							"keyup",
							"#user_join_phone",
							function() {
								$(this)
										.val(
												$(this)
														.val()
														.replace(/[^0-9]/g, "")
														.replace(
																/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,
																"$1-$2-$3")
														.replace("--", "-"));
								var inputvalue = $("#user_join_phone").val();

								if (!regphone.test(inputvalue)) {
									$("#join_phone_check").html("????????? ???????????? ?????????.");
									$("#join_phone_check").css({
										"color" : "red"
									});

									phoneok = 0;
								} else {
									$("#join_phone_check").html("???");
									$("#join_phone_check").css({
										"color" : "blue"
									});
									phoneok = 1;
								}

							});

			$(document)
					.on(
							"keyup",
							"#ceo_join_phone",
							function() {
								$(this)
										.val(
												$(this)
														.val()
														.replace(/[^0-9]/g, "")
														.replace(
																/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,
																"$1-$2-$3")
														.replace("--", "-"));
								var inputvalue = $("#ceo_join_phone").val();

								if (!regphone.test(inputvalue)) {
									$("#ceo_phone_check").html("????????? ???????????? ?????????.");
									$("#ceo_phone_check").css({
										"color" : "red"
									});
									phoneok = 0;
								} else {
									$("#ceo_phone_check").html("???");
									$("#ceo_phone_check").css({
										"color" : "blue"
									});
									phoneok = 1;
								}

							});
			$("#nickname_set").keyup(function() { //-------????????? ????????? ??????
				var inputvalue = $("#nickname_set").val();
				if (!regnickname.test(inputvalue)) {
					$("#nickname_check").html("2~8?????? ??????,?????? ???????????? ???????????????..");
					$("#nickname_check").css({
						"color" : "red"
					});
					nickname = 0;
				} else {
					$("#nickname_check").html("???");
					$("#nickname_check").css({
						"color" : "blue"
					});
					nickname = 1;
				}
			});

			 		$("#ceo_join_conum").keyup(function() {  //-------phone ????????? ??????
			 			
			 			$(this).val($(this).val().replace(/[^0-9]/g, "").replace(
			 					/(\d{3})(\d{2})(\d{5})/g,"$1-$2-$3")
							.replace("--", "-"));
			
			 var inputvalue = $("#ceo_join_conum").val();
			
			 if(!regceonum.test(inputvalue)){
			 $("#ceo_conum_check").html("????????? ?????? ?????????.");
			 $("#ceo_conum_check").css({
			 "color":"red"
			 });
			 }else {
			 $("#ceo_conum_check").html("???");
			 $("#ceo_conum_check").css({
			 "color":"blue"
			 });
			 } 
			 }); 
			 
			 $("#nickname_false").click(function(){
			 });
			 
		 	 

			//------------------------------- ????????? ajax ---------------------------------
			$.fn.login = (function() {

				var login_id = $(".idinput").val();
				var login_pwd = $(".pwdinput").val();

				if ($(".pwdinput").val() !== "" && $(".idinput").val() !== "") {
					$.ajax({
						mathod : "post",
						url : "<%=request.getContextPath()%>/ogj/data/login.jsp", 
						data : {

							id : login_id,
							pwd : login_pwd
						},
						success : function(data) {
							if (data == 0) {
								$(".idinput").val("");
								$(".pwdinput").val("");
								$("#login_pwd_check").html("???????????? ???????????? ????????????.");

							} else if (data == -1) {  // ???????????? ??????.
								$(".pwdinput").val("");
								$("#login_id_check").html("");
								$("#login_pwd_check").html("??????????????? ???????????????.");
							} else if (data == 1) { // ????????? ??????
								$(".idinput").val("");
								$(".pwdinput").val("");
								$("#login_pwd_check").html("");
								$().reset();
								$(".nick-name").trigger("click");
							} else if (data == 2){ // ????????? ??????.
								$().reset();
								var user = "member";
								if(login_id == "admin1"){
									user = "admin";
								}
								location.href = "<%=request.getContextPath()%>/user_login_ok.do?id="+login_id+"&user="+user;
								 
							}
							
						},
						error : function(data) {
							alert("?????? ?????? ?????????.~~");
						}
					});
				}

			}); // ----------------------------????????? ajax ???------------------------------------
			
			//------------------------------- ceo ????????? ajax ---------------------------------
			$.fn.ceologin = (function() {

				var login_id = $(".idinput").val();
				var login_pwd = $(".pwdinput").val();

				if ($(".pwdinput").val() !== "" && $(".idinput").val() !== "") {
					$.ajax({
						mathod : "post",
						url : "<%=request.getContextPath()%>/ogj/data/ceologin.jsp",
						data : {

							id : login_id,
							pwd : login_pwd
						},
						success : function(data) {
							if (data == 0) {
								$(".idinput").val("");
								$(".pwdinput").val("");
								$("#login_pwd_check").html("???????????? ???????????? ????????????.");

							} else if (data == -1) {  // ???????????? ??????.
								$(".pwdinput").val("");
								$("#login_id_check").html("");
								$("#login_pwd_check").html("??????????????? ???????????????.");
							}  else if (data == 1){ // ??????
								$().reset();
								location.href = "<%=request.getContextPath()%>/ceo_login_ok.do?id="+login_id+"&user=ceo";
								
								
							}
							
						},
						error : function(data) {
							alert("?????? ?????? ?????????.~~");
						}
					});
				} 

			}); // ---------------------------- ceo ????????? ajax ???------------------------------------
			
			//------------------------------- ????????? ajax ---------------------------------
			$("#nickname_ok").click(function() {


				if ($("#nickname_set").val() !== "") {
					if (nickname == 0) {
						$("#nickname_set").focus();
					} else {
					
					$.ajax({
						mathod : "post",
						url : "<%=request.getContextPath()%>/ogj/data/nickname_set.jsp",
						data : {
							
							nickname : $("#nickname_set").val()
						},
						success : function(data) {
							if (data < 0) {
								$("#nickname_set").val("");
								$("#nickname_check").html("???????????? ????????? ?????????.");

							} else if (data > 0) {
								alert("?????? ??????");
								$().reset();

								$(".okdk").trigger("click");
							}
						},
						error : function(data) {
							alert("?????? ?????? ?????????.~~")
						}
					});
					}
				}

			}); // ----------------------------????????? ajax ???------------------------------------

			//--------------------------------???????????? ajax --------------------------------

			$(".join_ok").click(
					function() {

						if ($("#user_join_id").val() !== ""
								&& $("#user_join_pwd").val() !== ""
								&& $("#user_join_pwd_check").val() !== ""
								&& $("#user_join_name").val() !== ""
								&& $("#user_join_phone").val() !== ""
								&& $("#user_join_email-1").val() !== ""
								&& $("#user_join_email-2").val() !== "") {
							if (idok == 0) {
								$("#user_join_id").focus();
							} else if (pwok == 0) {
								$("#user_join_pwd").focus();
							} else if (pw2ok == 0) {
								$("#user_join_pwd_check").focus();
							} else if (nameok == 0) {
								$("#user_join_name").focus();
							} else if (phoneok == 0) {
								$("#user_join_phone").focus();
							} else if (emailok == 0) {
								$("#user_join_email-1").focus();
							} else {
								//--ajax ??????
								$.ajax({
									mathod : "post",
									url : "<%=request.getContextPath()%>/ogj/data/join.jsp",
									data : {

										id : $("#user_join_id").val(),
										pwd : $("#user_join_pwd").val(),
										name : $("#user_join_name").val(),
										phone : $("#user_join_phone").val(),
										email : $("#user_join_email-1").val() + "@"
												+ $("#user_join_email-2").val()
									},
									success : function(data) {
										if (data > 0) {

											$().reset();

											$(".okdk").trigger("click");

										} else if (data < 0) {
											//?????? ????????? ??????
											$("#user_join_id").focus();
											$("#user_join_id").val("");

											$("#join_id_check").html(
													"????????? ???????????? ????????????.");

											$("#join_id_check").css({
												"color" : "red"
											});
											idok = 0;

										} else {
											// ??? ??????
											alert("?????? ?????? ?????????. ?????? ????????? ?????????")
										}
									},
									error : function(data) {
										alert("?????? ?????? ?????????.~~")
									}
								});

							}
						}
					});

			//---------------------------------------???????????? ajax ??? --------------
			//---------------------------------------ceo ???????????? ajax ?????? --------------

			$(".ceoJoin_ok").click(
					function() {

						if ($("#ceo_join_id").val() !== ""
								&& $("#ceo_join_pwd").val() !== ""
								&& $("#ceo_join_pwd2").val() !== ""
								&& $("#ceo_join_name").val() !== ""
								&& $("#ceo_join_phone").val() !== ""
								&& $("#ceo_join_email1").val() !== ""
								&& $("#ceo_join_email2").val() !== "") {
							if (idok == 0) {
								$("#ceo_join_id").focus();
							} else if (pwok == 0) {
								$("#ceo_join_pwd").focus();
							} else if (pw2ok == 0) {
								$("#ceo_join_pwd2").focus();
							} else if (nameok == 0) {
								$("#ceo_join_name").focus();
							} else if (phoneok == 0) {
								$("#ceo_join_phone").focus();
							} else if (emailok == 0) {
								$("#ceo_join_email1").focus();

							} else {
								//--ajax ??????
								$.ajax({
									mathod : "post",
									url : "<%=request.getContextPath()%>/ogj/data/ceo_join.jsp",
												data : {

													id : $("#ceo_join_id")
															.val(),
													pwd : $("#ceo_join_pwd")
															.val(),
													name : $("#ceo_join_name")
															.val(),
													phone : $("#ceo_join_phone")
															.val(),
													email : $(
															"#ceo_join_email1")
															.val()
															+ "@"
															+ $(
																	"#ceo_join_email2")
																	.val(),
													conum : $("#ceo_join_conum")
															.val()
												},
												success : function(data) {
													if (data > 0) {

														$().reset();

														$(".okdk").trigger(
																"click");

													} else if (data == -1) { // ????????? ??????
														//?????? ????????? ??????
														$("#ceo_join_id")
																.focus();
														$("#ceo_join_id").val(
																"");

														$("#join_ceoid_check")
																.html(
																		"????????? ???????????? ????????????.");

														$("#join_ceoid_check")
																.css(
																		{
																			"color" : "red"
																		});
														idok = 0;

													} else if (data == -2) { // ????????? ??????
														$("#ceo_join_email1")
																.focus();
														$("#ceo_join_email1")
																.val("");
														$("#ceo_join_email2")
																.val("");

														$("#ceo_email_check")
																.html(
																		"????????? ???????????? ????????????.");

														$("#ceo_email_check")
																.css(
																		{
																			"color" : "red"
																		});
														emailok = 0;
													} else {
														// ??? ??????
														alert("?????? ?????? ?????????. ?????? ????????? ?????????")
													}
												},
												error : function(data) {
													alert("?????? ?????? ?????????.~~")
												}
											});

									//--ajax?????? ???
								}
							}
						});

		//---------------------------------------ceo ???????????? ajax ??? --------------

		$.fn.reset = function() {

			$("#staticBackdrop input").val("");
			$("#staticBackdrop3 input").val("");
			$("#staticBackdrop2 input").val("");
			$("#search input").val("");

			$(".erorcheck").html("");

			$(".login_form input").val("");

			idok = 0;
			pwok = 0;
			pw2ok = 0;
			nameok = 0;
			emailok = 0;
			phoneok = 0;

		}

		//-------------------------------------- ???????????? ajax ???----------------------------------------------

		//------------------------------?????? ??????????????? -------------------------------
		$(".searchBtn").click(
				function() {

					if (searchUser == 1) {

						if ($("#searchinput1").val !== ""
								&& $("#search_email1").val !== ""
								&& $("#search_email2").val !== "") {
							if (idok == 0) {
								$("#searchinput1").focus();
							} else if (emailok == 0) {
								$("#search_email1").focus();

							} else {
								$.ajax({
									mathod : "post",
									url : usersearchURL,
									data : {

										name : $("#searchinput1").val(),
										email : $("#search_email1").val() + "@"
												+ $("#search_email2").val()
									},
									success : function(data) {

										const data1 = $.trim(data);
										if (data1 == "false") {
											$("#search_val").html(
													"?????? ????????? ???????????? ????????????.");
											$("#search_val").css({
												"color" : "red"
											});

										} else {
											$("#search_val")
													.html(
															"????????? ???????????? " + data
																	+ "?????????.");
											$("#search_val").css({
												"color" : "blue"
											});
										}

									},
									error : function(data) {
										alert("?????? ?????? ?????????.~~")
									}
								});
							}

							//--ajax?????? ???

						}
					} else if (searchUser == 2) {
						if ($("#searchinput2").val !== ""
								&& $("#search_email1").val !== ""
								&& $("#search_email2").val !== "") {
							if (idok == 0) {
								$("#searchinput2").focus();
							} else if (emailok == 0) {
								$("#search_email1").focus();

							} else {
								$.ajax({
									mathod : "post",
									url : usersearchURL,
									data : {

										id : $("#searchinput2").val(),
										email : $("#search_email1").val() + "@"
												+ $("#search_email2").val()
									},
									success : function(data) {

										const data1 = $.trim(data);
										if (data1 == "false") {
											$("#search_val").html(
													"?????? ????????? ???????????? ????????????.");
											$("#search_val").css({
												"color" : "red"
											});

										} else {
											$("#search_val").html(
													"????????? ??????????????? " + data
															+ "?????????.");
											$("#search_val").css({
												"color" : "blue"
											});
										}

									},
									error : function(data) {
										alert("?????? ?????? ?????????.~~")
									}
								});
							}

							//--ajax?????? ???

						}

					}

				});

		$("#rate3").click();

		$("insertOk").click(function() {
			var reviewstar = $('input[name="reviewStar"]:checked').val();
			var reviewfile = $("#reviewfile").val();
			var reviewarea = $("#reviewarea").val();

		});

	});
</script>

</head>
<body>


	<!-- 	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<span class="material-symbols-outlined">
done
</span> -->




	<%-- ????????? ?????? ?????? --%>
	<div class="modal fade join" id="staticBackdrop"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="header">Login</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%-- ?????? ?????? --%>
					<div class="choice-button">

						<span class="choice-span">
							<button class="user-choice choicBtn" name="user" type="button">????????????</button>
							<button class="ceo-choice choicBtn2" name="ceo" type="button">?????????</button>
						</span>


					</div>

					<div class="panel-body p-3 login_main">

						<form class="login_form" onsubmit="return false">
							<%-- ?????? ????????? --%>
							<div class="col-md-4">
								<input type="text" class="form-control idinput"
									id="validationDefault01" value="" name="userid"
									placeholder="?????????" required> <br>
							</div>
							<div class="col-md-4">
								<input type="password" class="form-control pwdinput"
									placeholder="????????????" id="validationDefault02" value=""
									name="userpwd" required> <br> <span
									class="erorcheck" id="login_pwd_check"></span>
							</div>
							<div class="form-inline">
								<input type="checkbox" name="remember" id="remember"> <label
									for="remember" class="text-muted remember">????????? ????????????</label>&nbsp;&nbsp;&nbsp;
								<a href="#" id="forgot" class="font-weight-bold"
									data-bs-toggle="modal" data-bs-target="#search">???????????????
									???????????????????</a>
							</div>
							<button class="btn btn-primary" id="login_ok"
								onclick="$().login()">?????????</button>
							<div class="text-center pt-4 text-muted">
								????????? ????????????? <a href="#" data-bs-toggle="modal"
									onclick="$().reset()" data-bs-target="#staticBackdrop2">????????????</a>
							</div>
						</form>

					</div>


				</div>

			</div>
		</div>
	</div>
	<%-- ????????? ?????? ??? --%>

	<%-- ???????????? ?????? ?????? --%>
	<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="header">Login</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%-- ?????? ?????? --%>

					<form class="row g-3 signup_form" onsubmit="return false">
						<div class="col-md-4">
							<label for="validationDefault01" class="form-label">?????????</label> <input
								type="text" class="form-control" id="user_join_id" value=""
								required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="join_id_check"></span> <span
								class="material-symbols-outlined" style="color: blue;">
								 </span>
						</div>
						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">????????????</label>
							<input type="password" class="form-control" id="user_join_pwd"
								value="" required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="join_pwd_check"></span>
						</div>
						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">????????????
								??????</label> <input type="password" class="form-control"
								id="user_join_pwd_check" value="" required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="join_pwd2_check"></span>
						</div>
						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">??????</label> <input
								type="text" class="form-control" id="user_join_name" value=""
								required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="join_name_check"></span>
						</div>
						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">?????????
								??????</label> <input type="text" class="form-control phoneNumber"
								id="user_join_phone" value="" maxlength="13" required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="join_phone_check"></span>
						</div>


						<div class="col-md-4">

							<div class="input-group mb-3 email_input">
								<label for="validationDefault02" class="form-label">e-mail</label>
								<input type="text" class="form-control emailgroup"
									id="user_join_email-1"> <span class="input-group-text">@</span>
								<input type="text" class="form-control emailgroup"
									id="user_join_email-2">
							</div>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="join_email_check"></span>
						</div>

						<div class="col-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="invalidCheck1" required> <label
									class="form-check-label" for="invalidCheck1"> ???????????? ??????
									?????? </label>
							</div>
						</div>
						<div class=" signbutton">
							<div class="col-12">
								<button class="btn btn-primary join_ok">????????????</button>
								<button class="btn btn-primary" type="reset"
									data-bs-target="#staticBackdrop" data-bs-toggle="modal">????????????</button>

							</div>
						</div>
					</form>






				</div>

			</div>
		</div>
	</div>
	<%-- ???????????? ?????? ??? --%>

	<%-- ????????? ???????????? ?????? ?????? --%>
	<div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="header">Login</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%-- ?????? ?????? --%>

					<form class="row g-3 signup_form" onsubmit="return false">
						<div class="col-md-4">
							<label for="validationDefault01" class="form-label">?????????</label> <input
								type="text" class="form-control" id="ceo_join_id" value=""
								required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="join_ceoid_check"></span>
						</div>


						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">????????????</label>
							<input type="password" class="form-control" id="ceo_join_pwd"
								value="" required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="ceo_pwd_check"></span>
						</div>
						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">????????????
								??????</label> <input type="password" class="form-control"
								id="ceo_join_pwd2" value="" required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="ceo_pwd_check2"></span>
						</div>
						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">?????????</label> <input
								type="text" class="form-control" id="ceo_join_name" value=""
								required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="ceo_name_check"></span>
						</div>
						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">?????????
								??????</label> <input type="text" class="form-control" id="ceo_join_conum"
								value="" required maxlength="12" required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="ceo_conum_check"></span>
						</div>

						<div class="col-md-4">
							<label for="validationDefault02" class="form-label">??????
								????????? ??????</label> <input type="text" class="form-control"
								id="ceo_join_phone" value="" maxlength="13" required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="ceo_phone_check"></span>
						</div>

						<div class="col-md-4">

							<div class="input-group mb-3 email_input">
								<label for="validationDefault02" class="form-labelp">e-mail</label>
								<input type="text" class="form-control  ceo_email_group"
									id="ceo_join_email1" aria-label="Username"> <span
									class="input-group-text">@</span> <input type="text"
									class="form-control  ceo_email_group" id="ceo_join_email2"
									aria-label="Server">
							</div>



						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="ceo_email_check"></span>
						</div>

						<div class="col-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="invalidCheck2" required> <label
									class="form-check-label" for="invalidCheck2"> ???????????? ??????
									?????? </label>
							</div>
						</div>
						<div class=" signbutton">
							<div class="col-12">
								<button class="btn btn-primary ceoJoin_ok">????????????</button>
								<button class="btn btn-primary" type="reset"
									data-bs-target="#staticBackdrop" data-bs-toggle="modal">????????????</button>
							</div>
						</div>
					</form>






				</div>

			</div>
		</div>
	</div>
	<%-- ????????? ???????????? ?????? ??? --%>

	<button class="okdk" data-bs-target="#signnok" data-bs-toggle="modal"></button>

	<div class="modal fade okok" id="signnok" data-bs-backdrop="static"
		<%-- ???????????? ?????? --%>
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="header">Login</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%-- ?????? ?????? --%>
					<div>
						<h3>??????????????????. ??????????????? ?????????????????????.</h3>
					</div>
					<div class=" signbutton">
						<div class="col-12">
							<button class="btn btn-primary" data-bs-target="#staticBackdrop"
								data-bs-toggle="modal">?????????</button>
						</div>
					</div>


				</div>

			</div>
		</div>
	</div>

	<button class="nick-name" data-bs-target="#nick-name-choice"
		data-bs-toggle="modal" style="display: none;"></button>

	<div class="modal fade" id="nick-name-choice" data-bs-backdrop="static"
		<%-- ????????? ?????? --%>
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="header">Login</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%-- ?????? ?????? --%>
					<form class="row g-3 signup_form" onsubmit="return false">
						<div class="col-md-4">
							<label for="validationDefault01" class="form-label">?????????</label> <input
								type="text" class="form-control" id="nickname_set" value=""
								required>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="nickname_check"></span>
						</div>

						<div class=" signbutton">
							<div class="col-12">
								<button class="btn btn-primary" id="nickname_ok">??????</button>
								<button class="btn btn-primary" data-bs-target="#staticBackdrop"
									data-bs-toggle="modal" id="nickname_false">??????</button>
							</div>
						</div>
					</form>


				</div>

			</div>
		</div>
	</div>



	<%-- ????????? ?????? ?????? ?????? --%>
	<div class="modal fade" id="search" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="searchheader"></h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%-- ?????? ?????? --%>
					<div class="choice-button">

						<span class="choice-span searchgtngr">
							<button class="id_search choicBtn" name="useridSearch"
								type="button">????????? ??????</button>
							<button class="pwd_search choicBtn2" name="userpwdSearch"
								type="button">???????????? ??????</button>
						</span>


					</div>

					<form class="row g-3 signup_form" onsubmit="return false">

						<div class="col-md-4 searchIdDiv">
							<label for="validationDefault01" class="form-label id-label">??????</label>
							<input type="text" class="form-control" id="searchinput1"
								value="">
						</div>
						<div class="checkdiv join_check_id searchIdDiv">
							<span class="erorcheck" id="search_name_check"></span>
						</div>
						<div class="col-md-4 searchPwdDiv">
							<label for="validationDefault01" class="form-label id-label">?????????</label>
							<input type="text" class="form-control" id="searchinput2"
								value="">
						</div>
						<div class="checkdiv join_check_id searchPwdDiv">
							<span class="erorcheck" id="search_id_check"></span>
						</div>
						<div class="col-md-4">

							<div class="input-group mb-3 email_input">
								<label for="validationDefault02" class="form-labelp">e-mail</label>
								<input type="text" class="form-control  search_email_group"
									id="search_email1"> <span class="input-group-text">@</span>
								<input type="text" class="form-control  search_email_group"
									id="search_email2">
							</div>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="search_email_check"></span>
						</div>
						<div class="checkdiv join_check_id">
							<span class="erorcheck" id="search_val"></span>
						</div>


						<div class=" signbutton">
							<div class="col-12">
								<button class="btn btn-primary searchBtn">??????</button>
								<button class="btn btn-primary" type="reset"
									data-bs-target="#staticBackdrop" data-bs-toggle="modal">????????????</button>
							</div>
						</div>
					</form>






				</div>

			</div>
		</div>
	</div>


	<%-- ??????????????? ?????? ??? --%>
	
	<script type="text/javascript">
	$(function(){
		$('#reviewinsert').on('show.bs.modal', function (e) {
		    var data22 = $(e.relatedTarget).data('test');
		    $('input[name=c_num]').attr('value',data22);
		});
	})
	
	</script>

	<div class="modal fade" id="reviewinsert" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="header">Login</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%-- ?????? ?????? --%>


					<div class="panel-body p-3">

						<form method="post" class="login_form" id="reviewform" enctype="multipart/form-data"
							action="<%=request.getContextPath()%>/review_inputOk.do">
							

							<%-- ?????? ????????? --%>
							<div class="input-group">
								<input type="hidden" name="c_num" value="">
								<a></a>
								<textarea class="form-control textarea1" name="reviewarea"
									aria-label="With textarea" style="height: 200px; resize: none;"
									required></textarea>
							</div>
							<div class="input-group mb-3">
								<input type="file" class="form-control" name="reviewfile">
							</div>
							<fieldset>
								<span class="text-bold">????????? ??????????????????</span> <input type="radio"
									name="reviewStar" value="5" id="rate1" required><label
									for="rate1">???</label> <input type="radio" name="reviewStar"
									value="4" id="rate2"><label for="rate2">???</label> <input
									type="radio" name="reviewStar" value="3" id="rate3"><label
									for="rate3">???</label> <input type="radio" name="reviewStar"
									value="2" id="rate4"><label for="rate4">???</label> <input
									type="radio" name="reviewStar" value="1" id="rate5"><label
									for="rate5">???</label>

							</fieldset>
							<br> <br>



							<div class="col-12">
								<button class="btn btn-primary">??????</button>
								<button class="btn btn-primary" type="reset">??????</button>

							</div>

						</form>

					</div>

				</div>


			</div>

		</div>
	</div>








	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>

</body>
</html>