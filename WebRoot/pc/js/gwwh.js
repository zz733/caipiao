/** **********前三走势图********* */
getTableData();

var table_canvas;
isInitOk = false;
y_head = -1;
var backcolor = ["#FE0000", "#333300", "#FF6600", "#81007F", "#008001",
		"#010080"];
// 尾号走势画线
$("#zhexian").click(function() {
			if (!isInitOk) { // 没有初始化
				drawWhzs();
			} else {// 已初始化
				$("svg").remove(); // 直接移除控件
				isInitOk = false;
			}

		});

function paddingData(tableData) {
	var $table = $("#gwsTu");
	for (var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		// 期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[0]);
		$tr.append($td);
		// 1号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[1])) {
				$td.text("  ");
				$td.css("background-color", "#F7F0F0");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[1]);
				$td.css("background-color", "#FE0000"); // 球的背景颜色
				$td.toggleClass("zhexian1");
			}
			$tr.append($td);
		}
		// 2号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[2])) {
				$td.text("  ");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[2]);
				$td.css("background-color", "#333300"); // 球的背景颜色
				$td.toggleClass("zhexian2");
			}
			$tr.append($td);
		}

		// 3号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[3])) {
				$td.text("  ");
				$td.css("background-color", "#F7F0F0");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[3]);
				$td.css("background-color", "#FF6600"); // 球的背景颜色
				$td.toggleClass("zhexian3");
			}
			$tr.append($td);
		}
		// 4号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[4])) {
				$td.text("  ");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[4]);
				$td.css("background-color", "#81007F"); // 球的背景颜色
				$td.toggleClass("zhexian4");
			}
			$tr.append($td);
		}
		// 5号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[5])) {
				$td.text("  ");
				$td.css("background-color", "#F7F0F0");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[5]);
				$td.css("background-color", "#008001"); // 球的背景颜色
				$td.toggleClass("zhexian5");
			}
			$tr.append($td);
		}
		// 6号球尾数
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[6])) {
				$td.text("  ");
			} else {
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[6]);
				$td.css("background-color", "#010080"); // 球的背景颜色
				$td.toggleClass("zhexian6");
			}
			$tr.append($td);
		}

		$table.append($tr);
		
		window.setTimeout(function() {
			drawWhzs();
		}, 10);
		
	}
	
}

// 得到工程路径
function getRootPath() {
	// http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	// uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	// http://localhost:8083
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
// ["2017100",1,23,15,8,19,5],["2017101",2,32,11,14,25,7]
function getTableData() {
	var isTest = false;
	var tableData = []; // 解析后的数据的二维数组,一维放一行的数据（[]）,二维放列的值
	{
		$.ajax(getRootPath() + "/red.do?p=getRed", {
					type : 'post',
					timeout : 10000,
					dataType : 'json',
					success : function(data) {
						var trArr = [];
						for (var i = 0; i < data.length; i++) {
							var tdArr = [];
							tdArr[0] = data[i][0]; // 期号
							for (var j = 1; j < 7; j++) {
								tdArr[j] = (data[i][j]);
								if (tdArr[j] / 10 >= 1) {
									tdArr[j] = (data[i][j] + "").substring(1);
								}
							}
							// tdArr.sort(function(a, b) {
							// return a - b
							// });
							trArr.push(tdArr);
							tableData.push(trArr);
						}
						paddingData(tableData);

					},
					error : function(xhr, type, errorThrown) {
						// 异常处理；
						alert("您好，请检查一下您的网络是否异常！");
					}

				});
		return tableData;
	}
}

function drawWhzs() {
	table_canvas = new draw2d.Canvas("gwsTu");
	isInitOk = true;

	// 得到圆的圆点X+圆点Y+圆半径 并画图
	table_canvas = new draw2d.Canvas("gwsTu");// if(!table_canvas)
	$("svg").css("top", "75px");
	$("svg").css("left", "0px");// 由于自带样式中绝对定位有偏移
	$("svg").css("width", "100%");
var tableHeight = $("#gwsTu")[0].offsetHeight-50;
	
	$("svg").css("height", tableHeight);
	var lastPoints = new Array();
	var linePositons = new Array();
	var lastAngles = new Array();
	$(".zhexian1").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian2").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian3").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian4").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian5").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})

	$(".zhexian6").each(function(index, ele) {
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
			table_canvas.addFigure(new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null));
		}
		lastPoints[index] = X + "-" + Y;
	})
};

