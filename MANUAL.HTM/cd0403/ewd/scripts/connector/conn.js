

function call_runOnClickSystem(ewdID)
{
	jumpToSystem(ewdID);
}


function call_runOnClickRouting(ewdID)
{
	jumpToRouting(ewdID);
}


function call_runOnClickRelay(ewdID)
{
	jumpToRelay(ewdID);
}




function call_runOnMouseOver()
{
	var obj = window.event.srcElement;
	obj.className = "text-hover";
}


function call_runOnMouseOut()
{
	var obj = window.event.srcElement;
	obj.className = "text";
}






function jumpToSystem( ewdID )
{
	window.open("../../system/main/" + ewdID.toLowerCase() + ".html", "_top");
}

function jumpToRouting( ewdID )
{
	window.open("../../routing/main/" + ewdID.toLowerCase() + ".html", "_top");
}

function jumpToRelay( ewdID )
{
	window.open("../../relay/main/" + ewdID.toLowerCase() + ".html", "_top");
}

