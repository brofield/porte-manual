

function call_runOnClickSystem(ewdID)
{
	openNewSystemFig(ewdID);
}


function call_runOnClickRouting(ewdID)
{
	openNewRoutingFig(ewdID);
}


function call_runOnClickRelay(ewdID)
{
	openNewRelayFig(ewdID);
}





function call_runOnMouseOver()
{
	var obj = window.event.srcElement;
	obj.className = "text-hover-other";
}


function call_runOnMouseOut()
{
	var obj = window.event.srcElement;
	obj.className = "text";
}





function openNewSystemFig( ewdID )
{
	var url = "../../system/fig_frame/" + ewdID.toLowerCase() + ".html";
	var name = "newFig";
	var style = getStyle();
	
	window.open(url, name, style).focus();
}

function openNewRoutingFig( ewdID )
{
	var url = "../../routing/fig_frame/" + ewdID.toLowerCase() + ".html";
	var name = "newFig";
	var style = getStyle();
	
	window.open(url, name, style).focus();
}


function openNewRelayFig( ewdID )
{
	var url = "../../relay/fig_frame/" + ewdID.toLowerCase() + ".html";
	var name = "newFig";
	var style = getStyle();
	
	window.open(url, name, style).focus();
}


function getStyle()
{
	var style = "";
	
	var width = parent.fig_frame.document.body.clientWidth - 10;
	var height = parent.fig_frame.document.body.clientHeight - 20;
	
	style += "top=125,left=230,width=" + width + ",height=" + height;
	style += ",location=no,menubar=no,toolbar=no,status=no";
	
	return style;
}
