function combineData(oldData,combineCount){
	
	var data = _combineData(oldData,combineCount);
	var length = data.length;
	var newData = [];
	for (var i=0;i<length;i++)
	{
		var ok = true;
	    for (var j=0;j<data[i].length-1;j++)
	    {
	       	if (data[i][j]*1>data[i][j+1]*1)
	       	{
	       		ok = false;
	       		break;
	       	}
	    }
	    if (ok)
	    newData.push(data[i]);
	}
	
	alert(newData.length)
	return newData;
	
}

function incrementGroupIndex(indexs,  maxIndex) {
    for (var i = indexs.length-1; i >= 0; i--) {
        var index = indexs[i];
        if (index<maxIndex){
            indexs[i] = ++index;
            break;
        }else{  
            indexs[i] = 0;
        }
    }
    return indexs;
}
function getGroupIndexCount(groupIndex){
    var count = 0;
    for (var i = 0; i < groupIndex.length; i++) {
        count += groupIndex[i];
    }
    return count;
}

//oldData：一维数组
//combineCount表示档数,数值范围在0-6之间,同时4,5时不可取的
//返回二维数组
function _combineData(oldData,combineCount){
//	alert(oldData+"=="+combineCount);
    if (oldData==null||oldData.length<combineCount)return null;
    var noDumplateData = removeDumplateData(oldData);
    var indexs = new Array(combineCount);
    var finishData = new Array(combineCount);
    for (var i = 0; i < combineCount; i++) {
        indexs[i] = i;
        finishData[i] = 0;
    }
    var result = new Array();
    for (;getGroupIndexCount(indexs)!=0;){
        var combineTest = new Array();
        for (var i = 0; i < indexs.length; i++) {
            combineTest[combineTest.length]=noDumplateData[indexs[i]];
        }
        indexs = incrementGroupIndex(indexs,noDumplateData.length-1);
        if (checkCombineTest(combineTest))result[result.length]=combineTest;
    }
    return result;
}


function checkCombineTest(combineTest){
    var isCombineTestOK = true;
    for (var i = 0; i < combineTest.length; i++) {
        var pre = combineTest[i];
        for (var j = i+1; j < combineTest.length; j++) {
            var next = combineTest[j];
            if (pre==next||next<pre){
                isCombineTestOK = false;
                break;
            }
        }
        if (!isCombineTestOK)break;
    }
    if (isCombineTestOK){
        var centerIndex = combineTest.length/2;  
        for (var i = 0; i < centerIndex; i++) {
            var left = combineTest[i];
            var right = combineTest[combineTest.length- 1 - i];
            if (right<left){
                isCombineTestOK=false;
                break;
            }
        }
    }
    return isCombineTestOK;
}

function removeDumplateData(oldData) {
    if (oldData==null||oldData.length<1)return null;
    var result = new Array();
    for (var i = 0; i < oldData.length; i++) {
        var pre = oldData[i];
        for (var j = i+1; j < oldData.length; j++) {
            var next = oldData[j];
            if (pre!=null)
                if (pre==next){
                    oldData[j]=null;//.set(j,null);
                    break;
                }
        }
    }
    for (var i = 0; i < oldData.length; i++) {
        var o1 = oldData[i];//.get(i);
        if (o1!=null)result[result.length] = o1;
    }
    return result;
}

