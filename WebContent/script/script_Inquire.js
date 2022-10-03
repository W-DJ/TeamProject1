$(function() {



	

	/* 1:1문의 게시판 리스트 페이지 글쓰기 버튼 시작 /bbs_Inquire/inquirebbs.jsp */
	$("#loginPlzBtn").click(function() {
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
		location.href = "/Member/Login.jsp";
	});

	$("#inqBtn").click(function() {
		location.href = "/bbs_Inquire/write.jsp";
	});
	


	$("button#personalBtn").click(function() {

		$("iframe#ifrNotice").css({
			"display": "none"

		});
		$("iframe#ifrInquire").css({
			"display": "block"

		});
		
	});




	/* 문의게시판 리스트 페이지 글쓰기 버튼 시작 /bbs/list.jsp */
	$("#loginAlertBtn").click(function() {
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
	});

	$("#writeBtn").click(function() {
		location.href = "/bbs_Inquire/write.jsp";
	});
	/* 문의게시판 리스트 페이지 글쓰기 버튼 끝 /bbs/list.jsp */


	/* 글쓰기 페이지 게시글 등록 시작 /bbs/write.jsp */
	$("#regBtn").click(function() {
		let subject = $("#subject").val().trim();

		if (subject == "") {
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else {
			$("#writeFrm").attr("action", "/bbs_Inquire/writeProc.jsp");
			$("#writeFrm").submit();
		}

	});

	/* 글쓰기 페이지 게시글 등록 끝 /bbs/write.jsp */



	/* 글쓰기 페이지 게시글 수정 시작 /bbs_Inquire/read.jsp -> modify.jsp */
	$("#modInqBtn").click(function() {
		
		let nowPageInq = $("input#nowPageInq").val().trim();
		let num = $("input#num").val().trim();
		
		let url="/bbs_Inquire/modify.jsp?";
		url += "num="+num;
			url += "&nowPage="+nowPageInq;
		location.href = url;
		
		
	});

	/* 글쓰기 페이지 게시글 수정 끝  /bbs_Inquire/read.jsp -> modify.jsp */
	
		
		
		
		
		
	

	
	
	/* 1:1문의 수정페이지에서 수정내용 전송 시작 /bbs_Inquire/modify.jsp */
	
	
	$("td.update>button#modFinBtn").click(function(){
			
		let subject = $("td>input#subject").val().trim();
		
			
			if (subject == "") {
				alert("제목은 필수입력입니다.");
				$("#subject").focus();
			} else {
			
				$("#modifyInqProcFrm").submit();
			}ss
	
	});	
	/* 1:1문의 수정페이지에서 수정내용 전송 끝 /bbs_Inquire/modify.jsp */


	/* 게시글 삭제버튼 시작 /bbs_Notice/read.jsp */
	$("button#delInqBtn").click(function() {

		let chkTF = confirm("게시글을 삭제하시겠습니까?");

		
		if (chkTF) {
			let nowPage = $("input#nowPageInq").val().trim();
			let num = $("input#num").val().trim();



			let url = "/bbs_Inquire/delete.jsp?";
			url += "num=" + num + "&nowPage=" + nowPage;

			location.href = url;
		} else {
			alert("취소하셨습니다.");
		}

	});
	/* 게시글 삭제버튼 끝 /bbs/read.jsp */



/*  검색 결과를 유지한 리스트페이지 이동 시작 /bbs/read.jsp */
	$("td>button#listBtn").click(function(){
	
	
		let param = $("#nowPageInq").val().trim();
		
	     
		let url = "/bbs_Inquire/list.jsp?nowPage=" + param;		    

		window.parent.location.href=url;
	});
	/* 검색 결과를 유지한 리스트페이지 이동 끝 /bbs/read.jsp */

goListMainBtn

	$("button#goListMainBtn").click(function(){
	
	window.parent.parent.location.href="/bbs_Notice/ServiceMain.jsp";
	
	});




});




/* 1:1 문의 상세내용 보기 페이지 이동 시작 /bbs_Inquire/list.jsp => read.jsp */
function read(p1, p2) {
	
	let param = "/bbs_Inquire/read.jsp?num=" + p1;
	param += "&nowPage=" + p2;
	
	window.parent.location.href= param;
}

/* 1:1 문의 상세내용 보기 페이지 이동 끝 /bbs_Notice/list.jsp => read.jsp */