//目次ページセット
function setMokuji(){
	if(top.frames.length != 0){
		var str=String(top.contents.location);
		var strLength=str.length;
		var urlStr=str.lastIndexOf("/html/",strLength);
		top.mokujiPage=document.location.href;
	}
}

//解説読み込み時処理---------------------------------------
//コンテンツにあわせてタブセット
function setTab(num){
	fileSplit = document.location.href.split('/')[document.location.href.split('/').length - 1].split('.')[0].substring(0,15);
	if(top.frames.length != 0){
		top.global.document.all.item('layer1').style.visibility = 'hidden';
		top.global.document.all.item('layer2').style.visibility = 'visible';
	}
}

//タブ切り替え-------------------------------------
function show(){
	var objID=document.all('Tab2');
	if(objID.className=='close'){
		objID.style.visibility='visible';
		objID.className='open';
	}else{
		objID.style.visibility='hidden';
		objID.className='close';
	}
}

//localメニューのリンク先変更：locStatus　0>解説 1>解説スルー（上部タブより設定）
var locStatus=0;
function setLstatus(num){
	top.local.locStatus=num;
	if(num==0){
		top.contents.location.href=top.local.urlArray[0];
	}else if(num==1){
		Url = top.local.document.location.href.split('/')
		Term = Url[Url.length - 2];
		cutUrl = top.local.urlArray[1].split('#')[0];
		top.contents.location.href='../'+Term+'/'+cutUrl;
	}
}

//local用---------------------------------------
//項目数とURL取得
var itemNum=0;
a_url=new Array();
a_url2=new Array();
//拡張子設定
ext_name="";

//右フレームにコンテンツを読み込み
function contents_open(normal,through){
	top.contents.location.href = normal;
}

//---------------------------------------

//汎用ロード（フレーム指定,url)
var undefined
function frameLoad(frm,url){
	if(top.frames.length != 0){
		var fileName = String(top.document.location).split('/');
		var fileNameHead = fileName[fileName.length - 1].substring(0,2);
		if(url != undefined){
			if(url.match('groupsa') == 'groupsa'){
				if(top.local.document.location.href.match('groupsa') != 'groupsa'){
					top[frm].document.location.href=url;
//					alert('1');
				}else{
					void(0);
				}
			}else{
				top[frm].document.location.href=url;
//				alert('3');
			}
		}else{
			parent.document.location.href = '../../index3.html'
		}
	}
}

//「目次画面へ」ボタンを押したときの分岐に使うフラグ
function setFlag(){
	top.mokujiFlag = '1';
}

//ヘッダボタンの表示非表示
function boVis(num){
fileSplit = document.location.href.split('/')[document.location.href.split('/').length - 1].split('.')[0].substring(0,15);
	if((top.frames.length != 0)){
		if(num == 05){
			void(0);
		}if(num == 06){;
			top.global.document.all.item('layer1').style.visibility = "visible";
			top.global.document.all.item('layer2').style.visibility = "hidden"
		}
	}
}

function boHid2Del(){
	if(top.frames.length != 0){
	}
}

//20030224追加　左メニュマウスオーーバー、マウスアウト
function mouseOverAndOut(iconIdZ,Flag){
	iconIdZ = 'C' + iconIdZ;
	if(Flag == 0){
		if(document.all.item(iconIdZ).style.backgroundColor != '#a9b2b7'){
			document.all.item(iconIdZ).style.backgroundColor = '#C6CFD3';
			document.all.item(iconIdZ).style.color = '#FFFFFF';
		}
	}if(Flag == 1){
		if(document.all.item(iconIdZ).style.backgroundColor != '#a9b2b7'){
			document.all.item(iconIdZ).style.backgroundColor = '#FFFFFF';
			document.all.item(iconIdZ).style.color = '#000000';
		}
	}
}


