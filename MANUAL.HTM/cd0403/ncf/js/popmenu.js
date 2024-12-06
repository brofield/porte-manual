//初期設定
a_sct=new Array();
a_sctNum=new Array();
a_sc=new Array();
a_scString=new Array();
var sct_count=0;
//リンク先ディレクトリ設定
var dir_name=""
//拡張子設定
var ext_name="";

//ポップメニューのソースを生成し配列に入れる
function mkarray(t_id,id,name,url){
var sc_link=dir_name+url+ext_name;
var p_str;
p_str="<div id="+id+" style='padding:3px' onMouseover=document.getElementById('"+id+"').style.color='#FFFFFF';document.getElementById('"+id+"').style.backgroundColor='#707678' onMouseout=document.getElementById('"+id+"').style.color='#143C4C';document.getElementById('"+id+"').style.backgroundColor='#C2CCD0' onMousedown=top.contents.location.href='blank';top.contents.location.href='"+sc_link+"';parent.popHint.hide()>"+name+"</div>"
var idNum=eval(t_id);
if(a_sct[idNum]==undefined){
a_sct[idNum]=p_str
}else{
a_sct[idNum]+=p_str
}
//ポップアップ各情報記録
if(a_sc[idNum]==undefined){
a_sc[idNum]=1
}else{
a_sc[idNum]++
}
if(a_sctNum[idNum]==undefined){
a_sctNum[idNum]=sct_count;
sct_count++;
}
if(a_scString[idNum]==undefined || a_scString[idNum]<name.length){
a_scString[idNum]=name.length;
}
}

//ポップアップ高さ
function popHeight(id){
var dMargin=8;
var dHeight=20;
var pHeight=dHeight*a_sc[id]+dMargin;
return pHeight;
}
//ポップアップ位置
function popPosition(id){
var dPosition=44;
var dHeight=30;
var pPosition=dHeight*a_sctNum[id]+dPosition;
return pPosition;
}
//ポップアップ幅
function popWidth(id){
var dMargin=12;
var dWidth=14;
var pWidth=dWidth*a_scString[id]+dMargin;
return pWidth;
}

// ポップアップメニュー表示用script
function show_popup(menuId){
var idNum=eval(menuId);
	popHint = window.createPopup();
	popBody = popHint.document.body;
// バックグラウンド色とボーダースタイルを指定
	popBody.style.color = "#143C4C";
	popBody.style.backgroundColor = "#C2CCD0";
	popBody.style.border = "solid #666666 1px";
	popBody.style.margin = "2px";
	popBody.style.fontSize = "10pt";
	popBody.style.cursor = "hand";
	iHtml=a_sct[idNum];
	popBody.innerHTML =iHtml;
// 表示
	popHint.show(190, popPosition(idNum), popWidth(idNum), popHeight(idNum), document.body);
}
