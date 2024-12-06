/*
   Copyright (c) 2002 SHINTEC HOZUMI Co.,LTD.
   All Rights Reserved. 
*/
function call_runOnClickInfo()
{
	var obj = window.event.srcElement;
	window.location.href="./" + obj.id + ".pdf";
}


function call_runOnMouseOver()
{
	if(window.event)	window.event.srcElement.className = "titlelist-hover";
}


function call_runOnMouseOut()
{
	if(window.event)	window.event.srcElement.className = "titlelist";
}

