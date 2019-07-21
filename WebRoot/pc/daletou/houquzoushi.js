getTableData();

var table_canvas;
isInitOk = false;
y_head = -1;
//尾号走势画线
$("#zhexian").click(function() {
	if (!isInitOk) { //没有初始化
		drawLqzs();
	} else {//已初始化
		$("svg").remove(); //直接移除控件
		isInitOk = false;
	}
});

function paddingData(tableData) {
	var $table = $("#lqzsTu");
	for (var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>");
		$tr.css("background-color", "#EAEEEE"); // 底色 #F7F0F0
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		// 期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[0]);
		$tr.append($td);
		// 蓝球号码
		for (var j = 1; j < 13; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[1])) {
				$td.text("  ");
				if(j!=parseInt(tdArr[2])){
					$td.text("  ");
				}else{
					$td = $("<td></td>");
					$td.css("color", "#FFFFFF"); // 字体颜色
					$td.text(tdArr[2]);
					$td.css("background-color", "#3370B0"); // 球的背景颜色
				}
			}
			else {
				$td = $("<td></td>")/*.toggleClass("box_qiu")*/;
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[1]);
				$td.css("background-color", "#3370B0"); // 球的背景颜色
			}
			$tr.append($td);
		}
		// 空一列
		for (var j = 0; j < 1; j++) { // 列数
			var $td = $("<td></td>");
			$td.text(" ");
			$td.css("background-color", "#FFFFFF"); // 球的背景颜色
			$tr.append($td);
		}
		// 0-9
		for (var j = 0; j < 10; j++) { // 列数
			var trArr = tableData[i];
			var tdArr = trArr[i];
			var $td = $("<td></td>").toggleClass("box_qiu2");
			if (j != parseInt(tdArr[3])) {
				$td.text("  ");
			} else{
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[3]);
				$td.css("background-color", "#FF6666");
				$td.addClass("zhexian");	
			}
			$tr.append($td);
		}
		$table.append($tr);
		
	}
	drawLqzs();
	/*模拟选号*/
	for(var i=0;i<1;i++){
		var $tr = $("<tr></tr>");
		$tr.css("background-color", "#EAEEEE"); // 底色 #F7F0F0
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text("模拟选号");
		$tr.append($td);
		for (var j = 1; j < 13; j++) { // 列数
			var $td = $("<td></td>").toggleClass("one").css("color","#EAEEEE");
			$td.text(j)
			$tr.append($td);
		}
	}
	$table.append($tr);
	/*模拟选号下两行*/
	for(var i=0;i<1;i++){
		var $tr = $("<tr></tr>");
		$tr.css("background-color", "#EAEEEE"); // 底色 #F7F0F0
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text("");
		$tr.append($td);
		for (var j = 1; j < 13; j++) { // 列数
			var $td = $("<td></td>");
			$tr.append($td);
		}
	}
	$table.append($tr);
	for(var i=0;i<1;i++){
		var $tr = $("<tr></tr>");
		$tr.css("background-color", "#EAEEEE"); // 底色 #F7F0F0
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text("");
		$tr.append($td);
		for (var j = 1; j < 13; j++) { // 列数
			var $td = $("<td></td>");
			$tr.append($td);
		}
	}
	$table.append($tr);
}
$(document).on("click",".one",function(){
	$(this).toggleClass("active");
})
//得到工程路径
function getRootPath() {
	//http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	//uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	if (projectName == "/pc" || projectName == "/admin"
			|| projectName == "/weixin")
		projectName = "";

	return (localhostPaht + projectName);
}



