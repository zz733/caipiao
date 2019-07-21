/** **********走势图********* */
// 初始化数据
getTableData();


/***
 *  0-9  10位数字
 *  0-4  5位数字
 *  
 *  a-g  7位数字
 *  a-d  4位数字
 */

function paddingData(data) {
	var $table = $("#qswsTu");
	/*for (var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		// 期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[tdArr.length - 2]);
		$tr.append($td);
		var trArrIndex = 0;
		// 红球
		var x = 0;
		var y = 0;
		var z = 0;
	}*/
	
	for (var i = 0; i < data.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#F1F1D6"); //底色
		var trArr = data[i];//数据
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(trArr[0]);
		$tr.append($td);
		var trArrIndex = 0;
		var last = -1;
	for(var j = 0; j < 11; j++){ //12列
		var $td = $("<td></td>").toggleClass("tdSecond");
			for(var x = 0; x < data[i].length; x++) { //二维数组当中的每一个数据
				if(j == 0 || j == 7) {
					//判断如果第一组的数据为第一列的值，则该列将填进入该值
					if(data[i][x] == 1 || data[i][x] == 8 || data[i][x] == 15 || data[i][x] == 22 || data[i][x] == 29) {
						$td.css("background-color","#990000").css("color","white").css("font-weight","bold");
						$td.text('a'); 
					}
				}
				if(j == 1 || j == 8) {
					//判断如果第二组的数据为第二列的值，则该列将填进入该值
					if(data[i][x] == 2 || data[i][x] == 9 || data[i][x] == 16 || data[i][x] == 23 || data[i][x] == 30) {
						$td.css("background-color","#990000").css("color","white").css("font-weight","bold");
						$td.text('b'); 
					}
				}
				if(j == 2 || j == 9) {
					//判断如果第二组的数据为第二列的值，则该列将填进入该值
					if(data[i][x] == 3 || data[i][x] == 10 || data[i][x] == 17 || data[i][x] == 24 || data[i][x] == 31) {
						$td.css("background-color","#990000").css("color","white").css("font-weight","bold");
						$td.text('c'); 
					}
				}
				if(j == 3 || j == 10) {
					//判断如果第二组的数据为第二列的值，则该列将填进入该值
					if(data[i][x] == 4 || data[i][x] == 11 || data[i][x] == 18 || data[i][x] == 25 || data[i][x] == 32) {
						$td.css("background-color","#990000").css("color","white").css("font-weight","bold");
						$td.text('d'); 
					}
				}
				if(j == 4) {
					//判断如果第二组的数据为第二列的值，则该列将填进入该值
					if(data[i][x] == 5 || data[i][x] == 12 || data[i][x] == 19 || data[i][x] == 26 || data[i][x] == 33) {
						$td.css("background-color","#990000").css("color","white").css("font-weight","bold");
						$td.text('e'); //期号
					}
				}
				if(j == 5) {
					//判断如果第二组的数据为第二列的值，则该列将填进入该值
					if(data[i][x] == 6 || data[i][x] == 13 || data[i][x] == 20 || data[i][x] == 27 || data[i][x] == 34) {
						$td.css("background-color","#990000").css("color","white").css("font-weight","bold");
						$td.text('f'); 
					}
				}
				if(j == 6) {
					//判断如果第二组的数据为第二列的值，则该列将填进入该值
					if(data[i][x] == 7 || data[i][x] == 14 || data[i][x] == 21 || data[i][x] == 28 || data[i][x] == 35) {
						$td.css("background-color","#990000").css("color","white").css("font-weight","bold");
						$td.text('g'); 
					}
				}
			}
			$tr.append($td);
		}
		$table.append($tr);
	}
		/*for (var k=0;k<tdArr.length-1;k++)
		{
			  if (parseInt(tdArr[k]) % 3 == 0)
				x++;
		      else if (parseInt(tdArr[k]) % 3 == 1)
				y++;
		      else if (parseInt(tdArr[k]) % 3 == 2)
				z++;	
		}
		var last = -1;*/
		
		//总共有10列 即0-9，现在为a-g ，即相当于0-6，7位数字
		/*for (var j = 0; j < 7; j++) { // 列数
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
		}*/

		// 0-4的尾数
		//trArrIndex = 0;
		
		//原本为0-4，即为有5位数字，现在为a-d，即0-3，存在有4位数字
	/*	for (var j = 0; j < 4; j++) { // 列数
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
		}*/
		
		/*last = -1;
		for (var j = 1; j < 4; j++) { // 列数
			var $td = $("<td width='30px'></td>");
			if (j == 1) {
				$td.css("background-color", "#FF9999");
				$td.text(x);
			} else if (j == 2) {
				$td.css("background-color", "#99CCCC");
				$td.text(y);
			} else if (j == 3) {
				$td.css("background-color", "#CCFF66");
				$td.text(z);
			}
			$tr.append($td);
		}*/

		//$table.append($tr);
	
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
	$.ajax(getRootPath() + "/daletou.do?p=get3d1", {
				type : 'get',
				timeout : 10000,
				dataType : 'json',
				success : function(data) {
					/*var trArr = [];
					for (var i = 0; i < data.length; i++) {
						var tdArr = [];
						tdArr[0] = data[i][0]; // 期号
						for (var j = 1; j < 7; j++) {
							tdArr[j] = (data[i][j]);
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
					}*/
					paddingData(data);
				},
				error : function(xhr, type, errorThrown) {
					// 异常处理；
					alert("您好，请检查一下您的网络是否异常！")
				}
			});

	// 返回二维数组结果
	return tableData;
}

