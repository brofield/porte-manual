function call_runOnLoad()
{
	var loads = getLoads();
	
	if( loads == "ps_capacity" ){
		document.all("optCapacity").checked = true;
	}
	if( loads == "ps_name" ){
		document.all("optName").checked = true;
	}
}

function getLoads()
{
	var currentLocation = location.pathname;
	var currentFN = currentLocation.match(/ps_capacity.html$|ps_name.html$/);
	
	returnST="gp";
	if( currentFN == "ps_capacity.html" ){
		returnST="ps_capacity";
	}
	if( currentFN == "ps_name.html" ){
		returnST="ps_name";
	}
	return(returnST);
}

function call_runOnClickSystemProc( code )
{
	top.window.location.href="../system/main/" + code.toLowerCase() + ".html";
}

function call_runOnClickRoutingProc( code )
{
	top.window.location.href="../routing/main/" + code.toLowerCase() + ".html";
}

function call_runOnClickRelayProc( code )
{
	top.window.location.href="../relay/main/" + code.toLowerCase() + ".html";
}

function call_runOnClickOrder( order )
{
	if( order == "capacity" )
	{
		location.href="ps_capacity.html";
		return;
	}
	
	if( order == "name" )
	{
		location.href="ps_name.html";
		return;
	}
}
