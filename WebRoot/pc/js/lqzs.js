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
		for (var j = 1; j < 17; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[1])) {
				$td.text("  ");
			} else {
				$td = $("<td></td>").toggleClass("box_qiu");
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[1]);
				$td.css("background-color", "#3370B0"); // 球的背景颜色
			}
			$tr.append($td);
		}

		// 空两格
		for (var j = 0; j < 1; j++) { // 列数
			var $td = $("<td></td>");
			$td.text("  ");
			$td.css("background-color", "#FFFFFF"); // 球的背景颜色
			$tr.append($td);
		}

		// 大小
		for (var j = 1; j < 3; j++) { // 列数
			var $td = $("<td></td>");
			if (!((parseInt(tdArr[1]) / 8) > (j - 1) && parseInt(tdArr[1]) / 8 <= (j))) {
				// $td.css("color","#fff"); //字体颜色
				// $td.css("background-color","#99CC99"); //球的背景颜色
				$td = $("<td></td>").toggleClass("box_dx");
				if (j == 1)
					$td.text("大");
				else {
					$td.text("小");
				}

			}
			$tr.append($td);
		}
		// 奇偶
		for (var j = 1; j < 3; j++) { // 列数
			var $td = $("<td></td>");
			if (!(parseInt(tdArr[1]) % 2 == j - 1)) {
				$td = $("<td></td>").toggleClass("box_jo");
				if (j == 1)
					$td.text("奇");
				else {
					$td.text("偶");
				}
			}
			$tr.append($td);
		}
		// 012路
		for (var j = 1; j < 4; j++) { // 列数
			var $td = $("<td></td>");
			if (parseInt(tdArr[1]) % 3 == (j - 1)) {
				if (j == 1) {
					$td.toggleClass("box_red");
					$td.text("0");
				} else if (j == 2) {
					$td.toggleClass("box_blue");
					$td.text("1");
				} else if (j == 3) {
					$td.toggleClass("box_green");
					$td.text("2");
				}
			}
			$tr.append($td);
		}
		$table.append($tr);
		
		
		

	}
	
	//模拟选号

			for (var k = 0; k < 3; k++) {
				var $tr = $("<tr></tr>");
				if (k==0)
					$tr.toggleClass("trStyle oneMoni");
				else
					$tr.toggleClass("trStyle");
				$tr.css("background-color", "#EAEEEE"); // 底色
				var $td = $("<td></td>");
				$td.toggleClass("c");
				if (k==0)
				$td.text("模拟选号");
				$tr.append($td);
				// 0-9的尾数
				for (var j = 0; j < 16; j++) { // 列数
					var $td = $("<td></td>").toggleClass("tdFirst");
					$td.text(j+1)
					$td.css("background-color", "#EAEEEE").css("color","#EAEEEE"); // 球的背景颜色
					$tr.append($td);
					if (k == 0) {
						$td.toggleClass("one");
					}
				}
				$table.append($tr);
				
				
			}

			$(function(){
				var Next = $(".two");
				var Pre = $(".one");
				
				for(var i=0;i<Pre.length;i++){
					(function(m){         
						Pre.eq(m).click(function(){
							
							$(this).toggleClass("active") 
							
					      }); 
					   })(i);
				}
			});		
			
	drawLqzs();
}
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
	$.ajax(getRootPath() + "/blue.do?p=getBlue", {
		type : 'post',
		timeout : 10000,
		dataType : 'json',
		success : function(data) {
			var trArr = [];
			for (var i = 0; i < data.length; i++) {
				var tdArr = [];
				tdArr[0] = data[i][0]; //期号
				tdArr[1] = data[i][1]; //蓝球数组
				trArr.push(tdArr);
				tableData.push(trArr);
			}
			//			console.debug(tableData);
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
	var tableHeight = $("#lqzsTu")[0].offsetHeight-115;
	
	$("svg").css("height", tableHeight);
	var lastPoints = new Array();
	var linePositons = new Array();
	var lastAngles = new Array();
	$(".box_qiu").each(
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
							"8", "9", "10", "11", "12", "13", "14", "15",
							"16" ];
					var chooseIndexs = []; // 选中的下标

					function render() {
						var str = "";
						console.log(chooseIndexs);
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
							console.log(mnxh)
							render();
						}
					}

					//模拟选号下的行
					var table_td = "";
					for (var b = 0; b < 16; b++) {
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

						console.log(chooseIndexs);
						$(".active").removeClass("active");

					});
				});

$(".left").click(function(){
	
	
	var $tdindex4 = $(".active");
	var tmp = [];
	for(var i=$tdindex4.length-1;i>=0;i--){
	    tmp.push($tdindex4.eq(i).html());	
	}
	$(".one").removeClass("active");
	
	
	for(var i=0;i<tmp.length;i++){
		var act3 = tmp[i];
		
		if(act3==0){
			$(".one").eq(15).addClass("active");
		}else{
			$(".one").eq(act3*1-2).addClass("active");
		}
		
	}
})
$(".right").click(function(){
	
	
	if($(".active").text() != ""){
		var $tdindex4 = $(".active");
		var tmp = [];
		for(var i=$tdindex4.length-1;i>=0;i--){
		    tmp.push($tdindex4.eq(i).html());	
		}
		
		$(".one").removeClass("active");
		
		for(var i=0;i<tmp.length;i++){
			var act3 = tmp[i];
			if(act3==16){
				$(".one").eq(0).addClass("active");
				//$(".two").eq(0).addClass("active2");
			}else{
				$(".one").eq(act3*1).addClass("active");
			}
			
		}
	}
	
})
