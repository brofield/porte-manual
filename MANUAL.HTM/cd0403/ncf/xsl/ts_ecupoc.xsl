<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
	<html>
		<head>
			<title><xsl:value-of select="//name[1]"/></title>
			<link rel="stylesheet" href="../css/main2.css" type="text/css" />
			<link rel="stylesheet" href="../css/button.css" type="text/css" />
			<script language="JavaScript1.2" src="../js/hidden.js"></script>
		</head>
		<body onLoad="top.local.document.location.href='s00loc3.html';setMokuji();boVis(5);">
			<xsl:element name="div">
				<xsl:attribute name="style">text-align:left;font-weight:bold;font-size:12px</xsl:attribute>
				<xsl:value-of select="//name[1]" />
			</xsl:element>
			<xsl:apply-templates />
<!--
		<body style="text-align:center" onload="boHid2Del();boVis(5);printAndClose();frameLoad('local','s00loc.html');setMokuji()">
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
-->
		</body>
	</html>
</xsl:template>


<xsl:template match="cm_menu">
	<xsl:element name="table">
		<xsl:attribute name="width">95%</xsl:attribute>
		<xsl:attribute name="border">1</xsl:attribute>
		<xsl:attribute name="bordercolor">#FFFFFF</xsl:attribute>
		<xsl:attribute name="cellpadding">0</xsl:attribute>
		<xsl:attribute name="cellspacing">0</xsl:attribute>
		<tr>
			<td class="gray2">セクション</td><td class="gray2">タイトル</td>
		</tr>
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>

<xsl:template match="name">
</xsl:template>

<xsl:template match="item">
	<xsl:variable name="Number">
		<xsl:number count="item" />
	</xsl:variable>
	<xsl:variable name="Count" select="count(//item)" />
	<xsl:choose>
		<xsl:when test="$Number = '1'">
			<tr>
				<xsl:element name="td">
					<xsl:attribute name="class">gray3</xsl:attribute>
					<xsl:attribute name="width">30%</xsl:attribute>
					<xsl:attribute name="rowspan"><xsl:value-of select="$Count" /></xsl:attribute>
					<xsl:attribute name="style">background-color:#dde3e6;cursor:hand</xsl:attribute>
					<xsl:attribute name="onMouseOver">this.style.backgroundColor='#c7d0d6';this.style.color='#dc883d'</xsl:attribute>
					<xsl:attribute name="onMouseOut">this.style.backgroundColor='#dde3e6';this.style.color='#666666'</xsl:attribute>
					<xsl:attribute name="onClick">frameLoad('local','ts_eculoc.html')</xsl:attribute>
					<xsl:element name="div"><xsl:value-of select="../name" /></xsl:element>
				</xsl:element>
				<xsl:element name="td">
					<xsl:attribute name="width">70%</xsl:attribute>
					<xsl:attribute name="style">background-color:#c7d0d6;cursor:hand;padding:3px;font-size:12px;color:#666666;border:white 1px solid</xsl:attribute>
					<xsl:attribute name="onMouseOver">this.style.backgroundColor='#dde3e6';this.style.color='#dc883d'</xsl:attribute>
					<xsl:attribute name="onMouseOut">this.style.backgroundColor='#c7d0d6';this.style.color='#666666'</xsl:attribute>
					<xsl:attribute name="onClick">javascript:pocModal('<xsl:value-of select="substring-before(@default_url,'.xml')" />.html')</xsl:attribute>
					<xsl:attribute name="class">button</xsl:attribute>
					<xsl:apply-templates />
				</xsl:element>
			</tr>
		</xsl:when>
		<xsl:otherwise>
			<tr>
				<xsl:element name="td">
					<xsl:attribute name="width">70%</xsl:attribute>
					<xsl:attribute name="style">background-color:#c7d0d6;cursor:hand;padding:3px;font-size:12px;color:#666666;border:white 1px solid</xsl:attribute>
					<xsl:attribute name="onMouseOver">this.style.backgroundColor='#dde3e6';this.style.color='#dc883d'</xsl:attribute>
					<xsl:attribute name="onMouseOut">this.style.backgroundColor='#c7d0d6';this.style.color='#666666'</xsl:attribute>
					<xsl:attribute name="onClick">javascript:pocModal('<xsl:value-of select="substring-before(@default_url,'.xml')" />.html')</xsl:attribute>
					<xsl:attribute name="class">button</xsl:attribute>
					<xsl:apply-templates />
				</xsl:element>
			</tr>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
