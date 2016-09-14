<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String swfFilePath=session.getAttribute("swfpath").toString();
   System.out.println("展示路径"+swfFilePath);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta content="text/html;charset=UTF-8" http-equiv="Content-Type">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/flexpaper_flash.js"></script>
<script type="text/javascript" src="js/flexpaper_flash_debug.js"></script>
<!--  <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
<script type="text/javascript" src="js/flexpaper.js"></script>
<script type="text/javascript" src="js/flexpaper_handlers.js"></script>-->
<style type="text/css" media="screen">
html,body{
        height: 100%;
}
body{
        margin: 0;
        padding: 0;
        overflow: auto;
}
#flashContent{
       display: none;
}
</style>
<title>在线文档预览</title>
</head>
<body>
   <div style="position: absolute; left:50px;top:10px;">
        <a id="viewerPlaceHolder" style="width: 820px;height: 650px;display: block;"></a>
          <script type="text/javascript">
            //upload/bbbbbbbbb1.swf escape('<%=swfFilePath%>')
           // var strPath='upload/';
          //  var totalPages = 15;
           // var name = 'bbbbbbbbb';
           var fp=new FlexPaperViewer('FlexPaperViewer','viewerPlaceHolder',{config:{SwfFile:escape('<%=swfFilePath%>'),Scale:1.2,
            ZoomTransition:'easeOut',ZoomTime:0.5,ZoomInterval:0.2,FitPageOnLoad:false,FitWidthOnload:false,
            FullScreenAsMaxWindow:false,ProgressiveLoading:false,MinZoomSize:0.2,MaxZoomSize:5,SearchMatchAll:false,
            InitViewMode:'SinglePage',RenderingOrder : 'flash',ViewModeToolsVisible:true,ZoomToolsVisible:true,NavToolsVisible:true,CursorToolsVisible:true,
            SearchToolsVisible:true,localeChain:'en_US'}});
          /*  $("#viewerPlaceHolder").FlexPaperViewer({
	config : {
		//SWFFile :basePath+swfPath + "{" + name +"[*,0].swf,"+ totalPages +"}",
		SWFFile :strPath + "{" + name +"[*,0].swf,"+ totalPages +"}?totalPages="+totalPages,
        Scale : 0.6,   c
        ZoomTransition : 'easeOut',  
        ZoomTime : 0.5,  
        ZoomInterval : 0.2,  c
        FitPageOnLoad : true,  
        FitWidthOnLoad : true,  
        PrintEnabled : true,  
        FullScreenAsMaxWindow : false,  
        ProgressiveLoading : false,  
        MinZoomSize : 0.2,  
        MaxZoomSize : 2,  
        SearchMatchAll : false,  
        InitViewMode : 'Portrait',
        RenderingOrder : 'flash,html',  
               c
        ViewModeToolsVisible : true,  
        ZoomToolsVisible : true,  
        NavToolsVisible : true,  
        CursorToolsVisible : true,  
        SearchToolsVisible : true,
        localeChain: 'zh_CN'  
	}
});*/
          </script>
   </div>
</body>
</html>