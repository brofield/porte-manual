
function call_runOnClickSystem()
{
	var obj = window.event.srcElement;
	top.window.location.href="../../system/main/" + obj.id.toLowerCase() + ".html";
}


function call_runOnClickRouting()
{
	var obj = window.event.srcElement;
	top.window.location.href="../../routing/main/" + obj.id.toLowerCase() + ".html";
}


function call_runOnClickRelay()
{
	var obj = window.event.srcElement;
	top.window.location.href="../../relay/main/" + obj.id.toLowerCase() + ".html";
}


function call_runOnClickConnectorList()
{
	var obj = window.event.srcElement;
	top.window.location.href="../../connector/index.html";
}


function call_runOnClickPS()
{
	var obj = window.event.srcElement;
	parent.parent.window.location.href="../../fuse/index_ps_capacity.html";
}


function call_runOnClickGP()
{
	var obj = window.event.srcElement;
	top.window.location.href="../../earth/index_gp.html";
}



function call_runOnMouseOver()
{
	window.event.srcElement.className = "titlelist-hover";
}


function call_runOnMouseOut()
{
	window.event.srcElement.className = "titlelist";
}

