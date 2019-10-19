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
	.dataform div{
		display: inline-table;
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
						<li class="breadcrumb-item"><a href="javascript:void(0)">결제문서등록</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">기안서작성</a></li>
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
                                    <h4>기안서</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                    	<tr>
                                        	<td rowspan="2" align="center" width="10%">결재라인</td>
                                            <td width="10%"  align="center">결제자
                                            </td>
                                            <th  width="80%">
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
                                            <th>
                                            	<div class="member box_from">
                                            		<ul>
                                            			<li><div class="alert alert-info"  style="height: 40px;">민병현</div> </li>
                                            			<li><div class="alert alert-info"  style="height: 40px;">강연재</div> </li>
                                            		</ul>
                                            	</div>
                                            </th>
                                        </tr>
                                        <tr>
											<td align="center">휴가일시</td>
											<td colspan="2">
												<div class="dataform">
													<div id="date-range" class="input-daterange" align="center" > 
														<label>날짜선택</label> <br>
                                                		<input type="text" class="form-control" name="" style="display:inline-table; width:200px; text-align: center;" value="08/11/2019" readonly="readonly">  <span class="input-group-addon bg-info b-0 text-white">~</span>
                                                		<input type="text" class="form-control" name="" style="display:inline-table; width:200px; text-align: center;" value="11/11/2019" readonly="readonly"> 
                                            		</div>
													<div align="center"> 
														<label>휴가종류</label><br>
														<input type="text" class="form-control" name="" style="display:inline-table; width:100px; text-align: center;" value="개인사유" readonly="readonly"> 
													
													</div>
												</div>
											</td>
										</tr>
                                        <tr>
                                        	<td align="center">제목</td>
                                        	<td colspan="2">
                                        		<input type="text" class="form-control" id="val-title" name="title" value="휴가신청합니다." readonly="readonly">
                                        	</td>
										</tr>
										<tr>
                                        	<td align="center" >파일첨부</td>
                                        	<th colspan="2">
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
                                        	<td align="center">내용</td>
                                        	<th colspan="2">
                                        		<textarea rows="15" cols="137"  readonly="readonly" style="resize: none;"></textarea>
                                        	</th>
										</tr>
										<tr>
                                        	<td colspan="7" align="center">
                                        		<button type="button" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;수정 &nbsp;</button> &nbsp;&nbsp;
                                        		<button type="button" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;취소&nbsp;</button> &nbsp;&nbsp;
                                        
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