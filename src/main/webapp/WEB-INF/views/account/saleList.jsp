<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="resources/account/css/saleList.css" rel="stylesheet">
</head>
<body>
		<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle
					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
					stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper" style="background: white;">
		<c:import url="../common/header.jsp"></c:import>
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="content-fluid" style="height: 100px; padding-left: 100px; padding-right: 100px;" align="center">
				
				
				<div class="table-responsive" style="text-align: center;">
					<h3 style="padding-top: 40px; padding-bottom: 10px;">판매관리</h3>
					<table class="table table-bordered verticle-middle" id="acList" style="border: 1px solid black; padding-left: 10px; padding-right:10px;">
						<thead>
							<tr>
								<th width="10%">판매번호</th>
								<th width="30%">판매 제품</th>
								<th width="15%">거래처</th>
								<th width="10%">판매사원</th>
								<th width="10%">판매금액</th>
								<th width="15%">판매일시</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							<tr>
								<td>1</td>
								<td>무언가</td>
								<td>....</td>
								<td>양정환</td>
								<td>2000000</td>
								<td>19/10/17</td>
							</tr>
							
						</tbody>
					</table>
					
						
				</div>
				<div align="right" style="padding-right: 50px; padding-top: 10px;">
					<button type="button" class="btn mb-1 btn-outline-warning"  id="insertSale"
					 style="border-radius: 5px; width:10em;">
						<strong>판매등록</strong>
					</button>
				</div>
				<div align="center" style="padding-top: 20px;" >
					<div class="pages" onclick="paging(1);">&lt;&lt;</div>
					<div class="pages" onclick="paging(1);">&lt;</div>
					<c:forEach var="i" begin="1" end="10">
						<div class="pages" onclick="paging(this.innerText);">${ i }</div>
					</c:forEach>
					<div class="pages" onclick="paging(10);">&gt;</div>
					<div class="pages" onclick="paging(10);">&gt;&gt;</div>
				</div>
			</div>
			<!-- /.container -->
			
			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
        <div style="float: left; padding-left: 30%;">
		<c:import url="../common/footer.jsp"></c:import>	
        </div>
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
    
    
    
    <div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      	<h4></h4>
      </div>
      <div class="modal-body">
      	<form method="post" id="modalForm">
       		<table class="table" id="updateSale">
       			<tr>
       				<th>판매제품</th>
       				<td><input type="text" /></td>
       			</tr>
       			<tr>
       				<th>거래처</th>
       				<td><input type="text" /></td>
       			</tr>
       			<tr>
       				<th>판매자</th>
       				<td><input type="text" readonly="readonly"/></td>
       			</tr>
       			<tr>
       				<th>판매가격</th>
       				<td><input type="text" /></td>
       			</tr>
       			<tr>
       				<th>판매일시</th>
       				<td><input type="text" readonly="readonly"/></td>
       			</tr>
       		</table>
       		<button type="submit" id="modalBtn" class="btn mb-1 btn-rounded btn-outline-warning">
       			
       		</button>
       		</form>
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>
	 <script src="resources/account/js/saleList.js"></script>
</body>
</html>