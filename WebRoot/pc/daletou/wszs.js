/** **********走势图********* */
// 初始化数据
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
	var $table = $("#zhwsTu");
	for (var i = 0; i < tableData.length; i++) {
		console.log("tableData为："+tableData)
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#FFCCCC"); // 底色
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		console.log("sdfsfds"+tdArr)
		// 期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[tdArr.length - 1]);
		$tr.append($td);
		var trArrIndex = 0;
		// 红球
		var x = 0;
		var y = 0;
		var z = 0;
		
		for (var k=0;k<tdArr.length-1;k++)
		{
			  if (parseInt(tdArr[k]) % 3 == 0)
				x++;
		      else if (parseInt(tdArr[k]) % 3 == 1)
				y++;
		      else if (parseInt(tdArr[k]) % 3 == 2)
				z++;	
		}
		
		var last = -1;
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>");
			if (j != parseInt(tdArr[trArrIndex])) {
				$td.text("  ");
				if (last==tdArr[trArrIndex])
					trArrIndex++;
			} else {
				// 012路
				
				last = tdArr[trArrIndex];  
				
		
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[trArrIndex]);
				$td.css("background-color", "#800000"); // 球的背景颜色
				if (trArrIndex != tdArr.length - 1)
					trArrIndex++;
			}

			$tr.append($td);
		}

		// 0-4的尾数
		trArrIndex = 0
		for (var j = 0; j < 5; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != parseInt(tdArr[trArrIndex])) {
				$td.text("  ");
				if (last==tdArr[trArrIndex])
					trArrIndex++;
			} else {
				last = tdArr[trArrIndex];  
				$td.css("color", "white"); // 字体颜色
				$td.text(tdArr[trArrIndex]);
				$td.css("background-color", "#800000"); // 球的背景颜色
				if (trArrIndex != tdArr.length - 2)
					trArrIndex++;
			}
			$tr.append($td);
		}
		
		last = -1;
		
		for (var j = 0; j < 10; j++) { // 列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if(tdArr.length==7){
			if (j != tdArr[5]-tdArr[0]){
				$td.text("  ");
				$td.css("background-color", "#C7E7E6");
			} else {
				$td.css("color","white").css("font-weight","bold");  // 字体颜色
				$td.text(j);
				$td.toggleClass("zhexian");
				$td.css("background-color","rgb(128, 0, 0)");
			}}else if(tdArr.length==6){
				if (j != tdArr[4]-tdArr[0]){
					$td.text("  ");
					$td.css("background-color", "#C7E7E6");
				} else {
					$td.css("color","white").css("font-weight","bold");  // 字体颜色
					$td.text(j);
					$td.toggleClass("zhexian");
					$td.css("background-color","rgb(128, 0, 0)");
				}
			}else if(tdArr.length==5){
				if (j != tdArr[3]-tdArr[0]){
					$td.text("  ");
					$td.css("background-color", "#C7E7E6");
				} else {
					$td.css("color","white").css("font-weight","bold");  // 字体颜色
					$td.text(j);
					$td.toggleClass("zhexian");
					$td.css("background-color","rgb(128, 0, 0)");
				}
				}
			else if(tdArr.length==4){
				if (j != tdArr[2]-tdArr[0]){
					$td.text("  ");
					$td.css("background-color", "#C7E7E6");
				} else {
					$td.css("color","white").css("font-weight","bold");  // 字体颜色
					$td.text(j);
					$td.toggleClass("zhexian");
					$td.css("background-color","rgb(128, 0, 0)");
				}
				}
//			 // 球的背景颜色
			$tr.append($td);
		}
		for (var j = 1; j < 4; j++) { // 列数
			var $td = $("<td width='30px'></td>");
			if (j == 1) {
				$td.css("background-color", "#FFCC99");
				$td.text(x);
			} else if (j == 2) {
				$td.css("background-color", "#99FFCC");
				$td.text(y);
			} else if (j == 3) {
				$td.css("background-color", "#CC99CC");
				$td.text(z);
			}
			$tr.append($td);
		}

		$table.append($tr);
	}
	drawLqzs()
}

