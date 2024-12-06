<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="UTF-8"/>
	<xsl:template match="/">
		<html>
		<head>
		<script language="JavaScript" src="../js/date.js" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
		</head>
		<body>
		<script language="JavaScript">
		<xsl:comment>
		<xsl:apply-templates select="index/select"/>
		</xsl:comment>
		</script>
		</body>
		</html>
	</xsl:template>
	<xsl:template match="select">
	dateArray('<xsl:value-of select="@date"/>','<xsl:value-of select="repair"/>','<xsl:value-of select="ncf"/>','<xsl:value-of select="frp"/>');
	</xsl:template>	
</xsl:stylesheet>

