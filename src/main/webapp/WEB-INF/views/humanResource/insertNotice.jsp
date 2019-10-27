<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
</head>
<body>
	<div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                            	<textarea name="ir1" id="ir1" rows="15" cols="148" >
								</textarea>
                            </div>
                        </div>
                    </div>
                </div>
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
</body>
</html>