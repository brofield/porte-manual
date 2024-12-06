

function call_runOnClick(partsID)
{
	selectItem( partsID );
	resetItemStyle();
	setSelectedItemStyle(event.srcElement);
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




function selectItem( partsID )
{
	parent.d_info.window.location.href="../conninfo/" + partsID.toLowerCase() + ".html";
}

function setSelectedItemStyle( destObj )
{
	if( destObj != null )
		destObj.className = "menu-active";
}

function resetItemStyle()
{
	var obj = document.all.tags("div");
	
	for(var i=0; i < obj.length; i++ ){
		if( obj(i).className != "menu" )
			obj(i).className = "menu";
	}
}
