
//フォームの日付を渡す（仮?E?インチE??クスで使用?E?E
function sendDate(url){
var fDate = document.form1.select1.value;
window.location.href=url+"?term="+fDate;
}
//termを解析し、日付別のフレームにジャンチE
function locDate(url){
//ロケーションよりterm値を抽出
var locValue=String(document.location);
var locArray=locValue.split("?term=",2);
var fDate=locArray[1];
//実際のファイルナンバa?Eを決?E
var dNum;
	for(i=0; i<dArray.length; i++){
		if(dArray[i]==fDate){
			dNum=fDate;
			break;
		}
		if(dArray[0]>fDate){
			dNum=dArray[0];
			break;
		}
		if(dArray[i]<fDate){
			dNum=dArray[i];
		}else{
			break;
		}
	}
/*
alert(
'\n dArray■'+dArray+
'\n fDate■termの値は'+fDate+
'\n dNum■実際に読み込むファイルは'+dNum+
'\n window.location.href■'+url+"_"+dNum+".html"+"?term="+fDate
)
*/
	window.location.href=url+"_"+dNum+".html"+"?term="+fDate;
}



//トップに日付を返す
function returnTop(url){
	var gUrl=String(top.document.location);
	var a_date=gUrl.split("?term=",2);
	top.window.location.href=url+"?term="+a_date[1];
}
//トップに日付を反映
function formSet(){
	var gUrl=String(document.location);
	var a_date=gUrl.split("?term=",2);
	for(i=0; i<document.form1.select1.length; i++){
	if(document.form1.select1[i].value==a_date[1])
		document.form1.select1.selectedIndex=i;
	}
}