function unique(data) {
	data = data || [];
	var a = {}; // 声明一个对象，JavaScript中的对象可以当哈希表用
	for (var i = 0; i < data.length; i++) {
		a[data[i]] = true; // 设置标记，把数组的值当下标，这样就可以去掉重复的值
	};
	data.length = 0;
	for (var i in a) { // 遍历对象，把已标记的还原成数组
		data[data.length] = i;
	}
	return data;
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
	var tableData = []; // 解析后的数据的二维数组,一维放一行的数据（[]）,二维放列的值
	$.ajax(getRootPath() + "/daletou.do?p=get3d3", {
				type : 'get',
				timeout : 10000,
				dataType : 'json',
				success : function(data) {
					var trArr = [];
					for (var i = 0; i < data.length; i++) {
//						console.log("data是："+data)
						var tdArr = [];
						tdArr[0] = data[i][0]; // 期号
						for (var j = 1; j < 6; j++) {
							tdArr[j] = (data[i][j]);
//							console.log("data是122："+tdArr[j])
							if (tdArr[j] / 10 >= 1) {
								tdArr[j] = (data[i][j] + "").substring(1);
							}
						}
						tdArr.sort(function(a, b) {
									return a - b;
								});
						var tdArr2 = unique(tdArr);
						trArr.push(tdArr2);
						tableData.push(trArr);
					}
					paddingData(tableData);
				},
				error : function(xhr, type, errorThrown) {
					// 异常处理；
					alert("您好，请检查一下您的网络是否异常！")
				}
			});

	// 返回二维数组结果
	return tableData;
}
function drawLqzs() {
//	table_canvas = new draw2d.Canvas("zhwsTu");
	isInitOk = true;

	// 得到圆的圆点X+圆点Y+圆半径 并画图
	table_canvas = new draw2d.Canvas("zhwsTu");// if(!table_canvas)
	$("svg").css("top", "45px");
	$("svg").css("left", "0px");// 由于自带样式中绝对定位有偏移
	$("svg").css("width", "80%");
	var tableHeight = $("#zhwsTu")[0].offsetHeight-40;
//	console.log("sdsds:"+tableHeight)
	
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

$(document).ready(function() {
	function choose() {
		$(this).toggleClass("active");
		var $ul = $(this).parent();
		var max = $ul.children(".active").length; // 选中的数量
		/*
		if (max > 6) {
			$(this).removeClass("active");
			layer.msg('最多只能选择6个');
			return; // 增加return，阻止代码继续执行
		}*/
		var text = $(this).text(); // 选中的文本
		var index = mnxh.indexOf(text); // 选中的文本的下标
		if (index <= 4) {
			var rightIndex = index + 10;
			$ul.children("li").eq(rightIndex).toggleClass("active");
		}

		if (index >= 10) {
			var leftIndex = index - 10;
			$ul.children("li").eq(leftIndex).toggleClass("active");

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
			$(".myselt").val(cstr);;
		}
	}

	/** **********模拟选号********* */
	mnxh = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
	mnxh2 = ["0", "1", "2", "3", "4","","","","","","","","","",""];
	chooseIndexs = []; // 选中的下标
	function render() {
		var str = "";
		console.log(chooseIndexs);
		for (var i = 0; i < mnxh.length; i++) {
			var idValue = "mnxhqh_" + mnxh[i];
			var active = chooseIndexs.indexOf(i) > -1;
			str = str + "<li class='" + idValue + " "
					+ (active ? "active" : "") + "' " + " style='background-color:#FFCCCC;color:#FFCCCC;'>" + mnxh[i] + "</li>";
		}
		
		for (var i = 0; i < mnxh2.length; i++) {
			var idValue = "mnxhqh_" + mnxh2[i];
			var active = chooseIndexs.indexOf(i) > -1;
			str = str + "<li class='" + idValue + " "+ (active ? "active" : "") + "'" + " style='background-color:#FFCCCC;color:#FFCCCC;'>" + mnxh2[i] + "</li>";
		}

		$(".wrap #ul").html(str);//nth-child(+n+16)
		$(".ul1 li:eq(16)").click(function(){
			$(".ul1 li:eq(0)").removeClass('active');
		})
	}

	function move(direction) {
		var isLeft = direction < 0; // 向左移动
		return function() {
			for (var i = 0; i < chooseIndexs.length; i++) {
				var value = chooseIndexs[i];
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
					}
				}
			}
			render();
		}
	}

	// 模拟选号下的行
	var table_td = "";
	for (var b = 0; b < 25; b++) {
		table_td = table_td
				+ "<li style = 'background:#FFCCCC;;margin-left:1px'></li>";
	}
	$(".ul1").html(table_td);

	$(".wrap").on("click", "li", choose);
	$('.right').on('click', move(1));
	$('.left').on('click', move(-1));

	render();

	$(".qingkong").click(function() {
				chooseIndexs.length = 0;

				console.log(chooseIndexs);
				$(".active").removeClass("active");

			});
});

/** **********vip选号********* */

var sepeator = "-";

