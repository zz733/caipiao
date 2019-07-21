// 初始化数据
getTableData();
var size = 0;

function paddingData(tableData) {
	var $table = $("#hswsTu");
	for ( var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		console.log(tdArr[4])
		// 期号
		var $td = $("<td></td>");
		$td.toggleClass("c");
		$td.text(tdArr[0]);
		$tr.append($td);
		var trArrIndex = 0;
		var last = -1;

		// 三个号码
		for ( var j = 1; j <= 3; j++) {
			var $td = $("<td></td>").toggleClass("num");
			$td.css("color", "white"); // 字体颜色
			$td.text(tdArr[j]);
			$td.css("background-color", "#0000FF"); // 红球
			$tr.append($td);

			if (j == 3) {
				if (tdArr[1] == tdArr[2] || tdArr[1] == tdArr[3]
						|| tdArr[2] == tdArr[3]) {
					$td.css("background-color", "#D45837"); // 红球
					$td.prev().css("background-color", "#D45837"); // 红球
					$td.prev().prev().css("background-color", "#D45837"); // 红球
				} else {
					$td.css("background-color", "#5695D4");// "#0063B1"); //蓝球
					$td.prev().css("background-color", "#5695D4"); // 蓝球
					$td.prev().prev().css("background-color", "#5695D4"); // 蓝球
				}
			}
		}

		// 0-9的尾数s
		// 0----9
		for ( var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != tdArr[1]) {
				$td.text("  ");
			} else {
				$td.toggleClass("zhexian4");
				$td.css("background-color", "#AE0000"); // 红球
				$td.css("color", "white").css("font-weight", "bold"); // 字体颜色
				$td.text(tdArr[1]);
			}
			// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
			$tr.append($td);
		}
		// 0----9
		for ( var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != tdArr[2]) {
				$td.text("  ");
				$td.css("background-color", "#EAC4CF"); // 球的背景颜色
			} else {
				$td.toggleClass("zhexian5");
				$td.css("background-color", "#AE0000"); // 红球
				$td.css("color", "white").css("font-weight", "bold"); // 字体颜色
				$td.text(tdArr[2]);
			}
			$tr.append($td);
		}
		// 0---9
		for ( var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != tdArr[3]) {
				$td.text("  ");
			} else {
				$td.toggleClass("zhexian6");
				$td.css("background-color", "#AE0000"); // 红球
				$td.css("color", "white").css("font-weight", "bold"); // 字体颜色
				$td.text(tdArr[3]);
			}
			// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
			$tr.append($td);
		}
		// 单
		/*var $td = $("<td></td>").toggleClass("tdSecond");
		if (tdArr[4] % 2 != 0)
			$td.text(tdArr[4]);
		else
			$td.text("");
		$tr.append($td);
		$td.css("background-color", "#EAC4CF"); // 球的背景颜色
		// 双
		var $td = $("<td></td>").toggleClass("tdSecond");
		if (tdArr[4] % 2 != 1)
			$td.text(tdArr[4]);
		else
			$td.text("");
		$td.css("background-color", "#C7E7E6"); // 球的背景颜色s
		// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
		$tr.append($td);*/

		// 和值除3余
		/*for ( var j = 0; j < 3; j++) {
			var $td = $("<td></td>").toggleClass("tdSecond");
			var n = tdArr[4] % 3;
			if (n != j) {
				$td.text("  ");

			} else {
				$td.css("color", "black").css("font-weight", "bold"); // 字体颜色
				$td.text(n);
			}
			// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
			$tr.append($td);
		}*/
		// 除3余0
		for ( var j = 0; j < 3; j++) {
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(tdArr[j + 5]);
			$td.css("background-color", "#C7E7E6"); // 球的背景颜色s
			$tr.append($td);
		}
		$table.append($tr);
	}
	/* sfs */
	for ( var i = 0; i < 3; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$table.append($tr);
		$tr.css("background-color", "#EAEEEE"); // 底色
		var $td = $("<td></td>");
		$td.toggleClass("c");
		if (i == 0)
			$td.text("模拟选号");
		$tr.append($td);
		for ( var j = 1; j <= 3; j++) {
			var $td = $("<td></td>").toggleClass("num");
			$td.css("color", "white"); // 字体颜色
			// $td.css("background-color", "#0000FF"); //红球
			$tr.append($td);
		}
		// 0-9的尾数
		// 0----9
		for ( var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(j);
			$td.index = j;
			$td.css("color", "#F1F1D6")
			$tr.append($td);
			if (i == 0) {
				$td.toggleClass("one");
				(function(m) {
					$(".one").eq(m).click(function() {
						console.log(m);
						$(".one").eq(m).toggleClass("active")
						if ($('.active').length > 1) {
							//$(this).removeClass("active");
							//layer.msg('第一位数最多只能选择1个哦');
							//return;
						}
					});
				})(j);
			}

		}
		// 0----9
		for ( var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(j);
			$td.css("color", "#EAC4CF").css("font-weight", "bold"); // 字体颜色
			$td.css("background-color", "#EAC4CF")
			$tr.append($td);
			if (i == 0) {
				$td.toggleClass("two");
				(function(m) {
					$(".two").eq(m).click(function() {
						console.log(m);
						$(".two").eq(m).toggleClass("active2")
						if ($('.active2').length > 1) {
							//$(this).removeClass("active2");
							//layer.msg('第二位数最多只能选择1个哦');
							//return;
						}
					});
				})(j);
			}
		}
		// 0---9
		for ( var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			$td.text(j);
			$td.css("color","#F1F1D6");
			// $td.css("background-color","#AE0000"); //红球
			// $td.css("color","white").css("font-weight","bold"); // 字体颜色
			// $td.css("background-color", "#C7E7E6"); // 球的背景颜色
			$tr.append($td);
			if (i == 0){
				$td.toggleClass("three");
				(function(m) {
					$(".three").eq(m).click(function() {
						console.log(m);
						$(".three").eq(m).toggleClass("active3")
						if ($('.active3').length > 1) {
							//$(this).removeClass("active3");
							//layer.msg('第三位数最多只能选择1个哦');
							//return;
						}
					});
				})(j);
			}
		}
	}
	drawWhzs(); // 画折线

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
function getTableData() {
	var isTest = false;
	var tableData = [];
	$.ajax(getRootPath() + "/3d.do?p=get3d2", {
		type : 'post',
		timeout : 10000,
		dataType : 'json',
		success : function(data) {

			var trArr = [];
			// 期号 球1 球2 球3 尾和 除3余0 除3余1 除数余2
		for ( var i = 0; i < data.length; i++) {
			var tdArr = [];
			tdArr[0] = data[i][0]; // 期号
		for ( var j = 1; j < 8; j++) {
			// alert(data[i][j]);
		if (j < 4)
			tdArr[j] = (data[i][j]); // (data[i][j])
	else
		tdArr[j] = data[i][j];
	/*
	 * if (tdArr[j] / 10 >= 1) { tdArr[j] = (data[i][j] + "").substring(1); }
	 */

}

// tdArr.sort(function(a, b) {
// return a - b
// });
// if (tdArr[0]=='18059')

trArr.push(tdArr);

tableData.push(trArr);
}
paddingData(tableData);

},
error : function(xhr, type, errorThrown) {
// 异常处理
		alert("您好，请检查一下您的网络是否异常！")
	}

	});

}

