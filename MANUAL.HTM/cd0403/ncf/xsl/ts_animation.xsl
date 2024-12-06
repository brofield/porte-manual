<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="4.0" encoding="UTF-8" />

<xsl:attribute-set name="enlarge">
	<xsl:attribute name="type">submit</xsl:attribute>
	<xsl:attribute name="style">font-size:10px</xsl:attribute>
	<xsl:attribute name="name">submit</xsl:attribute>
	<xsl:attribute name="value">拡大表示</xsl:attribute>
	<xsl:attribute name="onclick">newWin=window.open("../swf/<xsl:value-of select="url"/>.swf","newWin","resizable=yes,Width=950,Height=620");newWin.focus();</xsl:attribute>
</xsl:attribute-set>

<xsl:template match="/">
	<html>
		<head>
			<title></title>
			<link rel="stylesheet" href="../css/main2.css" type="text/css" />
			<link rel="stylesheet" href="../css/style.css" />
			<script language="JavaScript1.2" src="../js/hidden.js"></script>
		</head>
		<body onLoad="boVis(5);printAndClose();">
		 <table  width="100%" cellspacing="0" cellpadding="2" style="display:none" id="print">
			<tr> 
				<td align="left"> 
					<input type="submit" name="submit" value="印刷" onclick="printCheck()" />
				</td>
				<td align="center">　</td>
				<td align="right"> 
					<input type="submit" name="submit2" value="閉じる" onclick="closeWindow()" />
				</td>
			</tr>
		</table>
		<div style="text-align:center"><xsl:apply-templates select="animation"/></div>
		</body>
	</html>
</xsl:template>

<xsl:template match="animation">
	<table border="0" cellpadding="1" cellspacing="0" class="sty3" width="100%" height="0">
		<tr> 
			<td class="gray"> 
				<center>
					<xsl:value-of select="name"/>
				</center>
			</td>
		</tr>
	</table>
	<br/>
	<br/>
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr> 
			<td class="blue2">
				<xsl:apply-templates select="sc/name"/>
			</td>
		</tr>
	</table>
	<table width="600" border="1" cellspacing="5" cellpadding="2" bordercolor="#FFFFFF">
	<xsl:apply-templates select="line"/>
	</table>
</xsl:template>

<xsl:template match="line">
	<xsl:for-each select=".">
		<tr align="center" valign="middle"> 
			<xsl:apply-templates select="file"/>
		</tr>
	</xsl:for-each>
</xsl:template>

<xsl:template match="file">
	<xsl:for-each select=".">
			<td width="300" height="300" class="gray4">
				<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,79,0" width="250" height="125">
					<xsl:element name="param">
					<xsl:attribute name="name">movie</xsl:attribute>
					<xsl:attribute name="value">../swf/<xsl:value-of select="url"/>.swf</xsl:attribute>
					</xsl:element>
					<param name="quality" value="hight"/>
				</object>
				<br/><br/>
				<input xsl:use-attribute-sets="enlarge" />
				<br/><br/>
				<xsl:value-of select="name"/>
				<br/>
				<xsl:value-of select="txt"/>
			</td>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
