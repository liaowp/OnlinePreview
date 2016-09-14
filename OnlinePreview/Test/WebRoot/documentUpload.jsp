<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>

		<meta  http-equiv="Content-Type"  content="text/html; charset=UTF-8">
		<title>文档在线预览系统</title>
		<style>
   
     body  {
	margin-top: 100px;
	background: #fff;
	font-family:  Verdana,  Tah oma;
}

   
    a  {
	color: #CE4614;
}

   
   #msg-box  {
	color:   #CE4614;
	 font-size: 0.9em;
	text-align: center;
}

      #msg-box .logo  {
	border-bottom: 5px solid  #ECE5D9;
	margin-bottom: 20 px;
	padding-bottom: 10px;
}

   
    #msg-box .title  {
	font-size: 1.4em;
	font-weight: bold;
	margin: 0 0 30p x 0;
}

   
   #msg-box .nav  {
	margin-top: 20px;
}
   











 
</style>
	</head>
	<body>
		   
		<div  id="msg-box">
			        
			<form  name="form1"   method="post"  enctype="multipart/form-data"
				 
action="docUploadConvertAction.jsp">
				       
				<div  class="title">
					       请上传要处理的文件，过程可能需要几分钟，请稍候片刻。        
				</div>
				       
				<p>
					          
					<input  name="file1"  type="file">
					       
				</p>
				      
				<p>
					             
					<input  type="submit"  name="Submit"  value="上传">
					         
				</p>
				     
			</form>
			    
		</div>
		   
	</body>
</html>
