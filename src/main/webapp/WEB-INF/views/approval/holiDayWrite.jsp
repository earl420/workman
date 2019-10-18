<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
<link href="resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
<meta charset="UTF-8">
<style>
	.box_from ul li{
		display: inline-table;
		margin-bottom : 0px;
	}
	.box_from ul {
		margin-bottom : 0px;
		
	}
	.dataform div{
		display: inline-table;
	}
</style>
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"	charset="utf-8"></script>
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
						<li class="breadcrumb-item"><a href="javascript:void(0)">휴가작성</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->
			<div class="container-fluid">
			<form action="insertHoliDat.wo" method="post" encType="multipart/form-data">
				<div class="row">
					<div class="col-lg-12">
					<div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>휴가신청</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                    	<tr>
                                        	<td rowspan="2" align="center" width="10%">결재라인</td>
                                            <td width="10%"  align="center">
                                            	<button type="button" class="btn mb-1 btn-rounded btn-success">
                                            		<span class="btn-icon-left">
                                            			<i class="fa fa-share-alt color-secondary"></i> 
                                            		</span>결제자선택
                                            	</button>
                                            </td>
                                            <th  width="80%">
                                            	<div class="member box_from" >
                                            		<ul>
                                            			<li class="alert"><button type="button" class="btn mb-1 btn-rounded btn-success"  data-dismiss="alert" aria-label="Close">강연재 
                                            					<span class="btn-icon-right"><i class="fa fa-close"></i></span>
                                   							 </button>
                                   						</li>
                                            			<li class="alert"><button type="button" class="btn mb-1 btn-rounded btn-success"  data-dismiss="alert" aria-label="Close">민병현 
                                            					<span class="btn-icon-right"><i class="fa fa-close"></i></span>
                                   							 </button>
                                   						</li>
                                            		</ul>
                                            	</div>
                                            </th>
                                        </tr>
                                        <tr>
                                        	<td align="center">
                                            	<button type="button" class="btn mb-1 btn-rounded btn-secondary">
                                            		<span class="btn-icon-left">
                                            			<i class="fa fa-share-alt color-secondary"></i> 
                                            		</span>참조자선택
                                            	</button>
                                            </td>
                                            <th>
                                            	<div class="member box_from">
                                            		<ul>
                                            			<li class="alert"><button type="button" class="btn mb-1 btn-rounded btn-secondary"  data-dismiss="alert" aria-label="Close">강연재
                                            					<span class="btn-icon-right"><i class="fa fa-close"></i></span>
                                   							 </button>
                                   						</li>
                                            			<li class="alert"><button type="button" class="btn mb-1 btn-rounded btn-secondary"  data-dismiss="alert" aria-label="Close">민병현 
                                            					<span class="btn-icon-right"><i class="fa fa-close"></i></span>
                                   							 </button>
                                   						</li>
                                            		</ul>
                                            	</div>
                                            </th>
                                        </tr>
                                        <tr>
                                        	<td align="center">제목</td>
                                        	<td colspan="2">
                                        		<input type="text" class="form-control" id="val-title" name="title" placeholder="제목등록">
                                        	</td>
										</tr>
										<tr>
											<td align="center">휴가일시</td>
											<td colspan="2">
												<div class="dataform">
													<div id="date-range" class="input-daterange" align="center" > 
														<label>날짜선택</label> <br>
                                                		<input type="text" class="form-control" name="start"  style="display:inline-table; width:200px;"> <span class="input-group-addon bg-info b-0 text-white">~</span>
                                                		<input type="text" class="form-control" name="end" style="display:inline-table; width:200px;">
                                            		</div>
													<div align="center"> 
														<label>휴가종류</label><br>
														<select name=""	 style="width:100px; height:45px; min-height: 30px;">
															<option value="10">개인사유</option>
															<option value="25">훈련</option>
															<option value="50">경조사</option>
														</select>
													</div>
												</div>
											</td>
										</tr>
										<tr>
                                        	<td align="center" >파일첨부</td>
                                        	<td>
                                        		<label class="btn mb-1 btn-rounded btn-primary" for="file-input">
                                        			<span class="btn-icon-left"><i class="fa fa-upload color-success"></i> 
                                        		</span>Upload</label>
                                        		<input id='file-input' type='file' multiple style= "display:none;">
                                        	</td>
                                        	<th>
                                        		<div class="files box_from">
                                            		<ul id="fileName">
                                   						
                                            		</ul>
                                            	</div>
                                        	</th>
										</tr>
										<tr>
                                        	<td align="center">내용</td>
                                        	<th colspan="2">
                                        		<textarea id="ir1" rows="15" cols="137"  style="resize: none;"></textarea>
                                        	</th>
										</tr>
										<tr>
                                        	<td colspan="7" align="center">
                                        		<button type="submit" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;등록 &nbsp;</button> &nbsp;&nbsp;
                                        		<button type="reset" class="btn mb-1 btn-outline-primary btn-lg">&nbsp;취소&nbsp;</button> &nbsp;&nbsp;
                                        		<button type="button" class="btn mb-1 btn-outline-primary btn-lg">임시저장</button>
                                        	</td>
										</tr>                                                                                 	
                                           
                                    </table>
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</form>
			</div>
		</div>
		
		
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	
	<script src="resources/plugins/moment/moment.js"></script>
	<script	src="resources/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<script	src="resources/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
	<script	src="resources/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
	<script src="resources/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
	    	$('#date-range').datepicker({
	        	toggleActive: true
	    	});
		})
	
	</script>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
	 	oAppRef: oEditors,
	 	elPlaceHolder: "ir1",
	 	sSkinURI: "resources/se2/SmartEditor2Skin.html",
	 	fCreator: "createSEditor2"
		});	
	</script>
<script>
  var fileInput = document.getElementById('file-input');
  var files = new Array();
  		fileInput.addEventListener('change', function(event) {
  			
    		var input = event.target;
			for (var i = 0; i < input.files.length; i++) {
      		console.log(input.files[i].name);
      		files.push( input.files[i]);
      		var $ul = $(".files ul");
			var $li = $("<li class='alert'>");
			var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-primary' data-dismiss='alert' aria-label='Close'>").text(files[i].name + "");
			var $span = $("<span class='btn-icon-right'><i class='fa fa-close'></i>");
			 	$button.append($span);
				$li.append($button);
				$ul.append($li);
    		}
			console.log(files);
  }); /* 파일 추가  */

		
</script>
</body>
</html>