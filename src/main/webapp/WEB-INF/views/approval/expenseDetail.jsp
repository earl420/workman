<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<meta charset="UTF-8">
<style>
	.box_from ul li div{
		text-align:center;
		margin-bottom:0.5px;
		width: 100px;
	}
	.box_from ul li{
		display: inline-table;
	}
	.box_from ul {
		margin-bottom : 0px;
	}
</style>
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<title>전자결재</title>
</head>
<body>
	<div id="main-wrapper">
		<c:import url="../common/header.jsp" />
		<div class="content-body" style="min-height: 884px;">
			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">결제문서</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">지출결의서</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
					<div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>지출결의서</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                    	<tr>
                                        	<td rowspan="2" align="center" width="10%">결재라인</td>
                                            <td width="10%"  align="center">결제자
                                            </td>
                                            <th colspan="4" width="80%">
                                            	<div class="member box_from" >
                                            		<ul>
                                            			<li>
                                            				<div class="alert alert-primary" style="height:100px; padding: 45px 0px; ">결제</div>
                                            				<div class="alert alert-success" style="height: 40px;">민병현</div>
                                   						</li>
                                            			<li>
                                            				<div class="alert alert-primary" style="height:100px; padding: 45px 0px; ">결제</div>
                                            				<div class="alert alert-success" style="height: 40px;">민병현</div>
                                   						</li>
                                            		</ul>
                                            	</div>
                                            </th>
                                        </tr>
                                        <tr>
                                        	<td width="10%"  align="center">참조자 </td>
                                            <th colspan="4">
                                            	<div class="member box_from">
                                            		<ul>
                                            			<li><div class="alert alert-info"  style="height: 40px;">민병현</div> </li>
                                            			<li><div class="alert alert-info"  style="height: 40px;">강연재</div> </li>
                                            		</ul>
                                            	</div>
                                            </th>
                                        </tr>
                                        <tr>
                                        	<td align="center">제목</td>
                                        	<td colspan="5">
                                        	<input type="text" class="form-control" id="val-title" name="title" value="제품구입지출결의서" readonly="readonly">
                                        	</td>
										</tr>
										<tr>
                                        	<td align="center" >파일첨부</td>
                                        	<th colspan="5">
                                        		<div class="files box_from">
                                            		<ul id="fileName">
                                   						<li>
                                   						<button type="button" class="btn mb-1 btn-rounded btn-primary">corejava.dll</button>
                                   						</li>
                                   						<li>
                                   						<button type="button" class="btn mb-1 btn-rounded btn-primary">dsaw.dll</button>
                                   						</li>
                                   						<li>
                                   						<button type="button" class="btn mb-1 btn-rounded btn-primary">파일.dll</button>
                                   						</li>
                                            		</ul>
                                            	</div>
                                        	</th>
										</tr>
										<tr>
											<td align="center">거래처</td>
											<td  colspan="2" align="center" width="40%">업체명</td>
											<td align="center" width="10%">사업자<br>등록번호</td>
											<td  colspan="2" align="center">204-81-89080</td>
										</tr>
										<tr>
											<td align="center">업체당담자명</td>
											<td  colspan="2" align="center" width="40%">강정학</td>
											<td align="center" width="10%">업체전화번호</td>
											<td  colspan="2" align="center">02-6712-9348</td>
										</tr>
										<tr>
											<td align="center">금액</td>
											<td  colspan="2" align="center" width="40%">121212</td>
										</tr>
										<tr>
                                        	<td align="center">내용</td>
                                        	<th colspan="5">
                                        		<textarea rows="15" cols="135" readonly="readonly" style="resize: none;">
                                        		제품 : 구입비용 100만원
                                        		</textarea>
                                        	</th>
										</tr>
										<tr>
                                        	<td colspan="6" align="center">
                                        		<button type="button" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;등록 &nbsp;</button> &nbsp;&nbsp;
                                        		<button type="button" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;취소&nbsp;</button> &nbsp;&nbsp;
                                        		<button type="button" class="btn mb-1 btn-outline-primary btn-lg">임시저장</button>
                                        	</td>
										</tr>                  
                                    </table>
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>

		</div>
		
		
		<c:import url="../common/footer.jsp"></c:import>
	</div>

</body>
</html>