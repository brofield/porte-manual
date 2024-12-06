/* $Id: jaspa.js,v 1.12 2004/03/30 10:07:00 t-kato Exp $ */

//
// 指定されたパラメータの値を取得する。
//
function getParameterValue() {
	var key=null;
	var paramList = null;
	if (arguments.length <= 0) {
		return null;
	} else if (arguments.length == 1) {
		paramList = getParameterList();
		key = arguments[0];
	} else {
		if (arguments[1] == null) return null;
		paramList = getParameterList(arguments[1]);
		key = arguments[0];
	}
	if (paramList==null) return null;
	for(var i=0; i<paramList.length; i++) {
		var param = paramList[i].split("=");
		if(param[0].match(key)) return param[1];
	}
	return null;
}

//
// URLに指定されているパラメータ値のリストを取得する
//
function getParameterValueList() {
	var str = null;
	if (arguments.length <= 0) {
		str = location.search;
	} else {
		str = arguments[0];
	}
	var paramList = getParameterList(str);
	var list = new Array();
	for(var i=0; i<paramList.length; i++) {
		var param = paramList[i].split("=");
		list.push(param[1]);
	}
	return list;
}

//
// URLに指定されているパラメータのリストを取得する
//
function getParameterList() {
	var str;
	if (arguments.length <= 0) {
		str = location.search;
	} else {
		str = arguments[0];
		str = "?"+str.toString().split("?")[1];
	}
	var loc = str.toString().substring(1, str.length);
	var paramList = loc.split("&");
	return paramList;
}

//
// 修理書グループリンククリック時実行
//
function clickMenu(serId, serType){
//alert("serId="+serId+", serType="+serType);
	if (serType == 2) {
		parent.index.location.href="../repair2/html/toc2/"+serId.toLowerCase()+".html";
		parent.manual.location.href="../repair2/html/toc2/sts_"+serId.toLowerCase()+".html";
	} else {
		parent.index.location.href="../repair2/html/toc/"+serId.toLowerCase()+".html";
		parent.manual.location.href="../repair2/html/toc/sts_"+serId.toLowerCase()+".html";
	}
}

//
// 機能別修理書パブNo.選択
//
function clickPubMenu(pubId) {
	parent.index.location.href="../frp/"+pubId.toLowerCase()+"/repair2/html/toc/"+pubId.toLowerCase()+".html";
	parent.manual.location.href="../frp/"+pubId.toLowerCase()+"/repair2/html/toc/sts_"+pubId.toLowerCase()+".html";
}

//
// seePage表示
//args[0]:id args[1]:g_margin
var g_margin;
function openSeePage(type,id){
	var html;
	var iewin = null;
	var xlinks = id.toLowerCase().split("_");
	if(type=='ppr')  html = "../preparation/ppr_"+xlinks[0]+".html";
	else             html = xlinks[0]+".html";

	if (isIEver5Later())	{
		if(window.dialogArguments==null) {
			g_margin=(screen.width - 780)/2;
		} else if (window.dialogArguments[1] + 780 + 30 + 10 > screen.width) {
			g_margin = 5;
		} else {
			g_margin = window.dialogArguments[1] + 30;
		}

		var addDialog = "dialogWidth=780px; dialogHeight=580px; status=yes; resizable=yes; help=no; dialogLeft="+g_margin+";";

		var array = new Array();
		array[0]=id;
		array[1]=g_margin;
		showModalDialog(html,array,addDialog);
	} else {
		var newWinName = "childWin_00"
		var winName = window.name;
		if (winName.indexOf("_")>0) {
			var cnt = winName.split("_")[1];
			cnt = eval(cnt)+1;
			newWinName = "childWin_"+cnt;
		}
		iewin = window.open(html, newWinName, "width=780,height=400,top=30,left=30,status=yes,menubar=yes,resizable=yes,scrollbars=yes");
		iewin.window.focus();
	}
	return;
}

//
//showModalDialog()は＃以下アンカー情報が渡せない為onload時にlocation.hashする。
//
function seePageAnchor(){
	if(window.dialogArguments!=null){
		//print_button.style.visibility="visible";
		print_button.style.display="";
		var anchor = window.dialogArguments[0];
		location.hash = anchor;
	}
}

//
//IEのバージョンチェック(IE5.5未満であればfalseを返します)
//
function isIEver5Later() {
	var agt = navigator.userAgent.toLowerCase();
	var is_major = parseInt(navigator.appVersion);
	var is_ie = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
	var is_ie3 = (is_ie && (is_major < 4));
	var is_ie4 = (is_ie && (is_major == 4) && (agt.indexOf("msie 4")!=-1) );
	var is_ie5    = (is_ie && (is_major == 4) && (agt.indexOf("msie 5.0")!=-1) );
	var is_ie5_5up =(is_ie && !is_ie3 && !is_ie4 && !is_ie5);
	//return (is_ie && (is_major == 4) && (agt.indexOf("msie 4")!=-1));
	return is_ie5_5up;
}