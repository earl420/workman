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
						<li class="breadcrumb-item"><a href="javascript:void(0)">결제문서</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">휴가</a></li>
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
                                    <h4>휴가</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                    <tr>
                                    	<td rowspan="2" align="center" width="10%">결재라인</td>
                                            <td width="10%"  align="center">결제자
                                            </td>
                                            <th width="80%">
                                            	<div class="member box_from" >
                                            		<ul>
                                            		<c:if test="${ c.confirmEmp1 ne null}">
                                            			<li>
                                            				<c:if test="${ c.confirmDate1 eq null}">
                                            				<div class="alert alert-danger" style="height:100px; padding: 45px 0px; width:130px;">승인대기</div>
                                            				</c:if>
                                            				<c:if test="${ c.confirmDate1 ne null}">
                                            				<div class="alert alert-primary" style="height:100px; padding: 45px 0px; width:130px;">승인완료<br>${ c.confirmDate1 }</div>
                                            				</c:if>
                                            				<c:forEach items="${ mlist}" var="m">
                                            				<c:if test="${ m.empNum eq c.confirmEmp1 }">
                                            				<div class="alert alert-success" style="height: 40px; width:130px;">${ m.empName }${m.gradeName}</div>
                                   							</c:if>
                                   							</c:forEach>
                                   						</li>
                                   					</c:if>
                                   					<c:if test="${ c.confirmEmp2 ne null}">
                                            			<li>
                                            				<c:if test="${ c.confirmDate2 eq null}">
                                            				<div class="alert alert-danger" style="height:100px; padding: 45px 0px; width:130px;">승인대기</div>
                                            				</c:if>
                                            				<c:if test="${ c.confirmDate2 ne null}">
                                            				<div class="alert alert-primary" style="height:100px; padding: 45px 0px; width:130px; ">승인완료<br>${ c.confirmDate2 }</div>
                                            				</c:if>
                                            				<c:forEach items="${ mlist}" var="m">
                                            				<c:if test="${ m.empNum eq c.confirmEmp2 }">
                                            				<div class="alert alert-success" style="height: 40px; width:130px;">${ m.empName }${m.gradeName}</div>
                                   							</c:if>
                                   							</c:forEach>
                                   						</li>
                                   					</c:if>
                                   					<c:if test="${ c.confirmEmp3 ne null}">
                                            			<li>
                                            				<c:if test="${ c.confirmDate3 eq null}">
                                            				<div class="alert alert-danger" style="height:100px; padding: 45px 0px; width:130px;">승인대기</div>
                                            				</c:if>
                                            				<c:if test="${ c.confirmDate3 ne null}">
                                            				<div class="alert alert-primary" style="height:100px; padding: 45px 0px; width:130px;">승인완료<br>${ c.confirmDate3 }</div>
                                            				</c:if>
                                            				<c:forEach items="${ mlist}" var="m">
                                            				<c:if test="${ m.empNum eq c.confirmEmp3 }">
                                            				<div class="alert alert-success" style="height: 40px; width:130px;">${ m.empName }${m.gradeName}</div>
                                   							</c:if>
                                   							</c:forEach>
                                   						</li>
                                   					</c:if>
                                   					<c:if test="${ c.confirmEmp4 ne null}">
                                            			<li>
                                            				<c:if test="${ c.confirmDate4 eq null}">
                                            				<div class="alert alert-danger" style="height:100px; padding: 45px 0px; width:130px;">승인대기</div>
                                            				</c:if>
                                            				<c:if test="${ c.confirmDate4 ne null}">
                                            				<div class="alert alert-primary" style="height:100px; padding: 45px 0px; width:130px;">승인완료<br>${ c.confirmDate4 }</div>
                                            				</c:if>
                                            				<c:forEach items="${ mlist}" var="m">
                                            				<c:if test="${ m.empNum eq c.confirmEmp4 }">
                                            				<div class="alert alert-success" style="height: 40px;width:130px;">${ m.empName }${m.gradeName}</div>
                                   							</c:if>
                                   							</c:forEach>
                                   						</li>
                                   					</c:if>
                                            		</ul>
                                            	</div>
                                            </th>
                                        </tr>
                                        <tr>
                                        	<td width="10%"  align="center">참조자 </td>
                                            <th width="80%">
                                            	<div class="member box_from">
                                            		<ul>
                                            		<c:if test="${ rf ne null }">
                                            			<c:if test="${ rf.empNum1 ne null }">
                                            				<c:forEach items="${ mlist}" var="m">
                                            					<c:if test="${ m.empNum eq rf.empNum1 }">
                                            						<li><div class="alert alert-dark"  style="height: 40px; width:130px; ">${ m.empName }${m.gradeName}</div></li>
                                            					</c:if>
                                            				</c:forEach>
                                            			</c:if>
                                            			<c:if test="${ rf.empNum2 ne null }">
                                            				<c:forEach items="${ mlist}" var="m">
                                            					<c:if test="${ m.empNum eq rf.empNum2 }">
                                            						<li><div class="alert alert-dark"  style="height: 40px; width:130px;">${ m.empName }${m.gradeName}</div></li>
                                            					</c:if>
                                            				</c:forEach>
                                            			</c:if>
                                            			<c:if test="${ rf.empNum3 ne null }">
                                            				<c:forEach items="${ mlist}" var="m">
                                            					<c:if test="${ m.empNum eq rf.empNum3 }">
                                            						<li><div class="alert alert-dark"  style="height: 40px;width:130px;">${ m.empName }${m.gradeName}</div></li>
                                            					</c:if>
                                            				</c:forEach>
                                            			</c:if>
                                            			<c:if test="${ rf.empNum4 ne null }">
                                            				<c:forEach items="${ mlist}" var="m">
                                            					<c:if test="${ m.empNum eq rf.empNum4 }">
                                            						<li><div class="alert alert-dark"  style="height: 40px;width:130px;">${ m.empName }${m.gradeName}</div></li>
                                            					</c:if>
                                            				</c:forEach>
                                            			</c:if>
                                            		</c:if>
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
                                                		<input type="text" class="form-control" name="" style="display:inline-table; width:200px; text-align: center;" value="${ h.holidayStart}" readonly="readonly">  <span class="input-group-addon bg-info b-0 text-white">~</span>
                                                		<input type="text" class="form-control" name="" style="display:inline-table; width:200px; text-align: center;" value="${ h.holidayEnd}" readonly="readonly"> 
                                            		</div>
													<div align="center"> 
														<label>휴가종류</label><br>
														<input type="text" class="form-control" style="display:inline-table; width:100px; text-align: center;" value="${ h.holiType }" readonly="readonly"> 
													
													</div>
												</div>
											</td>
										</tr>
										 <tr>
                                        	<td align="center" width="10%">등록일</td>
                                        	<td colspan="2" width="20%">
                                        		<input type="text" class="form-control" value="${ h.holiApply }" style=" width:200px;text-align:center;" readonly="readonly">
                                        	</td>
										</tr>
										<tr>
                                        	<td align="center" >파일첨부</td>
                                        	<th colspan="6">
                                        		<div class="files box_from">
                                            		<ul id="fileName">
                                   						<c:if test= "${a  ne null }">
                                   						<li><button type="button" class="btn mb-1 btn-rounded btn-primary">${ a.attOriginalName }</button></li>
                                   						</c:if>
                                            		</ul>
                                            	</div>
                                        	</th>
										</tr>
										<tr>
                                        	<td colspan="10" align="center">
                                        		<c:if test="${ h.holidayStatus eq 'Y' and loginMan.num eq h.empNum }">
                                        		<button type="button" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;수정 &nbsp;</button> &nbsp;&nbsp;
                                        		</c:if>
                                        		<c:choose>
                                        			<c:when test="${ loginMan.num eq c.confirmEmp1 and c.confirmDate1 eq null}">
                                        				<c:url value="successtHoliday.wo" var="successtHoliday">
                                        					<c:param name="confirmNum" value="${ h.confirmNum}"/>
                                        					<c:param name="holiNum" value="${ h.holiNum}"/>
                                        					<c:param name="count" value="1"/>
														</c:url>
                                        					<button type="button" onclick="location.href='${ successtHoliday }'" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;승인하기 &nbsp;</button> &nbsp;&nbsp;
                                        			</c:when>
                                        			<c:when test="${ loginMan.num  eq c.confirmEmp2 and c.confirmDate2 eq null  and c.confirmDate1 eq null}">
                                        				<button type="button" class="btn mb-1 btn-outline-primary btn-lg" disabled>&nbsp;승인대기 &nbsp;</button> &nbsp;&nbsp;
                                        			</c:when>
                                        			<c:when test="${ loginMan.num  eq c.confirmEmp2 and c.confirmDate2 eq null  and c.confirmDate1 ne null}">
                                        				<c:url value="successtHoliday.wo" var="successtHoliday">
                                        					<c:param name="confirmNum" value="${ h.confirmNum}"/>
                                        					<c:param name="holiNum" value="${ h.holiNum}"/>
                                        					<c:param name="count" value="2"/>
														</c:url>
                                        				<button type="button" onclick="location.href='${ successtHoliday }'"  class="btn mb-1 btn-outline-primary btn-lg">&nbsp;승인하기 &nbsp;</button> &nbsp;&nbsp;
                                        			</c:when>
                                        			<c:when test="${ loginMan.num  eq c.confirmEmp3 and c.confirmDate3 eq null  and c.confirmDate2 eq null}">
                                        				<button type="button" class="btn mb-1 btn-outline-primary btn-lg" disabled>&nbsp;승인대기 &nbsp;</button> &nbsp;&nbsp;
                                        			</c:when>
                                        			<c:when test="${ loginMan.num  eq c.confirmEmp3 and c.confirmDate3 eq null  and c.confirmDate2 ne null}">
                                        				<c:url value="successtHoliday.wo" var="successtHoliday">
                                        					<c:param name="confirmNum" value="${ h.confirmNum}"/>
                                        					<c:param name="holiNum" value="${ h.holiNum}"/>
                                        					<c:param name="count" value="3"/>
														</c:url>
                                        				<button type="button" onclick="location.href='${ successtHoliday }'" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;승인하기 &nbsp;</button> &nbsp;&nbsp;
                                        			</c:when>
                                        			<c:when test="${ loginMan.num  eq c.confirmEmp4 and c.confirmDate4 eq null  and c.confirmDate3 eq null}">
                                        				<button type="button" class="btn mb-1 btn-outline-primary btn-lg" disabled>&nbsp;승인대기 &nbsp;</button> &nbsp;&nbsp;
                                        			</c:when>
                                        			<c:when test="${ loginMan.num  eq c.confirmEmp4 and c.confirmDate4 eq null  and c.confirmDate3 ne null}">
                                        				<c:url value="successtHoliday.wo" var="successtHoliday">
                                        					<c:param name="confirmNum" value="${ h.confirmNum}"/>
                                        					<c:param name="holiNum" value="${ h.holiNum}"/>
                                        					<c:param name="count" value="4"/>
														</c:url>
                                        				<button type="button"  onclick="location.href='${ successtHoliday }'" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;승인하기 &nbsp;</button> &nbsp;&nbsp;
                                        			</c:when>
                                        		</c:choose>
                                        		
                                        		<button type="button" onclick="location.href='allList.wo'" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;목록&nbsp;</button>
                                        		
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