<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="4.0" encoding="UTF-8"/>


<xsl:template match="/">
	<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
		<link rel="stylesheet" href="../css/style.css" type="text/css"></link>
		<script language="JavaScript" src="../js/hidden.js"></script>
		<link rel="stylesheet" href="../css/left.css"></link>
		</head>
		<body bgcolor="#FFFFFF" leftmargin="5" topmargin="10" marginwidth="2" marginheight="2">
			<xsl:attribute name="onLoad">setTimeout('boVis(1)',300);frameLoad('contents','<xsl:value-of select="substring-before(//item/@default_url[1],'.xml')" />.html');changeImg('<xsl:value-of select="substring-after(substring-after(substring-before(//item[1]/@default_url,'.xml'),'/'),'/')" />');</xsl:attribute>
			<script language="JavaScript">
<xsl:comment>
urlArray = ['<xsl:value-of select="substring-before(//item/@default_url[1],'.xml')" />.html','<xsl:value-of select="substring-before(//item/@through_url[1],'.xml')" />.html<xsl:value-of select="substring-after(//item/@through_url[1],'.xml')" />'];
itemNum = '<xsl:value-of select="count(cm_menu/commentary/item)" />';
</xsl:comment>
			</script>
			<xsl:apply-templates select="cm_menu"/>
		</body>
	</html>
</xsl:template>

<xsl:template match="commentary">
	<table cellpadding="5" cellspacing="0" border="0" width="195">
		<tr>
			<td class="text00"><nobr><xsl:apply-templates select="name" /></nobr></td>
		</tr>
	</table>
	<table cellpadding="5" cellspacing="0" border="0" width="195">
		<xsl:for-each select="item">
			<tr><td height="5"></td></tr>
			<xsl:apply-templates />
		</xsl:for-each>
	</table>
</xsl:template>

<xsl:template match="Iname">
	<xsl:variable name="ID" select="substring-after(substring-after(substring-before(parent::item/@default_url,'.xml'),'/'),'/')" />
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td width="10" class="buttonbase">
						<xsl:attribute name="id">O<xsl:value-of select="$ID" /></xsl:attribute>
						<img src="../images/b_icon0.gif" width="10" height="20">
							<xsl:attribute name="id">I<xsl:value-of select="$ID" /></xsl:attribute>
						</img>
					</td>
					<td width="185">
						<div class="menu">
							<xsl:attribute name="id">C<xsl:value-of select="$ID" /></xsl:attribute>
							<xsl:attribute name="onClick">changeImg('<xsl:value-of select="$ID" />');contents_open('<xsl:value-of select="substring-before(parent::item/@default_url,'.xml')" />.html','<xsl:value-of select="parent::item/@through_url" />')</xsl:attribute>
							<xsl:attribute name="onMouseOver">mouseOverAndOut('<xsl:value-of select="$ID" />',0)</xsl:attribute>
							<xsl:attribute name="onMouseOut">mouseOverAndOut('<xsl:value-of select="$ID" />',1)</xsl:attribute>
							<xsl:attribute name="title"><xsl:apply-templates /></xsl:attribute>
							<xsl:apply-templates />
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</xsl:template>



</xsl:stylesheet>

