<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark"
	href="${pageContext.request.contextPath }/admin/favicon.ico">
<link rel="Shortcut Icon"
	href="${pageContext.request.contextPath }/admin/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/admin/static/h-ui.admin/css/style.css" />
<link href="${pageContext.request.contextPath }/upload/stream-v1.css"
	rel="stylesheet" type="text/css">
<!-- 
<link href="${pageContext.request.contextPath }/upload/stream-v1.css"
	rel="stylesheet" type="text/css">
 -->
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link
	href="${pageContext.request.contextPath}/admin/lib/webuploader/0.1.5/webuploader.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/admin/js/jquery-3.2.1.js"></script>
<!--
<script
	src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/admin/js/angular1.6.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
 -->

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
<body ng-app="myapp" ng-controller="myctrl">
	<div class="page-container">
		<div class="row cl">
			<label
				class="form-label col-xs-6 col-sm-1 col-xs-offset-6 col-sm-offset-1"
				style="width: 9%"> <span class="c-red">*</span>商品名称:
			</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" class="input-text" value="" placeholder=""
					id="goodname" name="goodname">
			</div>
		</div>
		<br>
		<div class="row cl">
			<label
				class="form-label col-xs-5 col-sm-1 col-xs-offset-5 col-sm-offset-1"
				style="width: 9%"> <span class="c-red">*</span>商品价格:
			</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" name="goodprice" id="goodprice" placeholder=""
					value="" class="input-text" style="width: 60%"> 福贝
			</div>
		</div>
		<br />
		<div class="row cl">
			<label
				class="form-label col-xs-5 col-sm-1 col-xs-offset-5 col-sm-offset-1"
				style="width: 9%"> <span class="c-red">*</span>销量:
			</label>
			<div class="formControls col-xs-4 col-sm-4">
				<input type="text" name="leijixiaoshou" id="leijixiaoshou"
					placeholder="0" value="" class="input-text" style="width: 60%">
			</div>
		</div>

		<br>
		<div class="row cl">
			<label
				class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1"
				style="width: 9%"> <span class="c-red">*</span>商品详情:
			</label>
			<div class="formControls col-xs-8 col-sm-9">
				<script id="editor" name="gooddetail" type="text/plain"
					style="width:100%;height:400px;"></script>
			</div>
		</div>
		<br> <br>
		<div class="row cl">
			<label
				class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1"
				style="width: 10%"> <span class="c-red">*</span>默认图片：
			</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div index=0 class="fimage">
					<img src="${pageContext.request.contextPath }/images/timg.jpg">
				</div>
			</div>
		</div>
		<br>
		<div class="row cl">
			<label
				class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1"
				style="width: 10%"> <span class="c-red">*</span>商品图片：
			</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div index="1" class="fimage">
					<img src="${pageContext.request.contextPath }/images/timg.jpg">
				</div>
				<div index="2" class="fimage">
					<img src="${pageContext.request.contextPath }/images/timg.jpg">
				</div>
				<div index="3" class="fimage">
					<img src="${pageContext.request.contextPath }/images/timg.jpg">
				</div>
				<div index="4" class="fimage">
					<img src="${pageContext.request.contextPath }/images/timg.jpg">
				</div>
			</div>
		</div>
		<br>
		<div class="row cl">
			<label
				class="form-label col-xs-4 col-sm-1 col-xs-offset-4 col-sm-offset-1"
				style="width: 10%"> <span class="c-red">*</span>上传视频：
			</label>

			<div id="i_select_files" class="formControls col-xs-8 col-sm-9" index=0>
				<div id="i_stream_files_queue" style="border:1px solid lightgrey;height:70px;"></div>
				<button style="margin-top:5px;margin-bottom:5px" class="btn btn-primary radius" onclick="javascript:_t.upload();">开始上传</button>
			</div>
			
		</div>
	</div>
	<br>

	<div class="row cl" style="display: none">
		<div class="formControls col-10">
			<div class="uploader-thum-container">
				<div id="fileList" class="uploader-list"></div>
				<div class="filePicker">选择图片</div>
				<button id="btn-star"
					class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>
			</div>
		</div>
	</div>

	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-6 col-sm-offset-9">
			<button id="AddBtn" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe632;</i> 添加商品
			</button>
			<a href="javascript:history.go(-1)"><button onclick=""
					class="btn btn-default radius" type="button">
					&nbsp;&nbsp;取消&nbsp;&nbsp;</button> </a>
		</div>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath }/upload/stream-v1.js"></script>
	<script type="text/javascript">
		/**
		onQueueComplete
		 * 配置文件（如果没有默认字样，说明默认值就是注释下的值）
		 * 但是，on*（onSelect， onMaxSizeExceed...）等函数的默认行为
		 * 是在ID为i_stream_message_container的页面元素中写日志
		 */
		var config = {
			multipleFiles : false
		/** 多个文件一起上传, 默认: false */
		};
		var _t = new Stream(config);
		var upload_success_message;
	</script>





	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/ueditor.all.min.js">
		
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/admin/js/ajaxfileupload.js"></script>
	<script type="text/javascript">
		var index;
		var jsonstr = "[]";
		var jsonarray = eval("(" + jsonstr + ")");
		$(function() {
			var ue = UE.getEditor("editor", {
				autoHeightEnabled : false,
				scaleEnabled : false,
			});

			//添加商品的按钮
			$("#AddBtn")
					.click(
							function() {
								var imagelist = JSON.stringify(jsonarray);
								var goodname = $("#goodname").val();
								var goodprice = $("#goodprice").val();
								var gooddetail = encodeURIComponent(ue
										.getContent());//encodeURIComponent(ue.getContent());// UE.getEditor("editor").getContent();

								var num = /^[0-9]+(.[0-9]{1,2})?$/;
								if(upload_success_message=="null" || upload_success_message=="" || upload_success_message=="undefined"){
									layer.msg("请等待视频上传完毕!", {
										icon : 6,
										time : 1000
									});
									return false;
								}
								
								if (goodname == null || "" == goodname) {
									layer.msg("请输入商品名!", {
										icon : 6,
										time : 1000
									});
									return false;
								}
								if (goodprice == null || "" == goodprice) {
									layer.msg("请输入商品价格!", {
										icon : 6,
										time : 1000
									});
									return false;
								}
								if (!num.test(goodprice)) {
									layer.msg("商品价格格式有误", {
										icon : 6,
										time : 1000
									});
									$("#goodprice").val("");
									return false;
								}
								if (gooddetail == null || "" == gooddetail) {
									layer.msg("请输入商品详情!", {
										icon : 6,
										time : 1000
									});
									return false;
								}
								if (!image1) {
									layer.msg("请至少添加商品默认图片!", {
										icon : 6,
										time : 1000
									});
									return false;
								}

								var leijixiaoshou = $("#leijixiaoshou").val();
								var kuchun = $("#kuchun").val();
								layer
										.confirm(
												"添加商品?",
												function(index) {
													var video=JSON.parse(upload_success_message);
													$.ajax({
																url : "${pageContext.request.contextPath}/goods.do?p=addVideoGoods",
																data : "&goodname="
																		+ goodname
																		+ "&goodprice="
																		+ goodprice
																		+ "&gooddetail="
																		+ gooddetail
																		+ "&files="
																		+ imagelist.toString()
																		+ "&kuchun="
																		+ kuchun
																		+ "&leijixiaoshou="
																		+ leijixiaoshou
																		+"&gvsrc="
																		+video.gVSrc
																		+"&gduration="
																		+video.gDuration,
																type : "post",
																success : function(
																		data,
																		status) {
																	layer.msg(
																					"添加商品成功!",
																					{
																						icon : 6,
																						time : 2000
																					});
																	location
																			.replace(location.href);
																},
																error : function(
																		data,
																		status,
																		e) {
																	alert(e);
																}
															});
												});
							});
		});
		//检查图片的格式是否正确,同时实现预览
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
		$list = $("#fileList"), $btn = $("#btn-star"), thumbnailWidth = 100; //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算
		thumbnailHeight = 100;
		state = "pending", uploader;

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
					duplicate : false,
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
			goodvideoname = response._raw;
			console.log("得到上传后的文件名称：" + response._raw);

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