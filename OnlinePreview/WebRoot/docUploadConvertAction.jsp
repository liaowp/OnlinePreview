<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.*"%>
<%@page import="com.cectsims.util.DocConverter"%>
<%
 String saveDirectory=application.getRealPath("/")+"upload";
 System.out.println(saveDirectory);
 int maxPostSize=50*1024*1024;
DefaultFileRenamePolicy dfp=new DefaultFileRenamePolicy();
MultipartRequest multi=new MultipartRequest(request,saveDirectory,maxPostSize,"UTF-8",dfp);
  Enumeration files=multi.getFileNames();
  while(files.hasMoreElements()){
       System.err.println("ccc");
       String name=(String)files.nextElement();
       File f=multi.getFile(name);
       if(f!=null){
          String fileName=multi.getFilesystemName(name);
            System.out.println("ddddddddd"+fileName);
          //h获取上传文件的车站名
          String extName=fileName.substring(fileName.lastIndexOf(".")+1);
          //文件全路径
          String lastFileName=saveDirectory+"\\"+fileName;
          //获取需要转换的文件名，将路径名中得\替换为/
          String converfilename=saveDirectory.replaceAll("\\\\","/")+"/"+fileName;
          System.out.println("adajsdjas"+converfilename);
          //调用转换类DocConverter,并将需要转换的文件传递给该类的构造方法
          DocConverter d=new DocConverter(converfilename);
          //调用conver方法开始转换，先执行doc2pdf()将office文件转换为pdf;再执行pdf2swf()将pdf转换为swf;
          d.conver();
          //调用getswfPath()方法，打印转换后的swf文件路径
          System.out.println("aaaaaaaaaaa"+d.getswfPath());
          //生成swf相对路径，以便传递给flexpaper播放器
          String swfpath="upload"+d.getswfPath().substring(d.getswfPath().lastIndexOf("/"));
          System.out.println("文件路径"+swfpath);
          //将相对路径放入session中保存
          session.setAttribute("swfpath",swfpath);
          out.println("上传的文件："+lastFileName);
          out.println("文件类型"+extName);
          out.println("<hr>");       
       }
  }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
     body{
     margin-top:100px;
     background:#fff;
     font-family:Verdana,Tahoma;
     }
     a{
     color:#CE4614;
     }
     #mgs-box{
     color:#CE4614;
     font-size:0.9em;
     text-align:center;
     }
     #msg-box .logo{
     border-bottom:5px solid #ECE5D9;
     margin-bottom:20px;
     padding-bottom10px;
     }
     #msg-box .title{
     font-size1.4em;
     font-weight:bold;
     margin:0 0 30px 0;
     }
     #msg-box .nav{
     margin-top:20pxl
     }
 </style>
</head>
<body>
       <div>              
         <form name="viewForm" id="form_swf" action="documentView.jsp" method="POST">
               <input type="submit" value="预览" class="BUTTON SUBMIT"/>
         </form>
       </div>
 </body>
</html>