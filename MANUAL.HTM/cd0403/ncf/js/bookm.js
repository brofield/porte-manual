
/*

          bookmark script version 0.20021026

*/



var FILENAMELENGTH = 16;
var ENCODEDFILENAMELENGTH = 2;
var COOKIENAME = "bkmk";
var COOKIENAMECOUNT = 5;
var FILENAMESEPARATER = "\\";

var newWin;

// ディレクトリのセパレータがUNIXの場合は "/" なので注意
// ローカルのため、Windows のディレクトリセパレータの「\」にしている
// \\の前の分は、「\」そのものへのエスケープです


// ブックマークの登録の関数

function bmT(){
	set_cookie();
	}


// ブックマーク読み込みの関数

function bmE(){
	var cookies = get_cookie();
	if(cookies != 0){
		if (newWin != null){
			newWin.close();
		}
		var str = unescape(cookies);

		tdItem = str.split("$");
		newWin = window.open("","sub","'toolbar=n,location=n,status=yes,menubar=n,scrollbars=yes,resizable=yes,width=300,height=600'");

		newWin.document.write("<html><head><title>ブックマーク閲覧</title><meta http-equiv=\"Content-Type\" content=\"text/html\; charset=UTF-8\"><link rel=\"stylesheet\" href=\"../css/left.css\"><script language=\"JavaScript\" src=\"../js/del.js\"></script></head><body bgcolor=\"#FFFFFF\" leftmargin=\"0\" topmargin=\"0\" marginwidth=\"0\" marginheight=\"0\"><form name=\"form1\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td class=\"top\"></td></tr><tr><td class=\"text00\" height=\"20\">　ブックマーク閲覧</td></tr></table><br><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"10\">　</td><td class=\"text00\">登録してあるブックマークを削除するには、<br>チェックボックスに チェックを入れ、削除ボタンをクリックしてください。</td><td width=\"10\">　</td></tr></table><table>");

	for(i=0; i<tdItem.length -1; i++) newWin.document.write("<tr><td width=\"10\">　</td><td width=\"210\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td width=\"10\" class=\"buttonbase\"><img src=\"../images/b_icon0.gif\" width=\"10\" height=\"20\"></td><td width=\"200\"><a  class=\"menu\" href=\"javascript\:bkmkJump\("
	 + tdItem[i] + 
	"</a></td><td><input type=\"checkbox\" value=\"" + escape(tdItem[i]) + "\"" + " name=\"delete" + i + "\"></td></tr></table></td></tr>");

		newWin.document.write("</table><br><table width=\"255\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td align=\"center\"><table width=\"35\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr><td class=\"button_sakujo\" height=\"14\"><a class=\"type3\" href=\"javascript:delete_cookie()\">削除</a></td></tr></table></td></tr></table><BR></form></body></html>");
	newWin.focus();
		}else{
		alert("現在登録されているブックマークはありません");
		}
	}


function delete_cookie(){
		var newCookies = "";
		for(i=0; i<document.form1.elements.length; i++)
			if(document.form1.elements[i].checked != true){
			newCookies = newCookies + document.form1.elements[i].value + "$";
			}
		var nextyear = new Date();
			nextyear.setFullYear(nextyear.getFullYear() + 1);
		document.cookie = COOKIENAME + "=" + ";expire=Thu, " + "01-Jan-70 00:00:01 GMT";
		document.cookie = COOKIENAME + "=" + newCookies + ";expires=" + nextyear.toGMTString();
	}


function set_cookie(){
	if(confirmValue = confirm("このページを登録しますか？")){

// 現在のクッキーを取得しておく
if(confirmValue == true){
	var currentCookieWith = unescape(document.cookie);
	var currentCookie = currentCookieWith.substring(COOKIENAMECOUNT, currentCookieWith.length);
	var fileName = get_fileName();
	var nextyear = new Date();
		nextyear.setFullYear(nextyear.getFullYear() + 1);

// Cookieの期限は書き込んだ1年後に設定

	document.cookie = COOKIENAME + "="  + escape(currentCookie + fileName + "$") + ";expires=" + nextyear.toGMTString();
		}
	alert("登録しました");
	}
}

// 右ページ、ヘッダ、左ページのURL、左ページのタイトルを取り出す

function get_fileName(){

	var rightURL =parent.contents.document.URL;
	var leftURL = parent.local.document.URL;
	var headURL = parent.global.document.URL;
	var rd=rightURL.split("\\");
	var ld=leftURL.split("\\");
	var hd=headURL.split("\\");
	var right
	var left
	var head
	for(i=0; i<rd.length; i++){
		if(right==undefined){
			right=rd[i]
			right+="/";
		}else{
			right+=rd[i];
			if(rd.length-1!=i){
			right+="/";
			}
		}
	}
	for(i=0; i<ld.length; i++){
		if(left==undefined){
			left=ld[i]
			left+="/";
		}else{
			left+=ld[i];
			if(ld.length-1!=i){
			left+="/";
			}
		}
	}
	for(i=0; i<hd.length; i++){
		if(head==undefined){
			head=hd[i]
			head+="/";
		}else{
			head+=hd[i];
			if(hd.length-1!=i){
			head+="/";
			}
		}
	}
	var rightDocumentURL =right;
	var leftDocumentURL = left;
	var headDocumentURL = head;
	var pageTitle = parent.contents.document.title;

	var documentURL = "'" + headDocumentURL + "'\, '" + leftDocumentURL + "'\, '" + rightDocumentURL + "')\">" + pageTitle;

	return documentURL;
	}


function get_cookie(){
	var theCookie = document.cookie + ";";

// Cookieの最後に、最初から";"をつけておき、長さを取得しやすくする

	var start = theCookie.indexOf(COOKIENAME);
	if(start != -1){
		var end = theCookie.length;
		var fileList = theCookie.substring((start + COOKIENAMECOUNT), (end - 1));
		return fileList;

// 確実に文字を取り出すため、エスケープしないで文字列を返す

	}
	return false;
}