//左フレームの強調表示
var contentsFile = 'dummy';
function changeImg(iconIdZ){
	Folder = document.location.href.split('/')[document.location.href.split('/').length-2];
	if(top.document.frames.length != 0){
		var frameName = this.frames.name;
		if(frameName == 'contents'){
			var nullID = '0';
			for(i = 0; i < top.local.document.all.tags('div').length; i++){
				if(top.local.document.all.tags('div')[i].id.match(iconIdZ) != null){
					CFolder = String(top.local.document.all.tags('div')[i].onclick).split('/')[String(top.local.document.all.tags('div')[i].onclick).split('/').length-2]
					if(Folder == CFolder){
						nullID = '1';
					}
				}
			}
		}
		if(nullID == 1){
			var baseimg = "b_icon0.gif";
			var changeimg = "b_icon1.gif";
			var basecolor = "#6B8490";
			var changecolor ="#B7C4CA";
			var Level;
			var iconId;
			var Level;
			var topObj = top.local;
			CiconIdZ = 'C' + iconIdZ;
			IiconIdZ = 'I' + iconIdZ;
			OiconIdZ = 'O' + iconIdZ;
			CcontentsFile = 'C' + top.local.contentsFile;
			IcontentsFile = 'I' + top.local.contentsFile;
			OcontentsFile = 'O' + top.local.contentsFile;
			if(top.local.document.location.href.match('groupsa') == 'groupsa'){
				Level = '../ncf/images/';
			}else{
				Level = '../images/';
			}
			if(top.local.contentsFile == 'dummy'){
				if(top.local.document.all.item(IiconIdZ) != null){
					top.local.document.all.item(IiconIdZ).src = Level + changeimg;
					top.local.document.all.item(OiconIdZ).style.backgroundColor = basecolor;
					top.local.document.all.item(CiconIdZ).style.backgroundColor = '#a9b2b7';
					top.local.document.all.item(CiconIdZ).style.color = '#ffffff';
					top.local.contentsFile = iconIdZ;
				}else{
					topRef = top.contents.document.location.href;
					topDir = topRef.split('/')[topRef.split('/').length - 2];
					CiconIdZ = 'C' + topDir+iconIdZ;
					IiconIdZ = 'I' + topDir+iconIdZ;
					OiconIdZ = 'O' + topDir+iconIdZ;
					top.local.document.all.item(IiconIdZ).src = Level + changeimg;
					top.local.document.all.item(OiconIdZ).style.backgroundColor = basecolor;
					top.local.document.all.item(CiconIdZ).style.backgroundColor = '#a9b2b7';
					top.local.document.all.item(CiconIdZ).style.color = '#ffffff';
					top.local.contentsFile = topDir+iconIdZ;
				}
			}else{
				if(top.local.document.all.item(IiconIdZ) != null){
					top.local.document.all.item(IcontentsFile).src = Level + baseimg;
					top.local.document.all.item(OcontentsFile).style.backgroundColor = changecolor;
					top.local.document.all.item(CcontentsFile).style.backgroundColor = '#ffffff';
					top.local.document.all.item(CcontentsFile).style.color = '#000000';
					top.local.document.all.item(IiconIdZ).src = Level + changeimg;
					top.local.document.all.item(OiconIdZ).style.backgroundColor = basecolor;
					top.local.document.all.item(CiconIdZ).style.backgroundColor = '#a9b2b7';
					top.local.document.all.item(CiconIdZ).style.color = '#ffffff';
					top.local.contentsFile = iconIdZ;
				}else{
					topRef = top.contents.document.location.href;
					topDir = topRef.split('/')[topRef.split('/').length - 2];
					CiconIdZ = 'C' + topDir+iconIdZ;
					IiconIdZ = 'I' + topDir+iconIdZ;
					OiconIdZ = 'O' + topDir+iconIdZ;
					top.local.document.all.item(IcontentsFile).src = Level + baseimg;
					top.local.document.all.item(OcontentsFile).style.backgroundColor = changecolor;
					top.local.document.all.item(CcontentsFile).style.backgroundColor = '#ffffff';
					top.local.document.all.item(CcontentsFile).style.color = '#000000';
//alert(IiconIdZ)
					top.local.document.all.item(IiconIdZ).src = Level + changeimg;
					top.local.document.all.item(OiconIdZ).style.backgroundColor = basecolor;
					top.local.document.all.item(CiconIdZ).style.backgroundColor = '#a9b2b7';
					top.local.document.all.item(CiconIdZ).style.color = '#ffffff';
					top.local.contentsFile = topDir+iconIdZ;
				}
			}
//			top.local.contentsFile = iconIdZ;
		}
	}else{
		void(0);
	}
}