/** **********VIP选号********* */
var zuhe_Arr = [];
var qhArr_temp = [];
var sepeator = "-";

var table_canvas;
isInitOk = false;
y_head = -1;
function drawWhzs() {
	// table_canvas = new draw2d.Canvas("hswsTu");
	isInitOk = true;
   
	// 得到圆的圆点X+圆点Y+圆半径 并画图
	table_canvas = new draw2d.Canvas("hswsTu");// if(!table_canvas) //hswsTu
	
	$("svg").css("top", "46px");
	$("svg").css("left", "0px");// 由于自带样式中绝对定位有偏移
	$("svg").css("width", "100%");
//	$("svg").css("z-index", "-1");
	var tableHeight = $("tbody").height() - 25*3;
	$("svg").css("height", tableHeight);
	var lastPoints = new Array();
	var linePositons = new Array();
	var lastAngles = new Array();

	// alert(1)
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
			var line = new draw2d.shape.basic.Line(preX, preY, lineX, lineY,
					null);
			//line.setColor("#FF7900");
			table_canvas.addFigure(line);
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
			var line = new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null);
			//line.setColor("#FF7900");
			table_canvas.addFigure(line);
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
			//setColor
			var line = new draw2d.shape.basic.Line(preX, preY,
					lineX, lineY, null);
			//line.setColor("#FF7900");
			table_canvas.addFigure(line);
		}
		lastPoints[index] = X + "-" + Y;
	})
};

$(".qingkong").click(function() {
	$(".active").removeClass("active");
	$(".active2").removeClass("active2");
	$(".active3").removeClass("active3");
});

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
			$(".one").eq(9).addClass("active");
		}else{
			$(".one").eq(act1*1-1).addClass("active");
		}
	}
	
	//2
	var $tdindex2 = $(".active2");
	var tmp2 = [];
	for(var i=$tdindex2.length-1;i>=0;i--){
	    tmp2.push($tdindex2.eq(i).html());	
	}
	$(".two").removeClass("active2");
	for(var i=0;i<tmp2.length;i++){
		var act2 = tmp2[i];
		if(act2==0){
			$(".two").eq(9).addClass("active2");
		}else{
			$(".two").eq(act2*1-1).addClass("active2");
		}
	}
	
	
	//3
	var $tdindex3 = $(".active3");
	var tmp3 = [];
	for(var i=$tdindex3.length-1;i>=0;i--){
	    tmp3.push($tdindex3.eq(i).html());	
	}
	$(".three").removeClass("active3");
	for(var i=0;i<tmp3.length;i++){
		var act3 = tmp3[i];
		if(act3==0){
			$(".three").eq(9).addClass("active3");
		}else{
			$(".three").eq(act3*1-1).addClass("active3");
		}
	}
})
$(".right").click(function() {
	
	var $tdindex1 = $(".active");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());	
	}
	$(".one").removeClass("active");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==9){
			$(".one").eq(0).addClass("active");
		}else{
			$(".one").eq(act1*1+1).addClass("active");
		}
	}
	
	//2
	var $tdindex2 = $(".active2");
	var tmp2 = [];
	for(var i=$tdindex2.length-1;i>=0;i--){
	    tmp2.push($tdindex2.eq(i).html());	
	}
	$(".two").removeClass("active2");
	for(var i=0;i<tmp2.length;i++){
		var act2 = tmp2[i];
		if(act2==9){
			$(".two").eq(0).addClass("active2");
		}else{
			$(".two").eq(act2*1+1).addClass("active2");
		}
	}
	
	
	//3
	var $tdindex3 = $(".active3");
	var tmp3 = [];
	for(var i=$tdindex3.length-1;i>=0;i--){
	    tmp3.push($tdindex3.eq(i).html());	
	}
	$(".three").removeClass("active3");
	for(var i=0;i<tmp3.length;i++){
		var act3 = tmp3[i];
		if(act3==9){
			$(".three").eq(0).addClass("active3");
		}else{
			$(".three").eq(act3*1+1).addClass("active3");
		}
	}
	
})
