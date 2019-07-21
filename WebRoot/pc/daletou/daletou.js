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
		$tr.css("background-color","#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text(tdArr[tdArr.length - 2]);
		$tr.append($td);
		var trArrIndex = 0;
		var x = 0 ;
		var y = 0 ;
		var z = 0 ;
		var a = 0 ;
		var b = 0 ;
		//红球
		for(var j = 1; j < 36; j++) { //列数
			var $td = $("<td></td>");
			if(j != parseInt(tdArr[trArrIndex])) {
				if(j<=7)
					$td.css("background-color", "#FFFACD"); 
				else if(8 <= j && j <=14)
					$td.css("background-color", "#CDFCBA");
				else if(15 <= j && j <= 21)
				  $td.css("background-color", "#FFFACD"); 
				else if(22 <= j && j <= 28)
				  $td.css("background-color", "#CDFCBA"); 
				else if(29 <= j && j <= 35)
					$td.css("background-color", "#FFFACD"); 
					$td.text("  ");
			} else {
				$td.css("color", "white"); //字体颜色
				if(j <= 7){
					$td.text(tdArr[trArrIndex]);
				    x++;
				}
				else if(8 <= j && j <= 14){
					$td.text(tdArr[trArrIndex]);
				    y++;
				}
				else if(15 <= j && j <= 21){
					$td.text(tdArr[trArrIndex]);
				    z++;
				}
				else if(22 <= j && j <= 28){
					$td.text(tdArr[trArrIndex]);
				    a++;
				}
				else if(29 <= j && j <= 35){
					$td.text(tdArr[trArrIndex]);
				    b++;
				}
				$td.css("background-color", "#107C10"); //球的背景颜色
				if(trArrIndex != tdArr.length- 1 ) trArrIndex++;
			}
			$tr.append($td);
		}
		for(var j = 0; j < 5; j++) { //列数
			var $td = $("<td></td>");
			if(j==0)
				$td.text(x);
			else if(j==1)
			    $td.text(y);
			else if(j==2)
			    $td.text(z);
			else if(j==3)
			    $td.text(a);
			else if(j==4)
				$td.text(b);
			$tr.append($td);
		}
		$table.append($tr);
	}