// oldData:数组，表示组合的数据来源 combineCount:数字，表示组合的个数，几个几个为一组合

function arr(ds, zh) {
	var testResult = combineData(zh, ds);
//	console.log(testResult);
	var erdang_Arr = [];
	for (var i = 0; i < testResult.length; i++) {
		var temp = testResult[i][0];
		for (var j = 1; j < ds; j++) {
			temp += sepeator + testResult[i][j];
		}
		erdang_Arr.push(temp);
	}
	return erdang_Arr;
}

function vip_ds() {
	// alert("我是vip_ds");
	xbIndex = 0;
	vip_mk();
}
function showVIP(param,n)
{
	var array=[0,1,2,3,4];
	console.log(param);//按钮格子当中的值
	$("#ul li").removeClass("active");//原来选中的红色格子
	for(var i=0;i<6;i++){//param[i]该值为0-9,即说明可以从0移动到9位
		$("#ul li:eq("+param[i]+")").addClass("active");
		for(var j=0;j<array.length;j++){
			if(array[j]==param[i]){
				$("#ul li:eq("+"1"+param[i]+")").addClass("active");
			}
		}
	}
}
$(function(){
	for(var i=0;i<5;i++){
		$(".btnul").append("<li class=numli"+i+">"+[i]+"</li>");
		//在ul标签上动态添加li标签
		$(".numli"+i).attr("class",'btnnum btn');
		$(".btnnum").css("border-radius",'2px').css("border","1px solid #428bca");	
		$(".btnul li:eq(4)").hide();
	}
	$(".btnul").append("<button  id='btnRight' type='button'  class='right_index btn-primary btn-sm' >▶</button>")
	for(var i=4;i<10;i++){
		$(".btnul2").append("<li class=btnnum2"+i+">"+[i]+"</li>");
		$(".btnnum2").css("border-radius",'2px');	
		$(".btnnum2"+i).attr("class",'three btn btn-primary');
	}
	})
	
		function go4(m) {
			if(m < 4 || m > 9) {
				return;
			}
			var arry = [];
			for(var i = 0; i <= 9; i++) {
				for(var j = 0; j < i; j++) {
					if(i - j == m) {
						var array = [];
						for(var x = j + 1; x < i; x++) {
							array.push(x);
						}
						for(var o = 0; o < array.length; o++) {
							for(var z = 0; z < o; z++) {
								if(array[z] < array[o]) {
									var arr2 = [];
									arr2.push(j);
									arr2.push(array[z]);
									arr2.push(array[o]);
									arr2.push(i);
									arry.push(arr2);
								}
							}
						}
					}
				}
			}
			return arry;
		}
function go5(m) {
	if(m<4 || m>9){
	return;
	}
	var arry = [];
	for(var i = 0; i <= 9; i++) {
		for(var j=0; j < i; j++){
			if(i-j==m){
				var array=[];
					for(var x=j+1;x<i;x++){
					array.push(x);
					}
					for(var o=0;o<array.length;o++){
						for(var z=0;z<o;z++){
							for(var p=0;p<z;p++){
							if(array[p]<array[z]  &&  array[z]<array[o]){
							var arr2 = [];
							arr2.push(j);
							arr2.push(array[p]);
							arr2.push(array[z]);
							arr2.push(array[o]);
							arr2.push(i);
							arry.push(arr2);
						}
							}
						}
					}}
		}
	}
	return arry;
}

