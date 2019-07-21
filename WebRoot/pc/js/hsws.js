//初始化数据
tableData = getTableData();
var $table = $("#hswsTu");

function paddingData() {
	for(var i = 0; i < tableData.length; i++) {
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color", "#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[3]);
		$tr.append($td);
		var trArrIndex = 0;
		//0-9的尾数
		var last = -1;
		for(var j = 0; j < 10; j++) { //列数
			var $td = $("<td></td>").toggleClass("tdFirst");
			if(j != parseInt(tdArr[trArrIndex])) { //1,6,7
				$td.text("  ");
				if (last==tdArr[trArrIndex])
					trArrIndex++;
			} else {
				last = tdArr[trArrIndex];  //1
				$td.css("color", "white"); //字体颜色
				$td.text(tdArr[trArrIndex]);
				$td.css("background-color", "#013300"); //球的背景颜色
				if(trArrIndex != tdArr.length - 2) trArrIndex++;
			}
			$tr.append($td);
		}
		trArrIndex = 0;
		last = -1;
		//0-4的尾数
		for(var j = 0; j < 5; j++) { //列数
			var $td = $("<td></td>").toggleClass("tdSecond");
			if(j != parseInt(tdArr[trArrIndex])) {
				$td.text("  ");
				if (last==tdArr[trArrIndex])
					trArrIndex++;
			} else {
				//				alert(tdArr[trArrIndex]);
				last = tdArr[trArrIndex];
				$td.css("color", "white"); //字体颜色
				$td.text(tdArr[trArrIndex]);
				$td.css("background-color", "#013300"); //球的背景颜色
				if(trArrIndex != tdArr.length - 2) trArrIndex++;
			}
			$tr.append($td);
		}
		$table.append($tr);
	}
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
	if (projectName == "/pc" || projectName == "/admin" || projectName == "/weixin")
		projectName = "";

	return (localhostPaht + projectName);
}
//获取数据
function getTableData() {
	var isTest = false;
	var tableData = new Array(); //解析后的数据的二维数组,一维放一行的数据（[]）,二维放列的值
	if(isTest) {
		//暂时模拟设置本地数据
		for(var i = 0; i < 30; i++) { //行数
			var trArr = new Array();
			trArr[0] = issue;
			for(var j = 0; j < 3; j++) {
				trArr[j] = (randomNodumpDigital(trArr) + "").substring(1);
			}
			trArr.sort(function(a, b) {
				return a - b
			});

			tableData[i] = trArr;
		}
	} else {
		$.ajax(getRootPath()+"/record?page=0&size=30", {
			type: 'get',
			timeout: 10000,
			success: function(data) {
				alert(data.content.length)
				for(var i = 0; i < data.numberOfElements; i++) {
					var trArr = [];
					for(var j = 0; j < data.content.length; j++) {
						
						var tdArr = [];
						tdArr[0] = data.content[j].issue; //期号
						var redBallArr = data.content[j].redBall.split("-"); //红球数组
						for(var k = 0; k < 3; k++) {
							tdArr[k + 1] = redBallArr[k].substring(1); //第一个球
						}
						tdArr.sort(function(a, b) {
							return a - b
						});
						trArr[j] = tdArr;
					}
					tableData[i] = trArr;
					//   					alert(trArr);/////
				}
				paddingData();
			},
			error: function(xhr, type, errorThrown) {
				//异常处理；
				alert("您好，请检查一下您的网络是否异常！")
			}

		});

		//TODO 
	}

	//返回二维数组结果
	return tableData;
}

/*生成随机数字*/
function randomNodumpDigital(trArr) {
	var r = Math.floor(Math.random() * (10)) + 1;
	for(var i = 0; i < trArr.length; i++) {
		if(trArr[i] == r) {
			return randomNodumpDigital(trArr);
			break;
		}
	}
	//if(r < 10) r = "0" + r;
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
	 function choose() {
           $(this).toggleClass("active");
           var $ul = $(this).parent();
           var max = $ul.children(".active").length; // 选中的数量
           if (max > 6) {
               $(this).removeClass("active");
               alert("最多只能选择6个");
               return; // 增加return，阻止代码继续执行
           }
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
               $(".myselt").val(cstr);;
           }
       }
	//模拟选号
	
	 var mnxh = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9","0","1", "2", "3", "4"];
	    var chooseIndexs = []; // 选中的下标
	    
	    function render() {
	        var str = "";
	        console.log(chooseIndexs);
	        for (var i = 0; i < mnxh.length; i++) {
	        	var idValue = "mnxhqh_" + mnxh[i];
	            var active = chooseIndexs.indexOf(i) > -1;
	            str = str + "<li class="+ (active ? "active" : "") +">" + mnxh[i] + "</li>";
	        }
	        $(".wrap #ul").html(str);
	    }
	    function move(direction) {
	        var isLeft = direction < 0; // 向左移动
	        return function () {
	            for (var i = 0; i < chooseIndexs.length; i++) {
	                var value = chooseIndexs[i]
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
	            console.log(mnxh)
	            render();
	        }
	    }
	    
	  //模拟选号下的行
	    var table_td = "";
		for(var b = 0; b <15; b++) {
			table_td = table_td + "<button>" + "</button>";
		}
		$(".table_td").html(table_td);

 $(".wrap").on("click", "li", choose);
   $('.right').on('click', move(1));
   $('.left').on('click', move(-1));
   
   render();
   
   $(".qingkong").click(function () { 
   	chooseIndexs.length = 0;

   	console.log(chooseIndexs);
	$(".active").removeClass("active"); 
	
   });
});




//VIP选号
window.onload=function(){
	
	//固定二档
	var num1 = [1, 2, 3, 4, 5, 6, 7, 8, 9];
	var xuan_er = "";
	for(var i = 0; i < num1.length - 1; i++) {
		for(var j = i + 1; j < num1.length; j++) {
			var idValue = num1[i]+"_"+num1[j];
			xuan_er = xuan_er + "<a class='button white' onclick=vipxhData(\""+idValue+"\") >" + num1[i] +"&nbsp;"+ "|"+"&nbsp;" + num1[j] + "</a>";
			document.getElementById("xuan_er").innerHTML = xuan_er;

		}
	}

	//固定三档
	var num2 = [1, 2, 3, 4, 5, 6, 7, 8, 9];;
	var xuan_san = "";

	for(var i = 0; i < num2.length - 1; i++) {
		for(var j = i + 1; j < num2.length; j++) {
			for(var s = j + 1; s < num2.length; s++) {
				xuan_san = xuan_san + "<a class='button white'>" + num2[i] +"&nbsp;"+ "|"+"&nbsp;" + num2[j] +"&nbsp;"+ "|"+"&nbsp;" + num2[s] +"</a>";
				document.getElementById("xuan_san").innerHTML = xuan_san;
			}
		}
	}
	

}


