<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 캘린더 보기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Calendar</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
    <!-- Custom Stylesheet -->
    <link href="./resources/plugins/fullcalendar/css/fullcalendar.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">

</head>
<style>
	.fc-day:hover{
   	 	cursor:pointer;
   	} 
	.fc-content{
		color:white;
	}
</style>

<body>
        <div id="main-wrapper" style="background: white;">
		<c:import url="../common/header.jsp"></c:import>

       <div class="content-body">	
			<div class="content-fluid" style="height: 100px;" align="center">
				<div class="insertouter">
			
        <!--**********************************
            Content body start
        ***********************************-->

           
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                               <!--  <div class="card-title">
                                    <h4>Calendar</h4>
                                </div> -->
                                <div class="row">
                                       
                                        <!-- checkbox -->
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-box m-b-50">
                                            <div id="calendar"></div>
                                        </div>
                                    </div>

                                    <!-- end col -->
                                    <!-- BEGIN MODAL -->
                                    <div class="modal fade none-border" id="event-modal">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><strong>일정 등록</strong></h4>
                                                </div>
                                                <div class="modal-body"></div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">취소</button>
                                                    <button type="button" class="btn btn-success save-event waves-effect waves-light">등록</button>
                                                    <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">삭제</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Modal Add Category -->
                                   <div class="modal fade none-border" id="add-category">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title"><strong>Add Category</strong></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <label class="control-label">Category Name</label>
                                                                <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name">
                                                            </div>
                                                            <div class="col-md-6">
                                                                <label class="control-label">Type</label>
                                                                <select class="form-control form-white" data-placeholder="타입을 선택하세요" name="category-color">
                                                                    <option value="전체">전체일정</option>
                                                                    <option value="부서">부서일정</option>
                                                                    <option value="보고서">보고서</option>
                                                                    <option value="개인">개인일정</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">취소</button>
                                                    <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">저장</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <!-- END MODAL -->
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        	
        <!--**********************************
            Footer start
        ***********************************-->
        <c:import url="../common/footer.jsp"></c:import>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->
    
    <script src="./resources/plugins/jqueryui/js/jquery-ui.min.js"></script>
    <script src="./resources/plugins/moment/moment.min.js"></script>
    <script src="./resources/plugins/fullcalendar/js/fullcalendar.min.js"></script>
    <script src="./resources/js/plugins-init/fullcalendar-init.js"></script>

</body>

</html>