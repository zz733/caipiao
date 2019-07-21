/************红球走势图**********/
//初始化数据
getTableData();


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
	if (projectName == "/pc" || projectName == "/admin" || projectName == "/weixin")
		projectName = "";

	return (localhostPaht + projectName);
}


function paddingData(tableData) {
	var $table = $("#hqzsTu");
	for(var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[tdArr.length - 1]);
		$tr.append($td);
		var trArrIndex = 0;
		var x = 0 ;
		var y = 0 ;
		var z = 0 ;
		//红球
		for(var j = 1; j < 34; j++) { //列数
			var $td = $("<td></td>");
			if(j != parseInt(tdArr[trArrIndex])) {
				if(j<=11)
					$td.css("background-color", "#B6FBBB"); 
				else if(12 <= j && j <= 22)
					$td.css("background-color", "#EAC4CF");				   
				else if(23 <= j && j <= 33)
				  $td.css("background-color", "#C7E7E6"); 
				  $td.text("  ");
			} else {
				$td.css("color", "white"); //字体颜色
				if(j <= 11){
					$td.text(tdArr[trArrIndex]);
				    x++;
				}
				else if(12 <= j && j <= 22){
					$td.text(tdArr[trArrIndex]);
				    y++;
				}
				else if(23 <= j && j <= 33){
					$td.text(tdArr[trArrIndex]);
				    z++;
				}
				$td.css("background-color", "#AE0000"); //球的背景颜色
				if(trArrIndex != tdArr.length- 1 ) trArrIndex++;
			}
			
			$tr.append($td);
		}
		
		for(var j = 0; j < 3; j++) { //列数
			var $td = $("<td></td>");
			if(j==0)
				$td.text(x);
			else if(j==1)
			  $td.text(y);
			  else if(j==2)
			  $td.text(z);
			
			$tr.append($td);
		}	
		$table.append($tr);
		
//		var $tr_mn = $("<tr></tr>");
//		for (var i = 0; i < 33; i++) {
//			var $td_mn = $("<td></td>");
//			$td_mn.text(1);
//		}
//		    $tr_mn.append($td_mn);
//			$table.append($tr_mn);	
	}
}
//获取数据
function getTableData() {
	var tableData = []; //解析后的数据的二维数组,一维放一行的数据（[]）,二维放列的值
	$.ajax(getRootPath() +"/red.do?p=getRed", {
		type: 'get',
		timeout: 10000,
		dataType: 'json',
		success: function(data) {
				var trArr =  [];
				for (var i = 0; i < data.length; i++) {
 						var tdArr =  [];
 						tdArr[0] = data[i][0]; //期号
 						for (var j = 1; j < 7; j++) {
 							tdArr[j] = (data[i][j]);
 						}
 						tdArr.sort(function(a, b) {
							return a - b
						});
 						trArr.push(tdArr);
 						tableData.push(trArr);
				}
				paddingData(tableData);
		},
		error: function(xhr, type, errorThrown) {
			//异常处理；
			alert("您好，请检查一下您的网络是否异常！")
		}
	});
	//返回二维数组结果
	return tableData;
}

//生成随机数字	
function randomNodumpDigital(trArr) {
	var r = Math.floor(Math.random() * (10)) + 1;
	for(var i = 0; i < trArr.length; i++) {
		if(trArr[i] == r) {
			return randomNodumpDigital(trArr);
			break;
		}
	}
	if(r < 10) r = "0" + r;
	return r;
}

//隐藏和显示期数
$("#yincang").click(function() {
	var yincangF = $("#yincang");
	var yincangS = $(".tdIssue");
	if(yincangF.css("display") === "none") {
		yincangF.show();
		yincangS.show();
	} else {
		yincangF.hide();
		yincangS.hide();
	}
});

$(document).ready(function() {
	$(".tdIssue").click(function() {
		$(this).animate({
			opacity: "hide"
		}, "slow");
	});
});