//絵目次モーダルダイアログ表示用
function pocModal(url){
fileName = document.location.href.split('/')[document.location.href.split('/').length - 1].substring(3,8);
url = url.toLowerCase();
	if((fileName == 'nerai') || (fileName == 'gaiyo')){
		window.open('../xml/'+url,'prtWin','width=650,height=600,scrollbars=yes,toolbar=yes,menubar=yes');
	}else{
		hash1 = url.split('#')[1];
		url1 = url.split('#')[0];
		url2 = document.location.href.split('#')[0].split('/')[document.location.href.split('#')[0].split('/').length-1];
		if(url1==url2){
			obj_a = document.getElementsByTagName('A');
			flag=false;
			for(i=0;i<obj_a.length;i++){
				if(obj_a[i].name==hash1){
					flag=true;
				}
			}
			if(flag == true){
				window.open(url,'prtWin','width=650,height=600,scrollbars=yes,toolbar=yes,menubar=yes');
			}else{
				window.open(url1 + '#','prtWin','width=650,height=600,scrollbars=yes,toolbar=yes,menubar=yes');
			}
		}else{
			window.open(url,'prtWin','width=650,height=600,scrollbars=yes,toolbar=yes,menubar=yes');
		}
	}
}



var baseimg = ['detail0.gif','detail_a0.gif','detail_b0.gif'];
var changeimg = ['detail1.gif','detail_a1.gif','detail_b1.gif'];
var basecolor = "#6B8490";
var changecolor  ="#B7C4CA";
var iconId;

//	ツリーメニュー
vType = ["none","block"];
function treeMenu(tName){
	tMenu = document.all[tName].style;
	tMenu.display = vType[tMenu.display.indexOf("none") + 1];
}


function chgImg(imgId){
	iconNameClose = ['detail0.gif','detail_a0.gif','detail_b0.gif'];
	iconNameOpen = ['detail1.gif','detail_a1.gif','detail_b1.gif'];
	srcURL = document.all.item(imgId).src;
	fileName = srcURL.substring((srcURL.lastIndexOf('/') + 1),srcURL.length);	//	ファイル名を抽出
	preSrcURL = srcURL.substring(0,(srcURL.length - (fileName.length)));
	for(a = 0; a < iconNameClose.length; a++){
		if(document.all.item(imgId).src == preSrcURL + iconNameClose[a]){
			document.all.item(imgId).src = preSrcURL + iconNameOpen[a];
		}else if(document.all.item(imgId).src == preSrcURL + iconNameOpen[a]){
			document.all.item(imgId).src = preSrcURL + iconNameClose[a];
		}else{
		}
	}
}


//	単独で開いたとき「印刷」、「閉じる」ボタンを表示
function printAndClose(){
	window.focus();
	if(top.frames.length == 0){
		imgLength = document.all.tags("img").length;
		for(i = 0; i < imgLength; i++){
			srcURL = document.all.tags("img")[i].src;
			fileName = srcURL.substring((srcURL.lastIndexOf('/') + 1),srcURL.length);	//	ファイル名を抽出
			preSrcURL = srcURL.substring(0,(srcURL.length - (fileName.length)));	//	ファイル名の前まで
			if(fileName == baseimg[0]){
				document.all.tags("img")[i].src = preSrcURL + changeimg[0];
			}else if(fileName == baseimg[1]){
				document.all.tags("img")[i].src = preSrcURL + changeimg[1];
			}else if(fileName == baseimg[2]){
				document.all.tags("img")[i].src = preSrcURL + changeimg[2];
			}else{
				void(0);
			}
		}
		divLength = document.all.tags("div").length;
		for(i = 0; i < divLength; i++){
			if(document.all.tags("div")[i].style.display == 'none'){
				document.all.tags("div")[i].style.display = 'block';
			}
		}
	}
}

