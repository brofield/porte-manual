

function call_runOnLoadProc()
{
	document.all("name_list").checked = true;
}


function call_runOnClickName()
{
	loadList("list_name.html");
}


function call_runOnClickCode()
{
	loadList("list_code.html");
}


function call_runOnKeyPressEdit()
{
	if( event.keyCode == 13 ){
		call_runOnClickSearch();
	}
}


function call_runOnClickSearch()
{
	var key = edit.value;
	filteringList(key);
}


function loadList(fileName)
{
	parent.d_list.window.location.href="./connlist/" + fileName.toLowerCase() ;
}


function filteringList(key)
{
	var tableObjs = parent.d_list.document.all.tags("table");
	var divObjs = parent.d_list.document.all.tags("div");
	
	for( var i=0; i < divObjs.length; i++ ){
		if( divObjs(i).innerHTML.indexOf(key) == -1 ){
			tableObjs(i).style.display = "none";
		}
	}
}
