var zuhe_Arr = [];
var sepeator="-";
var xbIndex = 0;
function arr(ds,zh){
	var testResult = combineData(zh,ds);	
	var erdang_Arr=[];
	for (var i = 0; i < testResult.length; i++) {
		var temp = testResult[i][0];
		for (var j = 1;j < ds; j++) {
			temp += sepeator+testResult[i][j]
		}
		erdang_Arr.push(temp);
	}
	return erdang_Arr;
}


function vip_ds(){
     	xbIndex = 0;
		vip_mk();
}

function vip_mk(){
	    var $ul = $(".ul_xh"); 
		var selected_ds =document.getElementById("sel").value;
    	var data = zuhe_Arr[selected_ds];
    	var $left_index =$(".left_index");
    	var $right_index =$(".right_index");
		$left_index.removeAttr("disabled");
		$right_index.removeAttr("disabled");
		if (xbIndex==0) {
				$left_index.attr({"disabled":"disabled"}); 
		}else if (xbIndex==(data.length-1)) {
			    $right_index.attr({"disabled":"disabled"});
		}
    	$ul.empty();   //清空上一个选项的内容
        var  dataStr = data[xbIndex];
    	var  dataArr = dataStr.split(sepeator);
        for (var j = 0; j < dataArr.length; j++) {
			var $li = $("<li>"+dataArr[j]+"</li>").toggleClass("num");
			$ul.append($li);
		}
}

window.onload = function() {

	//固定二档
	var num1 = ["01", "02", "03", "11", "12", "13", "21", "22", "23", "31", "32", "33"];
	var data1 = arr(2,num1);
	zuhe_Arr.push(data1);
	
	//固定三档
	var num2 = ["01", "02", "03", "11", "12", "13", "21", "22", "23", "31", "32", "33"];
	var data2 = arr(3,num2);
	zuhe_Arr.push(data2);

	//一区二档
	var num3 = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11"];
	var data3 = arr(2,num3);
	zuhe_Arr.push(data3);


	//一区三档
	var num4 = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11"];
	var data4 = arr(3,num4);
	zuhe_Arr.push(data4);
	
	//二区二档
	var num5 = ["12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"];
	var data5 = arr(2,num5);
	zuhe_Arr.push(data5);

    //二区三档
	var num6 = ["12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"];
	var data6 = arr(3,num6);
	zuhe_Arr.push(data6);
	
	//三区二档
	var num7 = ["23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33"];
	var data7 = arr(2,num7);
	zuhe_Arr.push(data7);

    //三区三档
	var num8 = ["23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33"];
	var data8 = arr(3,num8);
	zuhe_Arr.push(data8);
    
    vip_ds();
    var $right_index =$(".right_index");
    $right_index.click(function(){
    	
       xbIndex++;
       vip_mk();
    	
    });
    var $left_index =$(".left_index");
    $left_index.click(function(){
       xbIndex--;
       vip_mk();
    	
    });
    
}

