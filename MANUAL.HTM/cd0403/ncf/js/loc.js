//localメニューのリンク先変更：locStatus　0>解説 1>解説スルー（上部タブより設定）
var locStatus=0;
function setLstatus(num){
top.local.locStatus=num;
top.local.take();
alert(top.contents.locStatus)
}
var itemNum=0;
a_url=new Array();
a_url2=new Array();
//項目数とURL取得
function setItem(url1,url2){
itemNum+=1
a_url.push(url1);
a_url2.push(url2);
}
//右フレームにコンテンツを読み込み
function contents_open(id){
var num=id-1;
if(locStatus==0){
var url=a_url[num];
top.contents.location.href = url;
alert(url);
}else if(locStatus==1){
var url=a_url2[num];
top.contents.location.href = url;
alert(url);
}
}


//	単品表示（構造と作動）
function tHyouji(url1,url2){
	top.local.location.href =url1;
	top.contents.location.href =url2;
}
