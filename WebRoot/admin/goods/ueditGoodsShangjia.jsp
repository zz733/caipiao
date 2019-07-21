<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="${pageContext.request.contextPath }/admin/favicon.ico" >
<link rel="Shortcut Icon" href="${pageContext.request.contextPath }/admin/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link href="${pageContext.request.contextPath}/admin/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/admin/js/jquery-3.2.1.js"></script>

<style>
#showimage {
	margin-top: 40px;
	height: 20%;
	padding-bottom: 20px;
}

.defaultimage,.fimage {
	margin-left: 1%;
	float: left;
	height: 100px;
	width: 100px;
	line-height: 100px;
	text-align: center;
	cursor: pointer;
	background: #f2f2f2;
	border: 1px solid #c1c1c1;
}

.defaultimage img,.fimage img {
	height: 100px;
	width: 100px;
	
}
</style>
</head>
<body>
<div class="page-container" >
	<c:forEach items="${list}" var="m">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1"><span class="c-red">*</span>商品编号:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${m.gid }" placeholder="" id="gId" name="gId" readonly="readonly" style="width:60%">
			</div>
				<input type="hidden" value="${m.gstatus }" id="gstatus">
		</div><br>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1">商品名称:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${m.gname }" placeholder="" id="goodname" name="goodname" style="width:60%">
			</div>
		</div><br>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1">商品价格:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="goodprice" id="goodprice" placeholder="" value="${m.gprice }" class="input-text" style="width:20%">
				福贝</div>
		</div>
		<br>
		
		<!-- 视频 -->
		<!-- 商品的类型 -->
		<c:if test="${m.gtype!=null }">
		<div class="row cl">
			<label
				class="form-label col-xs-6 col-sm-1 col-xs-offset-6 col-sm-offset-1"
				style="width: 9%"> <span class="c-red">*</span>商品类型:
			</label>
			<div class="formControls col-xs-4 col-sm-4">
				<span class="select-box" style="width: 60%"> 
				<select class="select" name="goodtype" id="goodtype">
				<c:if test="${m.gtype=='' }">
				<option value="" selected="selected">请选择</option>
				</c:if>
				
				<c:if test="${m.gtype!='' }">
				<c:if test="${m.gtype=='video' }">
				<option value="video" selected="selected">视频</option>
				</c:if>
				<c:if test="${m.gtype!='video' }">
				<option value="video">视频</option>
				</c:if>
				
				<c:if test="${m.gtype=='qita' }">
				<option value="qita" selected="selected">其它</option>
				</c:if>
				<c:if test="${m.gtype!='qita' }">
				<option value="qita">其它</option>
				</c:if>
				</c:if>	
								
				</select>
				</span> 
				<c:if test="${m.videos!=null }">
				<span class="btn-upload">
				  <a href="javascript:void();" class="btn btn-primary radius btn-upload">
				  <i class="Hui-iconfont"> &#xe642;</i> 
				  浏览文件
				  </a>
				  <input type="file" multiple id="videoFile" value=""${m.videos } name="goodvideo" class="input-file" onchange="change()">
				</span>
				</c:if>
			</div>
		</div>
		<br>
		</c:if>
		
		<div class="row cl">
			<label
				class="form-label col-xs-5 col-sm-1 col-xs-offset-5 col-sm-offset-1"
				style="width: 9%">
				<span class="c-red">*</span>库存:
			</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" name="kuchun" id="kuchun" placeholder="0"
					value="${m.kuchun }" class="input-text" style="width: 60%">
			</div>
		</div>
		<br/>
		<div class="row cl">
			<label
				class="form-label col-xs-5 col-sm-1 col-xs-offset-5 col-sm-offset-1"
				style="width: 9%">
				<span class="c-red">*</span>销量:
			</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" name="leijixiaoshou" id="leijixiaoshou" placeholder="0"
					value="${m.leijixiaoshou }" class="input-text" style="width: 60%">
			</div>
		</div>
		
		<br />
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1">商品详情:</label>
			<div class="formControls col-xs-8 col-sm-9">
				<script id="editor" name="gooddetail" type="text/plain" style="width:100%;height:400px;">${m.gdetail}</script>
			</div>
		</div><br>
				<div class="row cl">
					<label class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1" style="width:">
						<span class="c-red">*</span>默认图片：
					</label>
					<div class="formControls col-xs-8 col-sm-9">
						<div index=0 class="fimage">
						        <img id="img1" alt="请选择图片" src="${m.gimages }">
						</div>
					</div>
				</div><br><br>
			<div class="row cl">
					<label class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1">
						<span class="c-red">*</span>其它图片：
					</label>
					<div class="formControls col-xs-8 col-sm-9">
						<div index="1" class="fimage">
						         <img alt="请选择图片" id="img2" src="${m.gimages2 }">
						</div>
						<div index="2" class="fimage">
						         <img alt="请选择图片" id="img3" src="${m.gimages3 }">
						</div>
						<div index="3" class="fimage">
						         <img alt="请选择图片" id="img4" src="${m.gimages4 }">
						</div>
						<div index="4" class="fimage">
						         <img alt="请选择图片" id="img5" src="${m.gimages5 }">
						</div>
					</div>
				</div><span></span>
				<div class="row cl" style="display: none">
				<div class="formControls col-10">
					<div class="uploader-thum-container">
						<div id="fileList" class="uploader-list"></div>
						<div class="filePicker">选择图片</div>
						<button id="btn-star"
							class="btn btn-default btn-uploadstar radius ml-10">
							开始上传</button>
					</div>
				</div>
			</div>
			<div class="row cl" style="display: none">
				<div class="formControls col-10">
					<div class="uploader-thum-container">
						<div id="fileList" class="uploader-list"></div>
						<div class="default">默认图片</div>
						<button id="btn-star"
							class="btn btn-default btn-uploadstar radius ml-10">
							开始上传</button>
					</div>
				</div>
			</div>
		<div class="row cl" >
			<div class="col-xs-8 col-sm-9 col-xs-offset-6 col-sm-offset-9">
				<button id="AddBtn" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe632;</i> 修改商品</button>
				<a  href="javascript:history.go(-1)"><button class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button></a>
			</div>
		</div>
	</c:forEach>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript">