var arry2 = go4(4);
var arry3 = go5(4);
var index = 0;
$(function(){
	if(index==0){
		  $("#btnLeft").attr("disabled","disabled");
	  }else{
		  $("#btnLeft").removeAttr("disabled");
	  }
	 if(index>=arry2.length-1){
		   $("#btnRight").attr("disabled","disabled");
	   }else{
		   $("#btnRight").removeAttr("disabled");
	   }
	 if($('.Selectbig option:selected').text()=="四码"){
			$(".btnul li:eq(4)").hide();
			arry2 = go4(5);
			index = 0;
			$(".btnul li:eq(0)").text(arry2[index][0]);
			$(".btnul li:eq(1)").text(arry2[index][1]);
			$(".btnul li:eq(2)").text(arry2[index][2]);
			$(".btnul li:eq(3)").text(arry2[index][3]);
			showVIP(arry2[index],4);
			$("#btnRight").unbind("click");
			$("#btnLeft").unbind("click");
			$(function(){
				var three=document.querySelectorAll(".three");
				for(var i=0;i<three.length;i++){
				(function(m){ 
				       $(".three").eq(m).click(function(){
				    	   index = 0;
				    	   arry2 =go4(m+4);
				    			$(".btnul li:eq(0)").text(arry2[index][0]);
				    			$(".btnul li:eq(1)").text(arry2[index][1]);
				    			$(".btnul li:eq(2)").text(arry2[index][2]);
				    			$(".btnul li:eq(3)").text(arry2[index][3]);
				    			showVIP(arry2[index],4);
				    	   if($(".btnul li:eq(0)").text()==0){
				    		   $("#btnLeft").attr("disabled","disabled");
				    	   }else{
				    		   $("#btnLeft").removeAttr("disabled");
				    		}
				    	   if(index>=arry2.length-1){
			   				   $("#btnRight").attr("disabled","disabled");
			   			   }else{
			   				$("#btnRight").removeAttr("disabled");
			   			   }
				      }); 
				   })(i);
				}
			})
			$("#btnRight").click(function(){
				index++;
		    	   $(".btnul li:eq(0)").text(arry2[index][0]);
				   $(".btnul li:eq(1)").text(arry2[index][1]);
				   $(".btnul li:eq(2)").text(arry2[index][2]);
				   $(".btnul li:eq(3)").text(arry2[index][3]);
				   showVIP(arry2[index],4);
				   $("#btnLeft").removeAttr("disabled");
				   if(index>=(arry2.length-1)){
					   $("#btnRight").attr("disabled","disabled");
				   }else{
					   $("#btnRight").removeAttr("disabled");
				   }
		      }); 
		     $("#btnLeft").click(function(){
		    	   index--;
		    	   $(".btnul li:eq(0)").text(arry2[index][0]);
				   $(".btnul li:eq(1)").text(arry2[index][1]);
				   $(".btnul li:eq(2)").text(arry2[index][2]);
				   $(".btnul li:eq(3)").text(arry2[index][3]);
				   showVIP(arry2[index],4);
				   $("#btnRight").removeAttr("disabled");
				  if(index==0){
					  $("#btnLeft").attr("disabled","disabled");
				  }else{
					  $("#btnLeft").removeAttr("disabled");
				  }
		      });
		}
	$("#btnRight").click(function(){
		index++;
    	   $(".btnul li:eq(0)").text(arry2[index][0]);
		   $(".btnul li:eq(1)").text(arry2[index][1]);
		   $(".btnul li:eq(2)").text(arry2[index][2]);
		   $(".btnul li:eq(3)").text(arry2[index][3]);
		   showVIP(arry2[index],4);
		   $("#btnLeft").removeAttr("disabled");
		   if(index  >= (arry2.length-1)){ 
			   $("#btnRight").attr("disabled","disabled");
		   }else{
			   $("#btnRight").removeAttr("disabled");
		   }
      });
	$("#btnLeft").click(function(){
 	   index--;
 	   	   $(".btnul li:eq(0)").text(arry2[index][0]);
		   $(".btnul li:eq(1)").text(arry2[index][1]);
		   $(".btnul li:eq(2)").text(arry2[index][2]);
		   $(".btnul li:eq(3)").text(arry2[index][3]);
		   showVIP(arry2[index],4);
		   $("#btnRight").removeAttr("disabled");
		  if(index==0){
			  $("#btnLeft").attr("disabled","disabled");
		  }else{
			  $("#btnLeft").removeAttr("disabled");
		  }
   });
})

