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
	.box_from{
		/* padding-top: 12px; */
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
						<li class="breadcrumb-item"><a href="javascript:void(0)">결제문서등록</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0)">품의서</a></li>
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
                                    <h4>품의서</h4>
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
                                            			<li><button type="button" class="btn mb-1 btn-rounded btn-success">강연재 
                                            					<span class="btn-icon-right"><i class="fa fa-close"></i></span>
                                   							 </button>
                                   						</li>
                                            			<li><button type="button" class="btn mb-1 btn-rounded btn-success">민병현 
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
                                            			<li><button type="button" class="btn mb-1 btn-rounded btn-secondary">강연재
                                            					<span class="btn-icon-right"><i class="fa fa-close"></i></span>
                                   							 </button>
                                   						</li>
                                            			<li><button type="button" class="btn mb-1 btn-rounded btn-secondary">민병현 
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
                                        		<textarea id="ir1" rows="10" cols="137"></textarea>
                                        	</th>
										</tr>
										<tr>
                                        	<td colspan="7" align="center">
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
			var $li = $("<li>");
			var $button= $("<button type='button' class='btn mb-1 btn-rounded btn-primary'>").text(files[i].name + "");
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