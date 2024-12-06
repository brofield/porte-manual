function call_runOnLoadProc()
{
	var obj = document.all("page_1");
	if( obj != null ){
		setActiveStyle(obj);
	}
}


function call_runOnClickPage(pdfName)
{
	loadPDF(pdfName);
	resetStyle();
	setActiveStyle(event.srcElement);
}


function loadPDF(fileName)
{
	parent.fig_pdf.location.href="../pdf/" + fileName.toLowerCase() + ".pdf";
}


function resetStyle()
{
	var obj = document.all.tags("td");
	
	for(var i=0; i < obj.length; i++ ){
		if( obj(i).className != "rect-white" )
			obj(i).className = "rect-white";
	}
}


function setActiveStyle(obj)
{
	obj.className = "rect-gray";
}