$(window).resize(function() {
			if (isInitOk) {
				// 先删除历史
				//$("svg").remove(); // 直接移除控件
				// 重写测画
				//drawWhzs();
			}
		});

// 隐藏和显示期数
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

/** **********模拟选号********* */

$(document).ready(function() {
	function choose() {
		// $(this).toggleClass("active");
		var $ul = $(this).parent();
		var max = $ul.children(".active").length; // 选中的数量
		/*
		 * if (max > 6) { $(this).removeClass("active"); layer.msg('最多只能选择6个');
		 * return; // 增加return，阻止代码继续执行 }
		 */

		var text = $(this).text(); // 选中的文本
		var index = mnxh.indexOf(text); // 选中的文本的下标
		// alert($(this)[0].className);
		var oldbackcolor = [];
		if (this.className == "") {
			this.className = "active";
			var _li = this;
			$ul.children("li").each(function(i, li) {

						if (li == _li) {
							index = i;
							if (i <= 9) {
								li.style.backgroundColor = backcolor[0];

							} else if (i <= 19) {

								li.style.backgroundColor = backcolor[1];

							} else if (i <= 29) {
								li.style.backgroundColor = backcolor[2];

							} else if (i <= 39) {
								li.style.backgroundColor = backcolor[3];
							} else if (i <= 49) {
								li.style.backgroundColor = backcolor[4];
							} else if (i <= 59) {
								li.style.backgroundColor = backcolor[5];
							}
						}

					});

		} else {
			this.className = "";
			var _li = this;
			$ul.children("li").each(function(i, li) {

						if (li == _li) {
							index = i;
							if (i <= 9) {
								li.style.backgroundColor = "#F7F0F0";

							} else if (i <= 19) {

								li.style.backgroundColor = "#EAEEEE";

							} else if (i <= 29) {
								li.style.backgroundColor = "#F7F0F0";

							} else if (i <= 39) {
								li.style.backgroundColor = "#EAEEEE";
							} else if (i <= 49) {
								li.style.backgroundColor = "#F7F0F0";
							} else if (i <= 59) {
								li.style.backgroundColor = "#EAEEEE";
							}
						}

					});

		}

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

		}
	}

	var mnxh = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "1",
			"2", "3", "4", "5", "6", "7", "8", "9", "0", "1", "2", "3", "4",
			"5", "6", "7", "8", "9", "0", "1", "2", "3", "4", "5", "6", "7",
			"8", "9", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
			"1", "2", "3", "4", "5", "6", "7", "8", "9"];
	var chooseIndexs = []; // 选中的下标

	function render() {
		var str = "";
		console.log(chooseIndexs);

		for (var i = 0; i < mnxh.length; i++) {
			var idValue = "mnxhqh_" + mnxh[i];
			var active = chooseIndexs.indexOf(i) > -1;
			var liStyle = "";
			var newBackcolor = "";
			if (i < 10) {
				liStyle = "#F7F0F0";
				newBackcolor = backcolor[0];
			} else if (10 <= i && i < 20) {
				liStyle = "#EAEEEE";
				newBackcolor = backcolor[1];
			} else if (20 <= i && i < 30) {
				liStyle = "#F7F0F0";
				newBackcolor = backcolor[2];
			} else if (30 <= i && i < 40) {
				liStyle = "#EAEEEE";
				newBackcolor = backcolor[3];
			} else if (40 <= i && i < 50) {
				liStyle = "#F7F0F0";
				newBackcolor = backcolor[4];
			} else if (50 <= i && i < 60) {
				liStyle = "#EAEEEE";
				newBackcolor = backcolor[5];
			}

			str = str + "<li value=" + i + "  style = 'background:"
					+ (active ? newBackcolor : liStyle) + ";color:" + liStyle
					+ ";'  class=" + (active ? "active" : "") + ">" + mnxh[i]
					+ "</li>";
		}
		$(".wrap #ul").html(str);

	}
	function move(direction) {
		var isLeft = direction < 0; // 向左移动
		return function() {
			for (var i = 0; i < chooseIndexs.length; i++) {
				console.log("移动下标：" + chooseIndexs);
				var value = chooseIndexs[i];
				console.log("value：" + value);
				if (isLeft) {
					if (value === 0) {
						chooseIndexs.splice(i, 1, mnxh.length - 1)
					} else {
						chooseIndexs.splice(i, 1, value - 1)
					}

				} else {
					if (value === mnxh.length - 1) {
						chooseIndexs.splice(i, 1, 0)
					} else {
						chooseIndexs.splice(i, 1, value + 1)
						// console.log("value+1："+value);
					}
				}
			}
			render();
		}
	}

	// 模拟选号下的行
	/*
	 * var table_td1 = ""; for(var i = 0; i <60; i++) { var liStyle = ""; if(i<10){
	 * liStyle = "#F7F0F0"; }else if(10 <= i && i < 20){ liStyle = "#EAEEEE";
	 * }else if(20 <= i && i < 30){ liStyle = "#F7F0F0"; }else if(30 <= i && i <
	 * 40){ liStyle = "#EAEEEE"; }else if(40 <= i && i < 50){ liStyle =
	 * "#F7F0F0"; }else if(50 <= i && i < 60){ liStyle = "#EAEEEE"; } table_td =
	 * table_td +"<li style = 'background:"+liStyle+";color:"+liStyle1+";'></li>" }
	 * $(".ul1").html(table_td1);
	 */

	var table_li = "";
	for (var i = 0; i < 60; i++) {
		var liStyle = "";
		if (i < 10) {
			liStyle = "#F7F0F0";
		} else if (10 <= i && i < 20) {
			liStyle = "#EAEEEE";
		} else if (20 <= i && i < 30) {
			liStyle = "#F7F0F0";
		} else if (30 <= i && i < 40) {
			liStyle = "#EAEEEE";
		} else if (40 <= i && i < 50) {
			liStyle = "#F7F0F0";
		} else if (50 <= i && i < 60) {
			liStyle = "#EAEEEE";
		}
		table_li = table_li + "<li style = 'background:" + liStyle + ";color:"
				+ liStyle + ";'></li>"
	}
	$(".konghang .ul1").html(table_li);

	$(".wrap").on("click", "li", choose);
	$('.right').on('click', move(1));
	$('.left').on('click', move(-1));

	render();

	$(".qingkong").click(function() {
				// $(".active").toggleClass("active");
				chooseIndexs.length = 0;

				console.log(chooseIndexs);
				$(".active").removeClass("active");
				$(".wrap #ul").children("li").each(function(i, li) {
							var liStyle = "";
							if (i < 10) {
								liStyle = "#F7F0F0";
							} else if (10 <= i && i < 20) {
								liStyle = "#EAEEEE";
							} else if (20 <= i && i < 30) {
								liStyle = "#F7F0F0";
							} else if (30 <= i && i < 40) {
								liStyle = "#EAEEEE";
							} else if (40 <= i && i < 50) {
								liStyle = "#F7F0F0";
							} else if (50 <= i && i < 60) {
								liStyle = "#EAEEEE";
							}
							li.style.backgroundColor = liStyle;

						});

			});
});

/** **********vip选号********* */



window.setTimeout(function(){
	$("#ul>li").removeClass("active");
	
},200);