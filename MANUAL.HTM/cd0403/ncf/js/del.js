var COOKIENAME = "bkmk";

function delete_cookie(){
	var newCookies = "";
	for(i=0; i<document.form1.elements.length; i++)
		if(document.form1.elements[i].checked != true){
			newCookies = newCookies + document.form1.elements[i].value + "$";
			}
	var nextyear = new Date();
		nextyear.setFullYear(nextyear.getFullYear() + 1);
	document.cookie = COOKIENAME + "=" + ";expires=Thu, " + "01-Jan-70 00:00:01 GMT";
	document.cookie = COOKIENAME + "=" + newCookies + ";expires=" + nextyear.toGMTString();

//ウィンドウCLOSE
	window.close();
	}








function bkmkJump(head,left,right){
	opener.global.location.href =head;
	opener.local.location.href =left;
	opener.contents.location.href =right;
}






function ecuJump(head,left,right){

headLength = head.length;		//	headの文字数を取得
headFile = head.substring(0,headLength - 5);		//	headのファイル名を取得
headFileLength = headFile.length;		//	headのファイル名の文字数を取得

leftLength = left.length;;		//	leftの文字数を取得
leftFile = left.substring(0,leftLength - 5);		//	leftのファイル名を取得
leftFileLength =leftFile.length;		//	leftのファイル名の文字数を取得
leftFileCut2 = leftFile.substring(1,3);		//	構造と作動内のメニューディレクトリを区別するためleftのファイル名（2,4）を取得（sc単位）

rightLength = right.length;;		//	rightの文字数を取得
rightFile = right.substring(0,rightLength - 5);		//	rightのファイル名を取得
rightFileLength = rightFile.length;		//	rightのファイル名の文字数を取得
rightFileCut = rightFile.substring(rightFileLength -4,rightFileLength);		//	部品の絵目次、一連、単品を区別するためにrightの末尾四文字を取得（00br,00bz,xxbr,など）
rightFileCut2 = rightFile.substring(2,4);		//	構造と作動内の本文ディレクトリを区別するためrightのファイル名（2,4）を取得（sc単位）
rightFileCut3 = rightFile.substring(0,1);		//	システムの目次、一連、単品を区別するためにrightの頭1文字を取得
rightFileCut4 = rightFile.substring(1,3);		//	システムのメニューディレクトリを区別するためにrightのファイル名の（1,3）を取得
rightFileCut5 = rightFile.substring(0,2);

dirSearch = headFile.substring(0,2);		//	どこのディレクトリにいるかを知るためにheadの最初の二文字を取得（ks,ss,ts,など）


	if(dirSearch == 'b0'){		//	dirSearchがb0だったら構造と作動の部品
		top.global.location.href ='../../'+ head;		//	headの飛び先は変わらないので常に同じ
		if(rightFileCut == 'ault'){		//	rightの末尾四文字が「ault」だったらデフォルトページ
			top.local.location.href = '../../ks/' + left;
			top.contents.location.href = '../../ks/' + right;
		}
		else if(rightFileCut == '00br'){		//	rightの末尾四文字が「00br」だったら絵目次
			top.local.location.href = '../../ks/' + left;
			top.contents.location.href = '../../ks/data/sct' + rightFileCut2 + '/' + right;
		}
		else{		//	それ以外のときは単品表示or一連表示
			top.local.location.href = '../../ks/menu' + leftFileCut2 + '/' + left;
			top.contents.location.href = '../../ks/data/sct' + rightFileCut2 + '/' + right;
		}
	}

	if(dirSearch == 's0'){		//	dirSearchがs0だったら構造と作動のシステム
		top.global.location.href = '../../'+head;		//	headの飛び先は変わらないので常に同じ
		if(rightFileCut3 == 'd'){		//	rightの頭一文字が「d」だったらデフォルトページ
			top.local.location.href = '../../ks/' + left;
			top.contents.location.href = '../../ks/' + right;
		}
		else if(rightFileCut3 == 's'){		//	rightの末尾四文字が「s」だったら目次
			top.local.location.href = '../../ks/' + left;
			top.contents.location.href = '../../ks/menu' + rightFileCut4 + '/' + right;
		}
		else{		//	それ以外のときは単品表示or一連表示
			top.local.location.href = '../../ks/menu' + leftFileCut2 + '/' + left;
			top.contents.location.href = '../../ks/data/sct' + rightFileCut2 + '/' + right;
		}
	}

}