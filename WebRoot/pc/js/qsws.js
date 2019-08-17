/************前三走势图**********/
//初始化数据
//getTableData();
var size = 0;
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

function paddingData(tableData) {
	var $table = $("#qswsTu");
	for (var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); //底色
		var trArr = tableData[i];//数据
		var tdArr = trArr[i];//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[3]);
		$tr.append($td);
		var trArrIndex = 0;
		var last = -1;
		
		
		
		//0-9的尾数
		for (var j = 0; j < 10; j++) {
			var $td = $("<td></td>").toggleClass("tdFirst");
			if (j != parseInt(tdArr[trArrIndex])) {
				$td.text("  ");
				if (last==tdArr[trArrIndex])
					trArrIndex++;
			} else {
				$td.css("color", "white"); //字体颜色
				$td.text(tdArr[trArrIndex]);
				$td.css("background-color", "#333300"); //球的背景颜色
				last = tdArr[trArrIndex]; //arr[0]=1,arr[1]=1,arr[2]=5
				if (trArrIndex != tdArr.length - 2)
					trArrIndex++;
			}
			$tr.append($td);
		}
		trArrIndex = 0;
		//0-4的尾数
		last = -1;
		for (var j = 0; j < 5; j++) { //列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if (j != parseInt(tdArr[trArrIndex])) {
				$td.text("  ");
				if (last==tdArr[trArrIndex])
					trArrIndex++;
			} else {
				//				alert(tdArr[trArrIndex]);
				last = tdArr[trArrIndex]; 
				$td.css("color", "white"); //字体颜色
				$td.text(tdArr[trArrIndex]);
				$td.css("background-color", "#333300"); //球的背景颜色
				if (trArrIndex != tdArr.length - 2)
					trArrIndex++;
			}
			$tr.append($td);
		}
		$table.append($tr);
	}
}
//获取数据
function getTableData() {
	var isTest = false;
	var tableData = [];
	$.ajax(getRootPath() + "/red.do?p=getRed", {
		type : 'post',
		timeout : 10000,
		dataType : 'json',
		success : function(data) {
			var trArr = [];
			for (var i = 0; i < data.length; i++) {
				var tdArr = [];
				tdArr[0] = data[i][0]; //期号
				for (var j = 1; j < 4; j++) {
					tdArr[j] = (data[i][j]);
					if (tdArr[j] / 10 >= 1) {
						tdArr[j] = (data[i][j] + "").substring(1);
					}
				}
				tdArr.sort(function(a, b) {
					return a - b
				});
				trArr.push(tdArr);
				tableData.push(trArr);
			}
			paddingData(tableData);
		},
		error : function(xhr, type, errorThrown) {
			//异常处理
			alert("您好，请检查一下您的网络是否异常！")
		}
	});
}

