function call_runOnLoad()
{
}

function call_runOnClick()
{
	selectCategory( event.srcElement );
	
	resetCategoryStyle();
	setSelectedCategoryStyle(event.srcElement);
}


function call_runOnMouseOver(){
	var obj = event.srcElement;
	if( obj.className == "menu-active" ) return;
	
	obj.className = "menu-hover";
}


function call_runOnMouseOut(){
	var obj = event.srcElement;
	if( obj.className == "menu-active" ) return;
	
	obj.className = "menu";
}

function selectCategory( obj )
{
	if( obj.id == "info" ){
		parent.d_titleList.window.location.href="../ewd/contents/common/index.html";
		return;
	}
	
	if (obj.id == "cfe"){
		parent.d_titleList.window.location.href="../ewd/contents/category/cfe/cfe.html";
		return;
	}

	parent.d_titleList.window.location.href = "../ewd/contents/category/list/" + obj.id.toLowerCase() + ".html";
}

function resetCategoryStyle()
{
	var destObj = document.all("category");
	for(var i=0; i < destObj.all.tags("div").length; i++ ){
		destObj.all.tags("div")(i).className = "menu";	
	}
}

function setSelectedCategoryStyle(obj)
{
	obj.className = "menu-active"; 	
}