//	模拟选号一行
	for(var i=0;i<1;i++){
		var $tr = $("<tr id='tr'></tr>").toggleClass("mm");
		$tr.css("background-color","#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text("模拟选号");
		$tr.append($td);
		for(var j = 1; j < 36; j++) { //列数
			var $td = $("<td class='one'></td>");
			//$td.toggleClass("one");
			if(j != parseInt(tdArr[trArrIndex])) {
				if(j<=7){
					$td.css("background-color", "#FFFACD").css("color",'#FFFACD');; 
					//$td.addClass("one");//.addClass("one1");
					$td.text(j);
				}
				else if(8 <= j && j <=14){
					$td.css("background-color", "#CDFCBA").css("color",'#CDFCBA');
					//$td.addClass("one");//.addClass("one1");.addClass("one2");
					$td.text(j);
				}
				else if(15 <= j && j <= 21){
					//$td.addClass("one");//.addClass("one1");.addClass("one3");	
					$td.css("background-color", "#FFFACD").css("color",'#FFFACD');
					$td.text(j);
				}
				else if(22 <= j && j <= 28){
					//$td.addClass("one");//.addClass("one1");.addClass("one4");	
					$td.css("background-color", "#CDFCBA").css("color",'#CDFCBA'); 
					$td.text(j);
				}
				else if(29 <= j && j <= 35){
					//$td.addClass("one");//.addClass("one1");.addClass("one5");	
					$td.css("background-color", "#FFFACD").css("color",'#FFFACD');
					$td.text(j);
				}
			} else {
				$td.css("color", "white"); //字体颜色
				
				if(j <= 7){
					$td.text(tdArr[trArrIndex]);
				    x++;
				}
				else if(8 <= j && j <= 14){
					$td.text(tdArr[trArrIndex]);
				    y++;
				}
				else if(15 <= j && j <= 21){
					$td.text(tdArr[trArrIndex]);
				    z++;
				}
				else if(22 <= j && j <= 28){
					$td.text(tdArr[trArrIndex]);
				    a++;
				}
				else if(29 <= j && j <= 35){
					$td.text(tdArr[trArrIndex]);
				    b++;
				}
			}
			$tr.append($td);
		}
		$table.append($tr);
	}
//	模拟选号下两行
	for(var i=0;i<2;i++){
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color","#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.toggleClass("tdIssue");
		$td.text("");
		$tr.append($td);
		for(var j = 1; j < 36; j++) { //列数
			var $td = $("<td></td>");
			if(j != parseInt(tdArr[trArrIndex])) {
				if(j<=7)
					$td.css("background-color", "#FFFACD");
				else if(8 <= j && j <=14)
					$td.css("background-color", "#CDFCBA");
				   
				else if(15 <= j && j <= 21)
				    $td.css("background-color", "#FFFACD"); 
				  
				else if(22 <= j && j <= 28)
				  $td.css("background-color", "#CDFCBA");
				
				else if(29 <= j && j <= 35)
					$td.css("background-color", "#FFFACD"); 
					$td.text("  ");
			} else {
				$td.css("color", "white"); //字体颜色
				if(j <= 7){
					$td.text(tdArr[trArrIndex]);
				    x++;
				}
				else if(8 <= j && j <= 14){
					$td.text(tdArr[trArrIndex]);
				    y++;
				}
				else if(15 <= j && j <= 21){
					$td.text(tdArr[trArrIndex]);
				    z++;
				}
				else if(22 <= j && j <= 28){
					$td.text(tdArr[trArrIndex]);
				    a++;
				}
				else if(29 <= j && j <= 35){
					$td.text(tdArr[trArrIndex]);
				    b++;
				}
//				$td.css("background-color", "#AE0000"); //球的背景颜色
//				if(trArrIndex != tdArr.length- 1 ) trArrIndex++;
			}
			$tr.append($td);
		}
		$table.append($tr);
	}
	
	
	
	var zimu = ["a", "b", "c", "d", "e", "f", "g"];
	for(var i=0;i<1;i++){
		var $tr = $("<tr></tr>").toggleClass("trStyle");
		$tr.css("background-color","#EAEEEE"); //底色
		var trArr = tableData[i];
		//数据
		var tdArr = trArr[i];
		//期号
		var $td = $("<td></td>");
		$td.css("background-color","#FFFFFF");
		$td.toggleClass("tdIssue");
		$tr.append($td);
		for(var j = 1; j < 36; j++) { //列数
			var $td = $("<td></td>");
			if(j != parseInt(tdArr[trArrIndex])) {
				if(j<=7){
					$td.css("background-color", "#FFFACD").css("color","#330033").css("font-weight","bold").css("font-size","17px");
					$td.text(zimu[j-1]);
				}
				else if(8 <= j && j <=14){
					$td.css("background-color", "#CDFCBA").css("color","#330033").css("font-weight","bold").css("font-size","17px");
					$td.text(zimu[j-8]);	
				}
				else if(15 <= j && j <= 21){
					$td.css("background-color", "#FFFACD").css("color","#330033").css("font-weight","bold").css("font-size","17px");
					$td.text(zimu[j-15]);	
				}
				else if(22 <= j && j <= 28){
					$td.css("background-color", "#CDFCBA").css("color","#330033").css("font-weight","bold").css("font-size","17px");
					$td.text(zimu[j-22]);	
				}
				else if(29 <= j && j <= 35){
					$td.css("background-color", "#FFFACD").css("color","#330033").css("font-weight","bold").css("font-size","17px"); 
					$td.text(zimu[j-29]);	
				}
			} 
			$tr.append($td);
		}
		$table.append($tr);
	}
}

/*
$(document).on("click",".one1",function(){
	$(this).toggleClass("active");
	
})
$(document).on("click",".one2",function(){
	$(this).toggleClass("active2");
})
$(document).on("click",".one3",function(){
	$(this).toggleClass("active3");
})
$(document).on("click",".one4",function(){
	$(this).toggleClass("active4");
})
$(document).on("click",".one5",function(){
	$(this).toggleClass("active5");
})
*/