var index;
var jsonstr="[]";
var jsonarray = eval("("+jsonstr+")");
$(function(){
	var ue = UE.getEditor("editor", {
		autoHeightEnabled : false,
		scaleEnabled:false,
	});
	
	$("#AddBtn").click(function(){
		var imagelist = JSON.stringify(jsonarray);
		var goodname = $("#goodname").val();
		var goodprice = $("#goodprice").val();
		var goodstatus = $("#gstatus").val();
		var gId = $("#gId").val();
		var gstatus = $("#gstatus").val();
		//var gooddetail = $("#editor").html();
		//gooddetail = encodeURIComponent(editor);
		//var gooddetail=(encodeURIComponent(ue.getContent()));
		var gooddetail = encodeURIComponent(ue.getContent()); //UE.getEditor("editor").getContent();
		var num = /^[0-9]+(.[0-9]{1,2})?$/;
		if(goodname==null || ""==goodname){
			layer.msg("请输入商品名称!",{icon:6,time:1000});
			return false;
		}
		if(goodprice==null || ""==goodprice){
			layer.msg("请输入商品价格!",{icon:6,time:1000});
			return false;
		}
		if(!num.test(goodprice)){
			layer.msg("商品价格格式有误",{icon:6,time:1000});
			$("#goodprice").val("");
			return false;
		}
		if(gooddetail==null || ""==gooddetail){
			layer.msg("请输入商品详情!",{icon:6,time:1000});
			return false;
		}
		if(imagelist==null){
			layer.msg("请上传默认商品图片!",{icon:6,time:1000});
			return false;
		}
		
		var leijixiaoshou = $("#leijixiaoshou").val();
		var kuchun = $("#kuchun").val();
		
		layer.confirm("修改商品?",function(index){
			//&goodname="+goodname+"&goodprice="+goodprice+"&gooddetail="+gooddetail+"&file="+image
			$.ajax({
				url:"${pageContext.request.contextPath}/goods.do?p=updateGoods",
				data:"&goodname="+goodname+"&gPrice="+goodprice+"&gDetail="+gooddetail+"&gId="+gId+"&gstatus="+gstatus+"&files="+imagelist.toString()+"&kuchun="+kuchun+"&leijixiaoshou="+leijixiaoshou,
				type:"post",
				success: function(data,status){
					layer.msg("修改商品成功!",{icon:6,time:2000});
					setTimeout('layer_close();',1500);
					self.location=document.referrer;
				},
				error:function(data,status,e){
					alert(e);
				}
			});
		});
	});
	
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });

});