// 获取数据
function getTableData() {
	var tableData = [];
	$.ajax(getRootPath() + "/daletou.do?p=get3d4", {
		type : 'post',
		timeout : 10000,
		dataType : 'json',
		success : function(data) {
			var trArr = [];
			for (var i = 0; i < data.length; i++) {
				var tdArr = [];
				tdArr[0] = data[i][0]; //期号
				tdArr[1] = data[i][1]; //蓝球数组
				tdArr[2] = data[i][2];
				tdArr[3] = (data[i][1]*1+data[i][2]*1)%10;
				trArr.push(tdArr);
				tableData.push(trArr);
			}
			paddingData(tableData);
		},
		error : function(xhr, type, errorThrown) {
			//异常处理；
			alert("您好，请检查一下您的网络是否异常！");
		}

	});
	return tableData;
}
function drawLqzs() {
	table_canvas = new draw2d.Canvas("lqzsTu");
	isInitOk = true;

	// 得到圆的圆点X+圆点Y+圆半径 并画图
	table_canvas = new draw2d.Canvas("lqzsTu");// if(!table_canvas)
	$("svg").css("top", "75px");
	$("svg").css("left", "0px");// 由于自带样式中绝对定位有偏移
	$("svg").css("width", "80%");
	var tableHeight = $("#lqzsTu")[0].offsetHeight-40;
	
	$("svg").css("height", tableHeight);
	var lastPoints = new Array();
	var linePositons = new Array();
	var lastAngles = new Array();
	$(".zhexian").each(
			function(index, ele) {
				var ceilWidth = $(this).width() / 2;
				var ceilHeight = $(this).height() / 2;
				var X = $(this).position().left + ceilWidth;
				var Y = $(this).position().top + ceilHeight;
				if (y_head == -1) {
					y_head = $(this).position().top;
					Y = Y - y_head;
				} else {
					Y = Y - y_head;
				}
				var lastPoint = lastPoints[index - 1];
				if (lastPoint) {
					var lastPointArr = lastPoint.split("-");
					var preX = parseFloat(lastPointArr[0]);
					var preY = parseFloat(lastPointArr[1]);
					var lineX = X;
					var lineY = Y;
					var angle = (X - preX) / (Y - preY);
					var lastAngle = lastAngles[index - 1];
					lastAngles[index] = angle;
					if (angle == 0) {
						preY = preY + ceilHeight;
						lineY -= ceilHeight;
					} else if (angle > 0) {// 顺梯
						if (Math.abs(lineX - preX) < (ceilWidth * 3)) {// 角对角
							lineY = lineY - ceilHeight;
							preX = preX + ceilWidth;
						} else {// 分离
							preX += ceilWidth;
							lineX -= ceilWidth;
						}
					} else if (angle < 0) {// 逆梯
						if (Math.abs(lineX - preX) < (ceilWidth * 3)) {// 角对角
							lineY -= ceilHeight;
							preX -= ceilWidth;
						} else {// 分离
							preX -= ceilWidth;
							lineX += ceilWidth;
						}
					}
					// alert(preX+"--"+preY+"--"+lineX+"--"+lineY);
					table_canvas.addFigure(new draw2d.shape.basic.Line(preX,
							preY, lineX, lineY, null));
				}
				lastPoints[index] = X + "-" + Y;
			})
};

$(window).resize(function() {
	if (isInitOk) {
		//先删除历史
		//$("svg").remove(); //直接移除控件
		//重写测画
		//drawLqzs();
	}
});

//隐藏和显示期数
$("#yincang").click(function() {
	var yincangF = $("#yincang");
	var yincangS = $(".tdIssue");

	if (yincangF.css("display") === "none") {
		yincangF.show();
		yincangS.show();
	} else {
		yincangF.hide();
		yincangS.hide();
	}
});

function show(a) {
	var song = document.querySelectorAll(".song");
	for (var i = 0; i < song.length; i++) {
		if (i == a) {
			song[i].style.display = "block";
		} else {
			song[i].style.display = "none";
		}
	}
}

var ctcount = 3;

function changct(cti) {
	for (i = 1; i <= ctcount; i++) {
		ct = document.getElementById("ctab" + i);
		cc = document.getElementById("ccontent" + i);
		if (i == cti) {
			ct.className = "active";
			cc.className = "activecontent";
		} else {
			ct.className = "";
			cc.className = "hiddencontent";
		}
	}
}
/************模拟选号**********/

$(document)
		.ready(
				function() {
					function choose() {
						$(this).toggleClass("active");
						var $ul = $(this).parent();
//						var max = $ul.children(".active").length; // 选中的数量
//						if (max > 1) {
//							$(this).removeClass("active");
//							layer.msg('最多只能选择1个');
//							return; // 增加return，阻止代码继续执行
//						}
						var text = $(this).text(); // 选中的文本
						var index = mnxh.indexOf(text); // 选中的文本的下标

						if (chooseIndexs.indexOf(index) > -1) {
							chooseIndexs.splice(chooseIndexs.indexOf(index), 1);
						} else {
							chooseIndexs.push(index);
						}

						var cstr = $ul.children(".active").text();
						if ($(this).hasClass("active")) {
							$(".myselt").val(cstr);
						} else {
							$(".myselt").val(cstr);
							;
						}
					}
					//模拟选号

					var mnxh = [ "1", "2", "3", "4", "5", "6", "7",
							"8", "9", "10", "11", "12"];
					var chooseIndexs = []; // 选中的下标

					function render() {
						var str = "";
						for (var i = 0; i < mnxh.length; i++) {
							var idValue = "mnxhqh_" + mnxh[i];
							var active = chooseIndexs.indexOf(i) > -1;
							str = str + "<li class=" + (active ? "active" : "")
									+ ">" + mnxh[i] + "</li>";
						}
						$(".wrap #ul").html(str);
					}
					function move(direction) {
						var isLeft = direction < 0; // 向左移动
						return function() {
							for (var i = 0; i < chooseIndexs.length; i++) {
								var value = chooseIndexs[i]
								if (isLeft) {

									if (value === 0) {
										chooseIndexs.splice(i, 1,
												mnxh.length - 1)
									} else {
										chooseIndexs.splice(i, 1, value - 1)
									}

								} else {
									if (value === mnxh.length - 1) {
										chooseIndexs.splice(i, 1, 0)
									} else {
										chooseIndexs.splice(i, 1, value + 1)
									}
								}
							}
							render();
						}
					}

					//模拟选号下的行
					var table_td = "";
					for (var b = 0; b < 12; b++) {
						table_td = table_td
								+ "<li style = 'background:#EAEEEE;margin-left:1px'></li>";
					}
					$(".ul1").html(table_td);

					$(".wrap").on("click", "li", choose);
					$('.right').on('click', move(1));
					$('.left').on('click', move(-1));

					render();

					$(".qingkong").click(function() {
						//$(".active").toggleClass("active");
						chooseIndexs.length = 0;
						$(".active").removeClass("active");
					});
				});