//获取数据
function getTableData() {
	var tableData = []; //解析后的数据的二维数组,一维放一行的数据（[]）,二维放列的值
	$.ajax(getRootPath() +"/daletou.do?p=get3d1", {
		type: 'get',
		timeout: 10000,
		dataType: 'json',
		success: function(data) {
				var trArr =  [];
				for (var i = 0; i < data.length; i++){
 						var tdArr =  [];
 						tdArr[0] = data[i][0]; //期号
 						for (var j = 1; j < 7; j++) {//+
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
var mnxh = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33","34","35"];
//$(document).ready(function() {
	
	function choose() {
		//alert(1)
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
       
       
		if(chooseIndexs.indexOf(index) > -1) {
			chooseIndexs.splice(chooseIndexs.indexOf(index), 1);
		} else {
			chooseIndexs.push(index);
		}
		// 

		var cstr = $ul.children(".active").text();
		if($(this).hasClass("active")) {
			$(".myselt").val(cstr);
		} else {
			$(".myselt").val(cstr);;
		}
	}

	function render() {
		var str = "<td class='tdIssue'>模拟选号</td>";
//		console.log(chooseIndexs);
		//$td.toggleClass("tdIssue");
		//$td.text("模拟选号");
		
		for(var i = 0; i < mnxh.length; i++) {
			var idValue = "mnxhqh_" + mnxh[i];
			var active = chooseIndexs.indexOf(i) > -1;
		    var liStyle = "";
			if(i<7){
				liStyle = "#FFFACD"; 
		    }else if(7 <= i && i < 14){
		    	liStyle = "#CDFCBA"; 
		    }else if(14 <= i && i < 21){
		    	liStyle = "#FFFACD"; 
		    }
		    else if(21 <= i && i < 28)
		    {
		    	liStyle = "#CDFCBA"; 
		    }
		    else
		    {
		    	liStyle = "#FFFACD"; 
		    }
		  str = str + "<td id='" + idValue + "' style = 'background:"+liStyle+";color:"+liStyle+";' class=" + (active ? "active" : "\'\'") + ">" + mnxh[i] + "</td>";
		}
		//alert(str);
		$("#tr").html(str);
	}

	function move(direction) {
		
		var isLeft = direction < 0; // 向左移动
		
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
			console.log(chooseIndexs);
//			console.log(mnxh)
			render();
		
	}

	//模拟选号下的行
	/*
	var table_td = "";
	for(var b = 0; b < 33; b++) {
		var liStyle = "";
			if(b<11){
				liStyle1 = "#B6FBBB"; 
		    }else if(11 <= b && b < 22){
		    	liStyle = "#EAC4CF"; 
		    }else if(22 <= b && b < 33){
		    	liStyle = "#C7E7E6"; 
		    }
			table_td = table_td +"<li style = 'background:"+liStyle+";color:"+liStyle1+";'></li>"
	}
	$(".ul1").html(table_td);
	*/
	$(document).on("click",".one", choose);
	//$(document).on("click",".right",  move(1));
	//$(document).on("click",".left", move(-1));
	//$(".one").on("click", "li", choose);
	$('.right').on('click', function(){move(1);});
	$('.left').on('click', function(){move(-1);});

	
	$(".qingkong").click(function() {
		chooseIndexs.length = 0;
		$(".active").removeClass("active");
		/*$(".active2").removeClass("active2");
		$(".active3").removeClass("active3");
		$(".active4").removeClass("active4");
		$(".active5").removeClass("active5");*/
	});
//});
window.setTimeout(function(){
	$("#ul>li").removeClass("active");
},200);

/*
$(".right").click(function() {
	var $tdindex1 = $(".active");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one1").removeClass("active");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==7){
			$(".one1").eq(0).addClass("active");
		}
		else{  
			$(".one1").eq(act1*1).toggleClass("active");
		}
	}

	var $tdindex2 = $(".active2");
	var tmp2 = [];
	for(var i=$tdindex2.length-1;i>=0;i--){
	    tmp2.push($tdindex2.eq(i).html());
	}
	$(".one2").removeClass("active2");
	for(var i=0;i<tmp2.length;i++){
		var act2 = tmp2[i];
		if(act2==14){
			$(".one2").eq(0).addClass("active2");
		}
		else{ 
			$(".one2").eq(act2-7).toggleClass("active2");
		}
	}
	var $tdindex3 = $(".active3");
	var tmp3 = [];
	for(var i=$tdindex3.length-1;i>=0;i--){
	    tmp3.push($tdindex3.eq(i).html());
	}
	$(".one3").removeClass("active3");
	for(var i=0;i<tmp3.length;i++){
		var act3 = tmp3[i];
		if(act3==21){
			$(".one3").eq(0).addClass("active3");
		}
		else{ 
			$(".one3").eq(act3-14).toggleClass("active3");
		}
	}
	var $tdindex4 = $(".active4");
	var tmp4 = [];
	for(var i=$tdindex4.length-1;i>=0;i--){
	    tmp4.push($tdindex4.eq(i).html());
	}
	$(".one4").removeClass("active4");
	for(var i=0;i<tmp4.length;i++){
		var act4 = tmp4[i];
		if(act4==28){
			$(".one4").eq(0).addClass("active4");
		}
		else{ 
			$(".one4").eq(act4-21).toggleClass("active4");
		}
	}
	var $tdindex5 = $(".active5");
	var tmp5 = [];
	for(var i=$tdindex5.length-1;i>=0;i--){
	    tmp5.push($tdindex5.eq(i).html());
	}
	$(".one5").removeClass("active5");
	for(var i=0;i<tmp5.length;i++){
		var act5 = tmp5[i];
		if(act5==35){
			$(".one5").eq(0).addClass("active5");
		}
		else{ 
			$(".one5").eq(act5-28).toggleClass("active5");
		}
	}
}) 
$(".left").click(function() {
	var $tdindex1 = $(".active");
	var tmp1 = [];
	for(var i=$tdindex1.length-1;i>=0;i--){
	    tmp1.push($tdindex1.eq(i).html());
	}
	$(".one1").removeClass("active");
	for(var i=0;i<tmp1.length;i++){
		var act1 = tmp1[i];
		if(act1==1){
			$(".one1").eq(6).addClass("active");
		}
		else{  
			$(".one1").eq(act1*1-2).toggleClass("active");
		}
	}
	var $tdindex2 = $(".active2");
	var tmp2 = [];
	for(var i=$tdindex2.length-1;i>=0;i--){
	    tmp2.push($tdindex2.eq(i).html());
	}
	$(".one2").removeClass("active2");
	for(var i=0;i<tmp2.length;i++){
		var act2 = tmp2[i];
		if(act2==8){
			$(".one2").eq(6).addClass("active2");
		}
		else{ 
			$(".one2").eq(act2-9).toggleClass("active2");
		}
	}
	var $tdindex3 = $(".active3");
	var tmp3 = [];
	for(var i=$tdindex3.length-1;i>=0;i--){
	    tmp3.push($tdindex3.eq(i).html());
	}
	$(".one3").removeClass("active3");
	for(var i=0;i<tmp3.length;i++){
		var act3 = tmp3[i];
		if(act3==15){
			$(".one3").eq(6).addClass("active3");
		}
		else{ 
			$(".one3").eq(act3-16).toggleClass("active3");
		}
	}
	var $tdindex4 = $(".active4");
	var tmp4 = [];
	for(var i=$tdindex4.length-1;i>=0;i--){
	    tmp4.push($tdindex4.eq(i).html());
	}
	$(".one4").removeClass("active4");
	for(var i=0;i<tmp4.length;i++){
		var act4 = tmp4[i];
		if(act4==21){
			$(".one4").eq(6).addClass("active4");
		}
		else{ 
			$(".one4").eq(act4-23).toggleClass("active4");
		}
	}
	var $tdindex5 = $(".active5");
	var tmp5 = [];
	for(var i=$tdindex5.length-1;i>=0;i--){
	    tmp5.push($tdindex5.eq(i).html());
	}
	$(".one5").removeClass("active5");
	for(var i=0;i<tmp5.length;i++){
		var act5 = tmp5[i];
		if(act5==28){
			$(".one5").eq(6).addClass("active5");
		}
		else{ 
			$(".one5").eq(act5-30).toggleClass("active5");
		}
	}
}) */

