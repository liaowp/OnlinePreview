<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文档在线预览系统</title>
<style type="text/css">
</style>
</head>
<body>
      <div id="msg-box">
       <form name="form1" method="post" enctype="multipart/form-data" action="docUploadConvertAction.jsp">
       
         <div class="title">
             请选择要处理的文件，过程可能需要几分钟，请稍等片刻。
           </div>
           <P>
               <input name="file1" type="file">
           </P>
           <p>
              <input type="submit" name="Submit" value="上传">
           </p>
        
       </form>
   
      </div>
</body>
</html>