function getRootPath() {
			//http://localhost:8083/uimcardprj/share/meun.jsp
			var curWwwPath = window.document.location.href;
			//uimcardprj/share/meun.jsp
			var pathName = window.document.location.pathname;
			var pos = curWwwPath.indexOf(pathName);
			//http://localhost:8083
			var localhostPaht = curWwwPath.substring(0, pos);
			// uimcardprj
			var projectName = pathName.substring(0, pathName.substr(1).indexOf(
					'/') + 1);
			if (projectName == "/admin")
				projectName = "";

			return (localhostPaht + projectName);
		}

		//------------------------------------------------------------------------------

		var image1 = null;
			$list = $("#fileList"),
			$btn = $("#btn-star"),
			thumbnailWidth = 100;   //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算
		   	thumbnailHeight = 100;  
			state = "pending",
			uploader;

		var uploader = WebUploader
				.create({
					auto : true,
					swf : '${pageContext.request.contextPath }/lib/webuploader/0.1.5/Uploader.swf',

					// 文件接收服务端。
					server : '${pageContext.request.contextPath }/upload.do',

					// 选择文件的按钮。可选。
					// 内部根据当前运行是创建，可能是input元素，也可能是flash.
					pick : '.filePicker',
					fileNumLimit : 15,
					//设置可以重复上传
					duplicate : true,
					// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
					resize : false,
					// 只允许选择图片文件。
					accept : {
						title : 'Images',
						extensions : 'gif,jpg,jpeg,bmp,png',
						mimeTypes : 'image/*'
					}
				});
		uploader.on('fileQueued', function(file) {
			var $li = $('<div id="' + file.id + '" class="item">'
					+ '<div class="pic-box"><img></div>' + '<div class="info">'
					+ file.name + '</div>' + '<p class="state">等待上传...</p>'
					+ '</div>'), $img = $li.find('img');
			$list.append($li);
			// 创建缩略图
			// 如果为非图片文件，可以不用调用此方法。
			// thumbnailWidth x thumbnailHeight 为 100 x 100
			uploader.makeThumb(file, function(error, src) {
				if (error) {
					$img.replaceWith('<span>不能预览</span>');
					return;
				}

				$img.attr('src', src);

			}, thumbnailWidth, thumbnailHeight);
		});
		// 文件上传过程中创建进度条实时显示。
		uploader
				.on(
						'uploadProgress',
						function(file, percentage) {
							var $li = $('#' + file.id), $percent = $li
									.find('.progress-box .sr-only');

							// 避免重复创建
							if (!$percent.length) {
								$percent = $(
										'<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>')
										.appendTo($li).find('.sr-only');
							}
							$li.find(".state").text("上传中");
							$percent.css('width', percentage * 100 + '%');
						});

		// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		uploader.on('uploadSuccess', function(file, response) {

			image1 = response._raw;
			$("#current").find("img").attr("src",
					"${pageContext.request.contextPath}/temp/" + image1);
			$("#current").find("img").css({
				"height" : "100%",
				"width" : "100%",
				"margin-top" : "0px"
			});

			var panduan = 1;
			$.each(jsonarray, function(n, value) {
				if (value.id == index) {
					panduan = 2;
					jsonarray[n].image = response._raw.trim();
				}
			});
			if (panduan == 1) {
				var jsonimage = {
					"id" : index,
					"image" : response._raw.trim()
				}
				jsonarray.push(jsonimage);
			}

			$('#' + file.id).addClass('upload-state-success').find(".state")
					.text("已上传");
		});

		// 文件上传失败，显示上传出错。
		uploader.on('uploadError', function(file) {
			$('#' + file.id).addClass('upload-state-error').find(".state")
					.text("上传出错");
		});

		// 完成上传完了，成功或者失败，先删除进度条。
		uploader.on('uploadComplete', function(file) {
			$('#' + file.id).find('.progress-box').fadeOut();
		});
		uploader.on('all', function(type) {
			if (type === 'startUpload') {
				state = 'uploading';
			} else if (type === 'stopUpload') {
				state = 'paused';
			} else if (type === 'uploadFinished') {
				state = 'done';
			}

			if (state === 'uploading') {
				$btn.text('暂停上传');
			} else {
				$btn.text('开始上传');
			}
		});

		$btn.on('click', function() {
			if (state === 'uploading') {
				uploader.stop();
			} else {
				uploader.upload();
			}
		});
		

		$btn.on('click', function() {
			if (state === 'uploading') {
				uploader.stop();
			} else {
				uploader.upload();
			}
		});

		$(function() {

			$(".fimage").bind("click", function() {

				index = $(this).attr("index");
				$("#current").attr("id", "");
				$(this).attr("id", "current");
				$(".filePicker").find("input").click();

			});
			$(".defaultimage").bind("click", function() {
				index = $(this).attr("index");
				$("#current").attr("id", "");
				$(this).attr("id", "current");
				$(".default").find("input").click();
			});
		});
</script>