/************模拟选号**********/
var chooseIndexs = []; // 选中的下标的数组
//模拟选号
var mnxh = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33"];
$(document).ready(function() {
	function choose() {
		$(this).toggleClass("active");
		var $ul = $(this).parent();
//		var max = $ul.children(".active").length; // 选中的数量
//		if(max > 6) {
//			$(this).removeClass("active");
//			alert("最多只能选择6个");
//		    layer.msg('最多只能选择6个');
//			return; // 增加return，阻止代码继续执行
//		}
		var text = $(this).text(); // 选中的文本
		var index = mnxh.indexOf(text); // 选中的文本的下标
		
		console.log(chooseIndexs.indexOf(index) > -1);
		
		if(chooseIndexs.indexOf(index) > -1) {
			chooseIndexs.splice(chooseIndexs.indexOf(index), 1);
			
		} else {
			chooseIndexs.push(index);
		}
		
		var cstr = $ul.children(".active").text();
		if($(this).hasClass("active")) {
			$(".myselt").val(cstr);
		} else {
			$(".myselt").val(cstr);;
		}
		
		//render();
	}

	function render() {
		var str = "";
		console.log(chooseIndexs);
		for(var i = 0; i < mnxh.length; i++) {
			var idValue = "mnxhqh_" + mnxh[i];
			var active = chooseIndexs.indexOf(i) > -1;
		    var liStyle = "";
			if(i<11){
				liStyle = "rgb(182, 251, 187)"; 
		    }else if(11 <= i && i < 22){
		    	liStyle = "#EAC4CF"; 
		    }else if(22 <= i && i < 33){
		    	liStyle = "#C7E7E6"; 
		    }
			
		  str = str + "<li id='" + idValue + "' style = 'background:"+liStyle+";color:"+liStyle+";' class=" + (active ? "active" : "  ") + ">" + mnxh[i] + "</li>";
		}
		$(".wrap #ul").html(str);
	}
	function move(direction) {
		var isLeft = direction < 0; // 向左移动
		return function() {
			for(var i = 0; i < chooseIndexs.length; i++) {
				var value = chooseIndexs[i];
				if(isLeft) {
					if(value === 0) {
						chooseIndexs.splice(i, 1, mnxh.length - 1)
					} else {
						chooseIndexs.splice(i, 1, value - 1)
					}
				} else {
					if(value === mnxh.length - 1) {
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
	for(var b = 0; b < 33; b++) {
		var liStyle = "";
			if(b<11){
				liStyle = "rgb(182, 251, 187)"; 
		    }else if(11 <= b && b < 22){
		    	liStyle = "#EAC4CF"; 
		    }else if(22 <= b && b < 33){
		    	liStyle = "#C7E7E6"; 
		    }
			table_td = table_td +"<li style = 'background:"+liStyle+";color:"+liStyle+";'></li>"
	}
	$(".ul1").html(table_td);
	
	

	$(".wrap").on("click", "li", choose);
	$('.right').on('click', move(1));
	$('.left').on('click', move(-1));

	render();

	$(".qingkong").click(function() {
		chooseIndexs.length = 0;
		$(".active").removeClass("active");

	});
});

/************VIP选号**********/
/*非会员禁用vip模块  */


var sepeator = "-";

function arr(ds, zh) {
	var testResult = combineData(zh, ds);
	var erdang_Arr = [];
	for(var i = 0; i < testResult.length; i++) {
		var temp = testResult[i][0];
		for(var j = 1; j < ds; j++) {
			temp += sepeator + testResult[i][j];
		}
		erdang_Arr.push(temp);
	}
	return erdang_Arr;
}

function vip_ds() {
	xbIndex = 0;
	vip_mk();
}

var zuhe_Arr =[];

function vip_mk() {
	
	//生成按钮组
	var $ul = $(".ul_xh"); //得到下拉列表
	var selected_ds = document.getElementById("sel").value;  //得到下拉列表的值
	var data = zuhe_Arr[selected_ds]; //01-02,01-03
	
	var $btn_group = $(".btn_group"); //得到按钮组
	
	//得到下拉列表框是否禁用状态
	
	//---------------------------------------------------
    var status = document.getElementById("sel").disabled;
    //----------------------------------------------------
   
	var lastFirst = null;
	for(var i = 0; i < data.length; i++) {  
		var dataAll = data[i];
		var dataAll_zh = dataAll.split(sepeator);
	
		//生成按钮组
		var dataNow = null;
		var count = 0;
		$btn_group.empty();
		for(var j = 0; j < data.length; j++) {
			var dataAll = data[j];
			var dataAll_zh = dataAll.split(sepeator);
			var d0 = dataAll_zh[0]; //得到每个组合的第一个数字
			if(d0 != dataNow) {
				count++;
				dataNow = d0;
				if(count > 5) {
					
					//----------------------------------------
					var $btn_data = null;
					if (status)
					   $btn_data = $("<button disabled class='btn btn-primary btn-sm btt' value=" + dataAll + " >" + d0 + "+</button>");
					else
					   $btn_data = $("<button  class='btn btn-primary btn-sm btt' value=" + dataAll + " >" + d0 + "+</button>");
					//-----------------------------------------
					   
					   
					$btn_data.click(function() {
						var oldData = $(this).val();
						//									alert(oldData);
						var selected_ds = document.getElementById("sel").value;
						var data = zuhe_Arr[selected_ds];
						for(var i = 0; i < data.length; i++) {
							var dataAll = data[i];
							if(oldData == dataAll) {
								xbIndex = i;
								vip_mk();
							}
						}
					});
					$btn_group.append($btn_data);
					break;
				} else {
					
					//------------------------------------------------------
					var $btn_data = null;
					if (status)
					    $btn_data = $("<button disabled class='btn btn-primary btn-sm btt' value=" + dataAll + " >" + d0 + "</button>");
					else
					    $btn_data = $("<button class='btn btn-primary btn-sm btt' value=" + dataAll + " >" + d0 + "</button>");
					//--------------------------------------------------------
					    
					    
					$btn_data.click(function() {
						var oldData = $(this).val();//alert(oldData);
						var selected_ds = document.getElementById("sel").value;
						var data = zuhe_Arr[selected_ds];
						for(var i = 0; i < data.length; i++) {
							var dataAll = data[i];
							if(oldData == dataAll) {
								xbIndex = i;
								vip_mk();
							}
						}
					});
					$btn_group.append($btn_data);
				}
			}
		}

	}

//	var $left_index = $(".left_index");
//	var $right_index = $(".right_index");
//	if(xbIndex == 0) {
//		$left_index.attr({
//			"disabled": "disabled"
//		});
//	} else if(xbIndex == (data.length - 1)) {
//		$right_index.attr({
//			"disabled": "disabled"
//		});
//	}
	
	$ul.empty(); //清空上一个选项的内容
	var dataStr = data[xbIndex];
	var dataArr = dataStr.split(sepeator);

	//移除上一个组合的样式
	var id = "#mnxhqh_";
	for(var i = 1; i < 34; i++) {
		var data = "";
			data = id + i;
		$(data).removeClass("active");
	}
	chooseIndexs = [];

	//生成li组合并设置样式
	for(var j = 0; j < dataArr.length; j++) {
		var $li = $("<li>" + dataArr[j] + "</li>").toggleClass("opt");
		var id1 = id + dataArr[j];
		var mnStyle_qh1 = $(id1).toggleClass("active");
		$ul.append($li);
	    //chooseIndexs.push(mnxh.indexOf(dataArr[j]));
	}
}

$(function(){
	
	//固定二档
	var num1 = [1, 2, 3, 11, 12, 13, 21, 22, 23, 31, 32, 33];
	var data1 = arr(2, num1);
	zuhe_Arr.push(data1);
//	console.log(data1.length+"=========>\n"+data1);

	//固定三档
	var num2 = [1, 2, 3, 11, 12, 13, 21, 22, 23, 31, 32, 33];
	var data2 = arr(3, num2);
	zuhe_Arr.push(data2);

	//一区二档
	var num3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
	var data3 = arr(2, num3);
	zuhe_Arr.push(data3);

	//一区三档
	var num4 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
	var data4 = arr(3, num4);
	zuhe_Arr.push(data4);

	//二区二档
	var num5 = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
	var data5 = arr(2, num5);
	zuhe_Arr.push(data5);

	//二区三档
	var num6 = [12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
	var data6 = arr(3, num6);
	zuhe_Arr.push(data6);

	//三区二档
	var num7 = [23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33];
	var data7 = arr(2, num7);
	zuhe_Arr.push(data7);

	//三区三档
	var num8 = [23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33];
	var data8 = arr(3, num8);
	zuhe_Arr.push(data8);
	vip_ds();
	var $right_index = $("#btnRight");
	$right_index.click(function() {
		var selected_ds = document.getElementById("sel").value;  //得到下拉列表的值
	    var data = zuhe_Arr[selected_ds]; //01-02,01-03
	    if (xbIndex==data.length)
	       return;
		xbIndex++;
		vip_mk();
	});
	var $left_index = $(".left_index");
	$left_index.click(function() {
		if (xbIndex<0) return;
		xbIndex--;
		vip_mk();
	});
	
	
});

function preview_li(oldData) {
	var selected_ds = document.getElementById("sel").value;
	var data = zuhe_Arr[selected_ds];
	for(var i = 0; i < data.length; i++) {
		var dataAll = data[i];
		if(oldData == dataAll) {
			xbIndex = i;
			vip_mk();
		}
	}
}



window.setTimeout(function(){
	$("#ul>li").removeClass("active");
	
},300);