$(".right").click(function() {
	var $tdindex1 = $(".active");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one").removeClass("active");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==12){
			$(".one").eq(0).addClass("active");
		}
		else{  
			$(".one").eq(act1*1).toggleClass("active");
		}
	}
	
})
$(".left").click(function() {
	var $tdindex1 = $(".active");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one").removeClass("active");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==0){
			$(".one").eq(11).addClass("active");
		}
		else{  
			$(".one").eq(act1*1-2).toggleClass("active");
		}
	}
})

$(function(){
	for(var i=0;i<2;i++){
		$(".btnul").append("<li class=numli"+i+" disabled>"+[i]+"</li>");	//在ul标签上动态添加li标签
		$(".numli").css("border-radius",'2px');	
		$(".numli"+i).attr("class",'btnnum btn');
	}
	for(var i=1;i<12;i++){
		$(".btnul2").append("<li class=btnnum2"+i+">"+[i]+"</li>");
		$(".btnnum2").css("border-radius",'2px');	
		$(".btnnum2"+i).attr("class",'three btn btn-primary');
	}
	})

$(function(){
	if($(".btnul li:eq(0)").text()==1){
		   $(".left2").addClass("disabled");
	  }
		arry = go2(1);
		index = 0;
		$(".btnul li:eq(0)").text(arry[index][0]);
		$(".btnul li:eq(1)").text(arry[index][1]);
		showVIP(arry[index],2);
		$(".right2").unbind("click");
		$(".left2").unbind("click");
		$(".btnul2 li:eq(0)").show();
		$(".btnul li:eq(2)").remove();
		$(function(){
			var three=document.querySelectorAll(".three");
			for(var i=0;i<three.length;i++){
			(function(m){   
				   $(".three").eq(m).unbind("click");
				   $(".right2").unbind("click");
					$(".left2").unbind("click");
			       $(".three").eq(m).click(function(){
			    	   index = 0;
			    	   arry = go2(m+1);
			    			$(".btnul li:eq(0)").text(arry[index][0]);
			    			$(".btnul li:eq(1)").text(arry[index][1]);
			    			showVIP(arry[index],2);
			    	   if($(".btnul li:eq(0)").text()==1){
			    		   $(".left2").addClass("disabled");
			    	   }else{
			    		   $(".left2").removeClass("disabled");
			    		}
			    	   if(index>=arry.length-1){
		   				   $(".right2").addClass("disabled");
		   			   }else{
		   				$(".right2").removeClass("disabled");
		   			   }
			      }); 
			   })(i);
			}
		})
})
$(document).on("click",".right2",function(){
			index++;
	    	   $(".btnul li:eq(0)").text(arry[index][0]);
			   $(".btnul li:eq(1)").text(arry[index][1]);
			   showVIP(arry[index],2);
			   $(".left2").removeClass("disabled");
			   if(index>=arry.length-1){
				   $(".right2").addClass("disabled");
			   }else{
				   $(".right2").removeClass("disabled");
			   }
	      }); 
$(document).on("click",".left2",function(){
	    	   index--;
	    	   $(".btnul li:eq(0)").text(arry[index][0]);
			   $(".btnul li:eq(1)").text(arry[index][1]);
			   showVIP(arry[index],2);
			   $(".right2").removeClass("disabled");
			  if(index==0){
				  $(".left2").addClass("disabled");
			  }else{
				  $(".left2").removeClass("disabled");
			  }
	      });

/*选择组三*/
 /**2位数 [ [0,1],[1,]*/
function go2(m)
      {
             var arry = [];
			for (var min=1; min<=12-m;min++)
			{
				var arr2 = [];
				arr2.push(min);
				arr2.push(min+m);
				arry.push(arr2);
			 }
         return arry;
     }
function showVIP(param,n)
{         
	console.log(param)
	
	$(".one").removeClass("active");//原来选中的红色格子
	for(var i=0;i<12;i++){//param[i]该值为0-9,即说明可以从0移动到9位
		console.log("11165165:"+param[i])
		$(".one:eq("+param[i]+")").addClass("active");
		}
}

