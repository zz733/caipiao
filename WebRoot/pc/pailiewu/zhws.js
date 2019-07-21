/** **********走势图********* */
// 初始化数据
getTableData();

function paddingData(tableData) {
	var $table = $("#zhwsTu");
	for (var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); // 底色
		var trArr = tableData[i];
		// 数据
		var tdArr = trArr[i];
		
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
		}

		$table.append($tr);
	}
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
	$.ajax(getRootPath() + "/red.do?p=getRed", {
				type : 'get',
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

/** **********模拟选号********* */
mnxh = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];// ,"0", "1", "2",
															// "3", "4"
mnxh2 = ["0", "1", "2", "3", "4"];// ,"0", "1", "2", "3", "4"
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

	function render() {
		var str = "";
		console.log(chooseIndexs);
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
			// console.log(mnxh);
			render();
		}
	}

	// 模拟选号下的行
	var table_td = "";
	for (var b = 0; b < 15; b++) {
		table_td = table_td
				+ "<li style = 'background:#EAEEEE;margin-left:1px'></li>";
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
	console.log(testResult);
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
			console.log("选四组合数量：" + data1.length + "个\n" + data1);
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