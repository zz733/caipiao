getTableData();
$("#dzxt").click(function() {
	drawWhzs();

	// $("svg").remove(); //直接移除控件

	// 尾号走势画线

});

function paddingData(tableData) {
	var $table = $("#qswsTu tbody");
	for ( var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色 #F7F0F0
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		// 尾数值
		var wsz = tdArr[0].substring(1);
		// 期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[tdArr.length - 1]);
		$tr.append($td);
		// 蓝球号码
		for ( var j = 1; j < 17; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdFirst");
			if (j != parseInt(tdArr[0])) {
				$td.text("  ");
			} else {
				$td = $("<td></td>").toggleClass("box_qiu");
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[0]);
				$td.css("background-color", "#3370B0"); // 球的背景颜色
			}
			$tr.append($td);
		}
		// 大小
		for ( var j = 1; j < 3; j++) { // 列数
			var $td = $("<td></td>");
			$td.text("  ");
			if (!((parseInt(tdArr[0]) / 8) > (j - 1) && parseInt(tdArr[0]) / 8 <= (j))) {
				// $td.css("color","#fff"); //字体颜色
				// $td.css("background-color","#99CC99"); //球的背景颜色
				$td = $("<td></td>").toggleClass("box_dx");
				if(j==1)$td.text("大");
				else{ $td.text("小");}
				
			}
			$tr.append($td);
		}
		// 奇偶
		for ( var j = 1; j < 3; j++) { // 列数
			var $td = $("<td></td>");
			if (!(parseInt(tdArr[0]) % 2 == j - 1)) {
				$td = $("<td></td>").toggleClass("box_jo");
				if(j==1)$td.text("奇");
				else{ $td.text("偶");}
			}
			$tr.append($td);
		}
		// 012路
		for ( var j = 1; j < 4; j++) { // 列数
			var $td = $("<td></td>");
			if (parseInt(tdArr[0]) % 3 == (j - 1)) {
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
		// 尾号走势
		for ( var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j == wsz) {
				$td.toggleClass("whzsClass");
				$td.toggleClass("box_qiu");
				$td.css("color", "white"); // 字体颜色
				$td.text(wsz);
				$td.css("background-color", "#3370B0"); // 球的背景颜色
			} else {
				$td.text("  ");
			}
			$tr.append($td);
		}
		$table.append($tr);
	}
}
// 获取数据
function getTableData() {
	var tableData = [];
	$
			.ajax(
					"http://www.smartkey.xin:8083/two_color_ball_analysis/record?page=0&size=25",
					{
						type : 'get',
						timeout : 10000,
						success : function(data) {

							for ( var i = 0; i < data.numberOfElements; i++) {
								var trArr = [];
								for ( var j = 0; j < data.content.length; j++) {
									var tdArr = [];
									tdArr[0] = data.content[j].blueBall; // 蓝球数组
									tdArr[1] = data.content[j].issue; // 期号
									trArr[j] = tdArr;
								}
								tableData[i] = trArr;
								// alert(trArr);/////
							}
							paddingData(tableData);
						},
						error : function(xhr, type, errorThrown) {
							// 异常处理；
							alert("您好，请检查一下您的网络是否异常！")
						}

					});
	return tableData;
}
function drawWhzs() {

	// 得到圆的圆点X+圆点Y+圆半径 并画图
	table_canvas = new draw2d.Canvas("qswsTu");// if(!table_canvas)
	$("svg").css("top", "0px");
	$("svg").css("left", "0px");// 由于自带样式中绝对定位有偏移
	// $("svg").css("display","block");
	// $("svg").css("margin","0 auto");
	$("svg").css("width", "100%");
	$("svg").css("height", "100%");
	var lastPoints = new Array();
	var linePositons = new Array();
	var lastAngles = new Array();
	$(".whzsClass").each(
			function(index, ele) {
				var ceilWidth = $(this).width() / 2;
				var ceilHeight = $(this).height() / 2;
				var X = $(this).position().left + ceilWidth;
				var Y = $(this).position().top + ceilHeight;
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


//隐藏和显示期数
$("#yincang").click(function(){
	var yincangF =$("#yincang");
	var yincangS = $(".tdIssue");
	
	if(yincangF.css("display")==="none"){
		yincangF.show();
		yincangS.show();
	}else{
		yincangF.hide();
		yincangS.hide();
	}
});
