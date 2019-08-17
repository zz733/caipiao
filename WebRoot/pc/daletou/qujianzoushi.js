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
	
	var arry_new =[];
	var arry = ['#','a','b','c','d','e','f','g'];
	for (var i = 0; i < data.length; i++) {
		_index = data.length;
	   var rowarry = [];
	   rowarry.push(data[i][0]);
	   var tmp = [];
	   for (var j=1;j<=5;j++)
	  {
		 var value = data[i][j]; //1,8
		 var index = value%7;	//1
		 if (index>0)
		   tmp.push(index);    
		 else
		   tmp.push("7")
	  }
	   
	  for (var k=1;k<=7;k++)
	  {
		  if (tmp.indexOf(k)>-1)
		  {
			  rowarry.push(arry[k]);
			  
		  }	
		  else
		 {
			  rowarry.push(' ');   
		 }
	  }
	  
	  for (var k=1;k<=4;k++)
	  {
		  if (tmp.indexOf(k)>-1)
		  {
			  rowarry.push(arry[k]);
			  
		  }	
		  else
		 {
			  rowarry.push(' ');   
		 }
	  }
	  
	  
	  arry_new.push(rowarry)
	  
	}	
	
	 //arry_new.push(rowarry);
		
		
		/*
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
		$table.append($tr);*/
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
	
	//三行模拟选号
	
	
	for (var k=0;k<3;k++)
	{
		var moni = [];
		for (var j=0;j<12;j++)
		{
			if (k==0 && j==0)
			{
				moni.push("模拟选号");
			}
			else
			{
				moni.push(" ");
			}
		}
		arry_new.push(moni);
	}

	//输出 
	//display(arry_new);
	app.arry = arry_new;
	
	
	
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


window.setTimeout(function(){
	$("#ul>li").removeClass("active");
	
},200);