//	単独で開いたとき「印刷」、「閉じる」ボタン、「チェックボックス」を表示（解説スルー用）　+　閉じているdivを開く　+　アイコンを開いたものに変える
function printAndCloseZ(){
	if(top.frames.length == 0){
		var checkLength = document.bmform.elements.length;
		for(i = 0; i < checkLength; i++){
			var obj = document.bmform.elements[i];
		}
		imgLength = document.all.tags("img").length;
		for(i = 0; i < imgLength; i++){
			srcURL = document.all.tags("img")[i].src;
			fileName = srcURL.substring((srcURL.lastIndexOf('/') + 1),srcURL.length);	//	ファイル名を抽出
			preSrcURL = srcURL.substring(0,(srcURL.length - (fileName.length)));	//	ファイル名の前まで
			if(fileName == baseimg[0]){
				document.all.tags("img")[i].src = preSrcURL + changeimg[0];
			}else if(fileName == baseimg[1]){
				document.all.tags("img")[i].src = preSrcURL + changeimg[1];
			}else if(fileName == baseimg[2]){
				document.all.tags("img")[i].src = preSrcURL + changeimg[2];
			}else{
				void(0);
			}
		}
		divLength = document.all.tags("div").length;
		for(i = 0; i < divLength; i++){
			if(document.all.tags("div")[i].style.display == 'none'){
				document.all.tags("div")[i].style.display = 'block';
			}
		}
	}
}


//	チェックボックス全選択全解除（解説スルー用）
function selectAll(VALUE) {
	var checkLength = document.bmform.elements.length;
	for(i = 0; i < checkLength; i++){
		var obj = document.bmform.elements[i];
		if(obj.type == "checkbox"){
			obj.checked=VALUE;
		}
	}
	return;
}


//	解説スルー用印刷確認
function printSelect(){
	dValue = document.divValue.hid.value;	//右フレームの隠しフォームから値を取得（印刷用）2003/4/9追記チェックボックスの数（多分）
	var checkLength = document.bmform.elements.length;
	for(i = 0; i < checkLength; i++){
		var obj = document.bmform.elements[i];
		if(obj.type == "checkbox"){
			obj.style.display = 'none';
		}
	}

	divLength = document.all.tags("div").length;
	for(i = 0; i < divLength; i++){
		if(document.all.tags("div")[i].style.display == 'none'){
			document.all.tags("div")[i].style.display = 'block';
		}
	}
	for(i = 1; i < dValue; i++){
		mycheckId = 'check'+i;
		mybmId = 'bm'+i;
		if(document.bmform(mycheckId).checked == true){	//チェックされていたら表示
			document.all.item(mybmId).style.display = "block";
		}else{	//チェックされていなかったら非表示
			document.all.item(mybmId).style.display = "none";
		}
	}
	document.all.item('print2').style.display = 'none';
	document.all.item('print3').style.display = 'none';
	document.all.item('print4').style.display = 'block';
	document.all.item('print5').style.display = 'none';
}

/* 特定・サーチの車両概要で、印刷ボタンを押したときにタイトルバーを表示 */
function barBlock(){
	var dValue = (document.divValue.hid.value) - 1;
	if(top.frames.length == 0){
		for(i = 1; i <= dValue; i++){
			barID = 'bar'+i;
			document.all.item(barID).style.display = 'block';
		}
	}
}

//車両四面図用
function changeSyaryo4menzu(){
	here.innerHTML = ss_syaryo4menzu.transformNode(ss_syaryo4menzu_style.documentElement);
}
SVGSize = ['0.5','1.0','1.5','2.0','3.0','4.0'];
imgWidth = '740';
imgHeight = '515';
IDXcount = 1;
function imgZoom(SIZE,Name){
	if(IDXcount <= 4){
		if(SIZE == 'up'){
		IDXcount++;
			Name.theSVG.height = imgHeight * SVGSize[IDXcount];
			Name.theSVG.width = imgWidth * SVGSize[IDXcount];
		}
	}
	if(IDXcount > 0){
		if(SIZE == 'down'){
		IDXcount--;
			Name.theSVG.height = imgHeight * SVGSize[IDXcount];
			Name.theSVG.width = imgWidth * SVGSize[IDXcount];
		}
	}
}
function writeIFrame(iFrameName,FileName){
	iFrameName.document.write('<html>\n<head><title>SVG</title></head>\n<body topmargin="0" leftmargin="0">\n');
	iFrameName.document.write('<img src="../xml/grph_ent/' + FileName + '.png" width="740" height="515" name="theSVG">');
	iFrameName.document.write('\n</body>\n</html>');
}


function openPDF(FILE){
	window.open('../pdf/'+FILE+'.pdf','','width=800,height=600,toolbar=0,menubar=0,scrollbars=1,resizable=1');
}