/** **********模拟选号********* */
mnxh = ["a", "b", "c", "d", "e", "f", "g"];//原本为0-9 ，现在为a-g,相当于0-6
mnxh2 = ["a", "b", "c", "d"];// 原本为0-4 ，现在为a-d，相当于0-3
chooseIndexs = []; // 选中的下标
$(document).ready(function() {
	function choose() {
		$(this).toggleClass("active");
		var $ul = $(this).parent();
		// var max = $ul.children(".active").length; // 选中的数量
		// if (max > 6) {
		// $(this).removeClass("active");
		// layer.msg('最多只能选择6个');
		// return; // 增加return，阻止代码继续执行
		// }
		var text = $(this).text(); // 选中的文本
		var index = mnxh.indexOf(text); // 选中的文本的下标
		
		if (index <= 3) {//如果选中的下标在范围之内，即原本为0-4，现在为a-d,即0-3  
			var rightIndex = index + 7;//将index加7
			$ul.children("li").eq(rightIndex).toggleClass("active");
		}

		if (index >= 10) {//原本为0-9，10个数字，现在为0-6
			var leftIndex = index - 10;
			$ul.children("li").eq(leftIndex).toggleClass("active");
		}

		if (chooseIndexs.indexOf(index) > -1) {//在选中的下标数组chooseIndexs当中，当前该下标数值的大小在数组当中如果大于-1
			chooseIndexs.splice(chooseIndexs.indexOf(index), 1);//将当前该下标值所对应的内容分离该数组
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

	function render() {
		var str = "";
		//console.log(chooseIndexs);
		for (var i = 0; i < mnxh.length; i++) {
			var idValue = "mnxhqh_" + mnxh[i];
			var active = chooseIndexs.indexOf(i) > -1;
			str = str + "<li class='" + idValue + " "
					+ (active ? "active" : "") + "' " + ">" + mnxh[i] + "</li>";
		}
		for (var i = 0; i < mnxh2.length; i++) {
			var idValue = "mnxhqh_" + mnxh2[i];
			var active = chooseIndexs.indexOf(i) > -1;
			str = str + "<li class='" + idValue + " "
					+ (active ? "active" : "") + "'" + ">" + mnxh2[i] + "</li>";
		}

		$(".wrap #ul").html(str);
	}

	function move(direction) {
		var isLeft = direction < 0; // 向左移动
		return function() {
			console.log(chooseIndexs);
			for (var i = 0; i < chooseIndexs.length; i++) {
				var value = chooseIndexs[i];
				if (isLeft) {
					if (value === 0) {
						chooseIndexs.splice(i, 1, mnxh.length - 1);
					} else {
						chooseIndexs.splice(i, 1, value - 1);
					}

				} else {
					if (value === mnxh.length - 1) {
						chooseIndexs.splice(i, 1, 0);
					} else {
						chooseIndexs.splice(i, 1, value + 1);
					}
				}
			}
			 //console.log(mnxh);
			render();
		}
	}

	// 模拟选号下的行
	var table_td = "";
	for (var b = 0; b < 11; b++) {
		table_td = table_td
				+ "<li style = 'background:#F1F1D6;margin-left:1px'></li>";
	}
	$(".ul1").html(table_td);

	$(".wrap").on("click", "li", choose);
	$('.right').on('click', move(1));
	$('.left').on('click', move(-1));

	render();

	$(".qingkong").click(function() {
				chooseIndexs.length = 0;

				//console.log(chooseIndexs);
				$(".active").removeClass("active");

			});
});

/** **********vip选号********* */

var sepeator = "-";

// oldData:数组，表示组合的数据来源 combineCount:数字，表示组合的个数，几个几个为一组合

function arr(ds, zh) {
	var testResult = combineData(zh, ds);
	//console.log(testResult);
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

var zuhe_Arr = [];

function vip_mk() {

	var $ul = $(".ul_xh"); // 得到下拉列表
	var selected_ds = document.getElementById("sel").value; // 得到下拉列表的值
	var data = zuhe_Arr[selected_ds]; // 01-02,01-03
	var $btn_group = $(".btn_group"); // 得到按钮组

	// 得到下拉列表框是否禁用状态
	// ---------------------------------------------------
	var status = document.getElementById("sel").disabled;
	// ----------------------------------------------------

	// var lastFirst = null;
	for (var i = 0; i < data.length; i++) {
		var dataAll = data[i];
		var dataAll_zh = dataAll.split(sepeator);

		// 生成按钮组
		var dataNow = null;
		var count = 0;
		$btn_group.empty();
		for (var j = 0; j < data.length; j++) {
			var dataAll = data[j];
			var dataAll_zh = dataAll.split(sepeator);
			var d0 = dataAll_zh[0]; // 得到每个组合的第一个数字
			if (d0 != dataNow) {
				count++;
				dataNow = d0;
				if (count > 5) {
					// ----------------------------------------
					var $btn_data = null;
					if (status)
						$btn_data = $("<button disabled class='btn btn-primary btn-sm btt' value="
								+ dataAll + " >" + d0 + "+</button>");
					else
						$btn_data = $("<button  class='btn btn-primary btn-sm btt' value="
								+ dataAll + " >" + d0 + "+</button>");
					// -----------------------------------------

					$btn_data.click(function() {
								var oldData = $(this).val();
								var selected_ds = document
										.getElementById("sel").value;
								var data = zuhe_Arr[selected_ds];
								for (var i = 0; i < data.length; i++) {
									var dataAll = data[i];
									if (oldData == dataAll) {
										xbIndex = i;
										vip_mk();
									}
								}
							});
					$btn_group.append($btn_data);
					break;
				} else {
					// ------------------------------------------------------
					var $btn_data = null;
					if (status)
						$btn_data = $("<button disabled class='btn btn-primary btn-sm btt' value="
								+ dataAll + " >" + d0 + "</button>");
					else
						$btn_data = $("<button class='btn btn-primary btn-sm btt' value="
								+ dataAll + " >" + d0 + "</button>");
					// --------------------------------------------------------

					$btn_data.click(function() {
								var oldData = $(this).val();
								var selected_ds = document
										.getElementById("sel").value;
								var data = zuhe_Arr[selected_ds];
								for (var i = 0; i < data.length; i++) {
									var dataAll = data[i];
									if (oldData == dataAll) {
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

	$ul.empty(); // 清空上一个选项的内容
	var dataStr = data[xbIndex];
	var dataArr = dataStr.split(sepeator);
	// 移除上一个组合的样式
	var id = ".mnxhqh_";
	for (var i = 0; i < 10; i++) {
		$(id + i).removeClass("active");
	}
	chooseIndexs = [];

	// 生成li组合并设置样式
	for (var j = 0; j < dataArr.length; j++) {
		var $li = $("<li>" + dataArr[j] + "</li>").toggleClass("opt");
		var id1 = id + dataArr[j];
		// alert($(id1).length);
		for (var i = 0; i < $(id1).length; i++) {
			var mnStyle_qh1 = $($(id1)[i]).toggleClass("active");
		}
		$ul.append($li);
		chooseIndexs.push(mnxh.indexOf(dataArr[j]));
	}
}

$(function() {

			var num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

			// 选四
			var data1 = arr(4, num);
			zuhe_Arr.push(data1);
			// alert("选四组合数量："+data1.length+"个"+data1);
			//console.log("选四组合数量：" + data1.length + "个\n" + data1);
			// 选五
			var data2 = arr(5, num);
			zuhe_Arr.push(data2);
			// alert("选五组合数量："+data2.length+"个"+data2);

			// 选六
			var data3 = arr(6, num);
			zuhe_Arr.push(data3);
			// alert("选六组合数量："+data3.length+"个"+data3);

			vip_ds();
			var $right_index = $(".right_index");
			$right_index.click(function() {
						var selected_ds = document.getElementById("sel").value; // 得到下拉列表的值
						var data = zuhe_Arr[selected_ds]; // 01-02,01-03
						if (xbIndex == data.length)
							return;

						xbIndex++;
						vip_mk();
					});
			var $left_index = $(".left_index");
			$left_index.click(function() {
						if (xbIndex < 0)
							return;

						xbIndex--;
						vip_mk();
					});
		});

function preview_li(oldData) {
	var selected_ds = document.getElementById("sel").value;
	var data = zuhe_Arr[selected_ds];
	for (var i = 0; i < data.length; i++) {
		var dataAll = data[i];
		if (oldData == dataAll) {
			xbIndex = i;
			vip_mk();
		}
	}
}
window.setTimeout(function(){
	$("#ul>li").removeClass("active");
	
},200);