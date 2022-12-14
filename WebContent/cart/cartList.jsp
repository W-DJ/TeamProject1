<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="pack_ProdBoard.CartBean"%> 
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/err/errorProc.jsp"%>
<jsp:useBean id="objBoard" class="pack_ProdBoard.ProdBoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	
	String uId_Session = (String)session.getAttribute("uId_Session"); 
	String aId_Session = (String)session.getAttribute("aId_Session"); 

	List<CartBean> objList = objBoard.getCartList(uId_Session);
	
	String pattern = "#,###원";
	DecimalFormat df = new DecimalFormat(pattern);
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니 페이지</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Cart.js"></script>
	</head>
	<body>
		<div id="wrap">
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="bbsList">
    			<h1>장바구니</h1>
	    			<table>
						<tbody>
							<tr>
								<th>
									<label>
										<input type="checkbox" id="chkAll">
										<span>전체선택</span>								
									</label>
								</th>
								<th colspan="3">상품정보</th>
								<th>상품금액</th>
								<th>&nbsp;</th>
							</tr>
			
							<%
							 for(int i = 0 ; i< objList.size(); i++){
								 CartBean objBean = objList.get(i);
								 
								 int num = objBean.getNum();
								 String sysFileName = objBean.getSysFileName();
								 int pNum = objBean.getpNum();
								 String pName = objBean.getpName();
								 int sellPrice = objBean.getSellPrice();
								 int pVolumn = objBean.getpVolumn();
								 int stockVolumn = objBean.getStockVolumn();
							%>
							<tr>
								<td>
									<label>
										<input type="checkbox" class="chkOne">
										<input type="hidden" value="<%=sellPrice*pVolumn %>" class="prodPay">
										<input type="hidden" name="sellPrice" value="<%=sellPrice%>" class="sellPrice">
										<img src="/fileUpload/<%=sysFileName %>" alt="상품이미지" width="100" height="100">
									</label>
								</td>
								<td>
									<%=pName%>
									<input type="hidden" name = "pNum" value="<%=pNum%>" form="orderFrm">
									<input type="hidden" name ="pName" value="<%=pName%>">
									<input type="hidden" value="<%=num %>" form="multiDelFrm" class="num">
								</td>
								<td><%=df.format(sellPrice) %></td>
								<td>
									<button type="button" class="volumnDownBtn">-</button>
									<input type="number" class="orderVolumn" value="<%=pVolumn %>" name="orderVolumn">
									<button type="button" class="volumnUpBtn">+</button>
									<input type="hidden" class ="stockVolumn" value="<%=stockVolumn%>">
								</td>
								<td class="prodPay"><%=df.format(sellPrice*pVolumn) %></td>
								<td>
									<button type="button" class="oneDelBtn">&times;</button>
								</td>
	
							</tr>
						<%}%>
				
				
				
					</tbody>
					<tfoot>
						<tr>
							<td>
								<button type="button" id="multiDelBtn" form="multiDelFrm">선택삭제</button>
							</td>
							<td colspan="5">
							 	<span>총 상품가격</span>
							 	<span class="totalProdPrice">0원</span>
							 	<input type="hidden" name="totalProdPrice" class="totalProdPrice" form="orderFrm">
							 	<span>+</span>
							 	<span>총 배송비</span>
							 	<span class="totaldelivFee">0원</span>
							 	<input type="hidden" name="totaldelivFee" class="totaldelivFee" form="orderFrm">
							 	<span>=</span>
							 	<span>총 주문금액</span>
							 	<span class="totalPayment">0원</span>
							 	<input type="hidden" name="totalPayment" class="totalPayment" form="orderFrm">

							</td>
						</tr>
						<tr>
							<td colspan="6">
								<input type="hidden" name="uId" value="<%=uId_Session%>" form="orderFrm">
								<button type="submit" id="orderMoveBtn" form="orderFrm">구매하기</button>
							</td>
						</tr>
					</tfoot>
				</table> 	
		
		
    		</div>
    	<!-- 실제 작업 영역 끝 -->
    		    	

		
		
		</div>
		<!-- div#wrap -->
		<form action="/order/order.jsp" id="orderFrm"></form>
		<form action="/cart/cartMulDelProc.jsp" id="multiDelFrm"></form>
		<iframe width="0" height="0" class="cartModIfr" style="display: none"></iframe>
	</body>
</html>