//生成随机数字
function randomNodumpDigital(trArr) {
	var r = Math.floor(Math.random() * (10)) + 1;
	for (var i = 0; i < trArr.length; i++) {
		if (trArr[i] == r) {
			return randomNodumpDigital(trArr);
			break;
		}
	}
	if (r < 10)
		r = "0" + r;
	return r;
}

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
$(document)
		.ready(
				function() {
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
							var li = $ul.children("li").eq(index);
							
							if (li.hasClass("active"))
						    {
								var rightIndex = index + 10;
								$ul.children("li").eq(rightIndex).toggleClass("active");
						    }
							else
							{	
								li.toggleClass("active");
							}
						}
                        
                        if (index>=10)
                        {
                        	var leftIndex = index-10;
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
							$(".myselt").val(cstr);
						}
					}

					/************模拟选号**********/
					mnxh = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
					mnxh2 = ["0", "1", "2", "3", "4"];
					chooseIndexs = []; // 选中的下标
					function render() {
						var str = "";
						console.log(chooseIndexs);
						for (var i = 0; i < mnxh.length; i++) {
							var idValue = "mnxhqh_" + mnxh[i];
							var active = chooseIndexs.indexOf(i) > -1;
							str = str + "<li class='" + idValue + " "+(active ? "active" : "")+"' "+">" + mnxh[i] + "</li>";
						}
						for (var i = 0; i < mnxh2.length; i++) {
							var idValue = "mnxhqh_" + mnxh2[i];
							var active = chooseIndexs.indexOf(i) > -1;
							str = str + "<li class='" + idValue + " "+(active ? "active" : "")+"'" +">" + mnxh2[i] + "</li>";
						}
                       
						//$(".wrap #ul").html(str);
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
							//console.log(mnxh)
							render();
						}
					}

					//模拟选号下的行
					var table_td = "";
					for (var b = 0; b < 15; b++) {
						table_td = table_td
								+ "<li style = 'margin-left:1px'></li>";
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

/************VIP选号**********/
var zuhe_Arr = [];
var qhArr_temp = [];
var sepeator = "-";

function vip_zx() {

	var $input_group = $(".input_group"); //得到输入组的div

	//生成输入框组
	for (var i = 0; i < 6; i++) {
		var $input = $("<input type='text' class='form-control in inputClass' onchange='repeat(this)'/>");
		$input_group.append($input);
	}
}

//判断用户输入的值是否重复
function repeat(obj) {
	var objValue = obj.value;
	var isCheckOk = true;
	var arrTemp = [];
	//遍历用户输入的值
	$.each($(".inputClass"), function(index, item) {
		if (obj != item) { //排除自己与自己在数组中的值比较
			var itemValue = item.value;
			if (objValue == itemValue) { //当前用户输入的值与其他的值相同时
				isCheckOk = false;
				return;
			}
			if (itemValue)
				arrTemp.push(itemValue*1);
		}
	});
	if (isCheckOk) {
		arrTemp.push(objValue*1);
		//	  		给输入框中的值排序
		//	  		arrTemp.sort(function(l,n){
		//	  			if(parseInt(l)>parseInt(n)){
		//	  				return 1;
		//	  			}else{
		//	  				return -1;
		//	  			}
		//	  		});
		//覆盖数组
		qhArr_temp = arrTemp;
	} else {
		//清空
		obj.value = "";
		//提示不能重复
		layer.msg('不能输入重复的尾数');
	}
}

function _xuanN(num) {
	xbIndex = 0;
	xuanN(num);
}
function xuanN(num) {
    
	//将num的值变为全局变量
	xuanNum = num;
	

	if (qhArr_temp.length < 4) {
		layer.msg('尾数不能小于4个');
		return;
	}

	//自动生成组合，并放到data数组中
	 var data = combineData(qhArr_temp, num);
	 size = data.length;
	//从data数组中取出第一个组合
	var dataArr = data[xbIndex];

	//console.info(chooseIndexs);

	//移除上一个组合的样式
	var id = ".mnxhqh_";
	for (var i = 0; i < 10; i++) {
		$(id + i).removeClass("active");
	}
	//console.info(chooseIndexs);
	chooseIndexs = [];

	//生成li组合并设置样式
	var $ul = $(".ul_xh"); //得到ul
	$ul.empty();
	var arry = ['模拟选 号'];
	if (dataArr)
	{
		for (var ii=0;ii<10;ii++)
	    {
			if (dataArr.indexOf(ii)>-1)
				{
				  arry.push(ii);
				}
			else
				{
				  arry.push(' ');
				}
	    }	
		
		for (var k=1;k<=5;k++)
			{
			  arry.push(arry[k]);
			}
		
			for (var j = 0; j < dataArr.length; j++) {
				
				var $li = $("<li>" + dataArr[j] + "</li>").toggleClass("li_lf");
				var idName = id + dataArr[j]; 
				for (var i = 0; i < $(idName).length; i++) {
					var mnStyle_qh1 = $($(idName)[i]).toggleClass("active");
				}
				$ul.append($li);
				
				chooseIndexs.push(mnxh.indexOf(dataArr[j]));
				//console.info(chooseIndexs);
			}
			
	    }
	else
		{
		   for (var ii=0;ii<15;ii++)
			   {
			     arry.push(' ');
			   }
		
		}
	   
		app.arry[_index] = arry;
		app.$forceUpdate();
	

	var $left_index = $(".left_index");
	var $right_index = $(".right_index");
	$left_index.removeAttr("disabled");
	$right_index.removeAttr("disabled");
	if (xbIndex == 0) {
		$left_index.attr({
			"disabled" : "disabled"
		});
	} else if (xbIndex == (data.length - 1)) {
		$right_index.attr({
			"disabled" : "disabled"
		});
	}

}

$(function(){

	var $ul = $(".ul_xh"); //得到ul
	xbIndex = 0;
	vip_zx();

	//  左右移的下标加减
	var $right_index = $(".right_index");
	$right_index.click(function() {
		if (size==xbIndex)
		   return;
		xbIndex++;
		$ul.empty(); //清空上一个选项的内容
		xuanN(xuanNum);
	});
	var $left_index = $(".left_index");
	$left_index.click(function() {
		if (xbIndex<0) return;
		xbIndex--;
		
		$ul.empty(); //清空上一个选项的内容
		xuanN(xuanNum);
	});

});
