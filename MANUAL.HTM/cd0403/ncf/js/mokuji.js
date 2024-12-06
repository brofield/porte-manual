function jump2Contents(local,right,id){
var headURL = top.global.document.URL;//目次一覧のグローバルナビのURLをフレームページに格納
var leftURL = top.local.document.URL;//目次一覧のローカルナビのURLフレームページに格納
var rightURL = top.contents.document.URL;//目次一覧のコンテンツ部分のURLフレームページに格納
var locValue = String(top.document.location);//フレームページのURLを取得して文字列に変換
var locArray = locValue.split('.html');//↑で取得したURLを「.html」で区切る

var fDate = locArray[0];//↑で区切ったものの一番目。「○○.html●●」だったら「○○」
var urlStr = fDate.substring(fDate.length - 6,fDate.length);//↑から周期のデータを拾う
	top.localId = id;//コンテンツへ飛んだときにローカルナビの色を変える用のID
	top.head = headURL;
	top.left = leftURL;
	top.right = rightURL;
	top.mokujiFlag = '0';//今どこのページにいるかなどの判定に使うフラグ
	top.global.document.URL = '../html/s00h.html';
	top.local.document.URL = '../'+urlStr+'/'+local;
	top.contents.document.URL = '../xml/'+right;
}

//ブラウザの「戻る」ボタンを押されたときの対処
function onLoadMokuji(){
	if(top.mokujiFlag == '0'){
		top.global.document.URL = top.head;
		top.local.document.URL = top.left;
	}
}