function change(){
	if($('.Selectbig option:selected').text()=="四码"){
		$(".btnul li:eq(4)").hide();
		arry2 = go4(5);
		index = 0;
		$(".btnul li:eq(0)").text(arry2[index][0]);
		$(".btnul li:eq(1)").text(arry2[index][1]);
		$(".btnul li:eq(2)").text(arry2[index][2]);
		$(".btnul li:eq(3)").text(arry2[index][3]);
		showVIP(arry2[index],4);
		$("#btnRight").unbind("click");
		$("#btnLeft").unbind("click");
		$(function(){
			var three=document.querySelectorAll(".three");
			for(var i=0;i<three.length;i++){
			(function(m){ 
			       $(".three").eq(m).click(function(){
			    	   index = 0;
			    	   arry2 =go4(m+4);
			    			$(".btnul li:eq(0)").text(arry2[index][0]);
			    			$(".btnul li:eq(1)").text(arry2[index][1]);
			    			$(".btnul li:eq(2)").text(arry2[index][2]);
			    			$(".btnul li:eq(3)").text(arry2[index][3]);
			    			showVIP(arry2[index],4);
			    	   if($(".btnul li:eq(0)").text()==0){
			    		   $("#btnLeft").attr("disabled","disabled");
			    	   }else{
			    		   $("#btnLeft").removeAttr("disabled");
			    		}
			    	   if(index>=arry2.length-1){
		   				   $("#btnRight").attr("disabled","disabled");
		   			   }else{
		   				$("#btnRight").removeAttr("disabled");
		   			   }
			      }); 
			   })(i);
			}
		})
		$("#btnRight").click(function(){
			index++;
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   $(".btnul li:eq(3)").text(arry2[index][3]);
			   showVIP(arry2[index],4);
			   $("#btnLeft").removeAttr("disabled");
			   if(index>=(arry2.length-1)){
				   $("#btnRight").attr("disabled","disabled");
			   }else{
				   $("#btnRight").removeAttr("disabled");
			   }
	      }); 
	     $("#btnLeft").click(function(){
	    	   index--;
	    	   $(".btnul li:eq(0)").text(arry2[index][0]);
			   $(".btnul li:eq(1)").text(arry2[index][1]);
			   $(".btnul li:eq(2)").text(arry2[index][2]);
			   $(".btnul li:eq(3)").text(arry2[index][3]);
			   showVIP(arry2[index],4);
			   $("#btnRight").removeAttr("disabled");
			  if(index==0){
				  $("#btnLeft").attr("disabled","disabled");
			  }else{
				  $("#btnLeft").removeAttr("disabled");
			  }
	      });
	}
	if($('.Selectbig option:selected').text()=="五码"){
		$(".btnul li:eq(4)").show();
		arry3 = go5(5);
		index = 0;
		$(".btnul li:eq(0)").text(arry3[index][0]);
		$(".btnul li:eq(1)").text(arry3[index][1]);
		$(".btnul li:eq(2)").text(arry3[index][2]);
		$(".btnul li:eq(3)").text(arry3[index][3]);
		$(".btnul li:eq(4)").text(arry3[index][4]);
		showVIP(arry3[index],5);
		$("#btnRight").unbind("click");
		$("#btnLeft").unbind("click");
		$(function(){
			var three=document.querySelectorAll(".three");
			for(var i=0;i<three.length;i++){
			(function(m){ 
			       $(".three").eq(m).click(function(){
			    	   index = 0;
			    	   arry3 =go5(m+4);
			    			$(".btnul li:eq(0)").text(arry3[index][0]);
			    			$(".btnul li:eq(1)").text(arry3[index][1]);
			    			$(".btnul li:eq(2)").text(arry3[index][2]);
			    			$(".btnul li:eq(3)").text(arry3[index][3]);
			    			$(".btnul li:eq(4)").text(arry3[index][4]);
			    			showVIP(arry3[index],4);
			    	   if($(".btnul li:eq(0)").text()==0){
			    		   $("#btnLeft").attr("disabled","disabled");
			    	   }else{
			    		   $("#btnLeft").removeAttr("disabled");
			    		}
			    	   if(index>=arry3.length-1){
		   				   $("#btnRight").attr("disabled","disabled");
		   			   }else{
		   				$("#btnRight").removeAttr("disabled");
		   			   }
			      }); 
			   })(i);
			}
		})
		$("#btnRight").click(function(){
			index++;
	    	   $(".btnul li:eq(0)").text(arry3[index][0]);
			   $(".btnul li:eq(1)").text(arry3[index][1]);
			   $(".btnul li:eq(2)").text(arry3[index][2]);
			   $(".btnul li:eq(3)").text(arry3[index][3]);
			   $(".btnul li:eq(4)").text(arry3[index][4]);
			   showVIP(arry3[index],5);
			   $("#btnLeft").removeAttr("disabled");
			   if(index>=(arry3.length-1)){
				   $("#btnRight").attr("disabled","disabled");
			   }else{
				   $("#btnRight").removeAttr("disabled");
			   }
	      }); 
	     $("#btnLeft").click(function(){
	    	   index--;
	    	   $(".btnul li:eq(0)").text(arry3[index][0]);
			   $(".btnul li:eq(1)").text(arry3[index][1]);
			   $(".btnul li:eq(2)").text(arry3[index][2]);
			   $(".btnul li:eq(3)").text(arry3[index][3]);
			   $(".btnul li:eq(4)").text(arry3[index][4]);
			   showVIP(arry3[index],4);
			   $("#btnRight").removeAttr("disabled");
			  if(index==0){
				  $("#btnLeft").attr("disabled","disabled");
			  }else{
				  $("#btnLeft").removeAttr("disabled");
			  }
	      });
	}
}
 
//$(".Select #group").change(function(){
//	console.log("12316565")
//});

window.setTimeout(function(){
	$("#ul>li").removeClass("active");
	
},200);