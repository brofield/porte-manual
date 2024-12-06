<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
	<html>
		<head>
			<title><xsl:value-of select="//TITLE[1]"/></title>
			<link rel="stylesheet" href="../css/main2.css" type="text/css" />
			<link rel="stylesheet" href="../css/button.css" type="text/css" />
			<script language="JavaScript1.2" src="../js/hidden.js"></script>
		</head>
		<body style="text-align:center" onload="boHid2Del();boVis(6);printAndClose();frameLoad('local','../../description/groupsa.html');setMokuji();changeImg(document.location.href.split('/')[document.location.href.split('/').length - 1].split('.')[0]);">
			<xsl:apply-templates />
<!--
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
-->
		</body>
	</html>
</xsl:template>


<xsl:template match="title">
	<xsl:element name="div">
		<xsl:attribute name="style">text-align:left;font-weight:bold;font-size:12px</xsl:attribute>
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>


<xsl:template match="table">
	<xsl:element name="table">
		<xsl:attribute name="width">95%</xsl:attribute>
		<xsl:attribute name="border">1</xsl:attribute>
		<xsl:attribute name="bordercolor">#FFFFFF</xsl:attribute>
		<xsl:attribute name="cellpadding">0</xsl:attribute>
		<xsl:attribute name="cellspacing">0</xsl:attribute>
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>

<xsl:template match="tr">
	<xsl:element name="tr">
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>

<xsl:template match="thead">
	<xsl:element name="td">
		<xsl:attribute name="class">gray2</xsl:attribute>
	<xsl:call-template name="attribute-td" />
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>

<xsl:template match="t_title">
	<xsl:element name="td">
		<xsl:attribute name="class">gray3</xsl:attribute>
		<xsl:attribute name="width">30%</xsl:attribute>
		<xsl:call-template name="attribute-td" />
		<xsl:attribute name="style">background-color:#dde3e6;cursor:hand</xsl:attribute>
		<xsl:attribute name="onMouseOver">this.style.backgroundColor='#c7d0d6';this.style.color='#dc883d'</xsl:attribute>
		<xsl:attribute name="onMouseOut">this.style.backgroundColor='#dde3e6';this.style.color='#666666'</xsl:attribute>
		<xsl:attribute name="onClick">frameLoad('local','<xsl:value-of select="substring-before(../td/ref/@local,'.')" />.html')</xsl:attribute>
		<xsl:element name="div">
			<xsl:apply-templates />
		</xsl:element>
	</xsl:element>
</xsl:template>

<xsl:template match="td">
	<xsl:element name="td">
	<xsl:attribute name="width">70%</xsl:attribute>
	<xsl:call-template name="attribute-td" />
		<xsl:attribute name="style">background-color:#c7d0d6;cursor:hand;padding:3px;font-size:12px;color:#666666;border:white 1px solid</xsl:attribute>
		<xsl:attribute name="onMouseOver">this.style.backgroundColor='#dde3e6';this.style.color='#dc883d'</xsl:attribute>
		<xsl:attribute name="onMouseOut">this.style.backgroundColor='#c7d0d6';this.style.color='#666666'</xsl:attribute>
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>

<xsl:template name="attribute-td">
	<xsl:if test="@colspan">
		<xsl:attribute name="colspan"><xsl:value-of select="@colspan" /></xsl:attribute>
	</xsl:if>
	<xsl:if test="@rowspan">
		<xsl:attribute name="rowspan"><xsl:value-of select="@rowspan" /></xsl:attribute>
	</xsl:if>
</xsl:template>


<xsl:template match="ref">
<!--	<xsl:element name="a">-->
		<xsl:attribute name="onClick">javascript:pocModal('<xsl:value-of select="substring-before(@contents,'.xml')" />.html')</xsl:attribute>
<!--		<xsl:attribute name="href">javascript:frameLoad('local','<xsl:value-of select="substring-before(@local,'.')" />.html')</xsl:attribute>-->
		<xsl:attribute name="class">button</xsl:attribute>
		<xsl:apply-templates />
<!--	</xsl:element>-->
</xsl:template>

<xsl:template match="a">
	<xsl:element name="a">
		<xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>
