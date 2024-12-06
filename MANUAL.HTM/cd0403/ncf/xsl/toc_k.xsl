<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
  <html>
    <head>
      <title><xsl:value-of select="//TITLE[1]"/></title>
      <link rel="stylesheet" href="../css/main2.css" type="text/css" />
      <link rel="stylesheet" href="../css/button.css" type="text/css" />
<script language="JavaScript1.2" src="../js/mokuji.js"></script>
    </head>
    <body style="text-align:center" onLoad="onLoadMokuji()">
      <xsl:apply-templates />
      <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
      <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
      <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    </body>
  </html>
</xsl:template>


<!-- ■■■■■■■■■■タイトル■■■■■■■■■■■ -->
<xsl:template match="title">
  <xsl:element name="div">
    <xsl:attribute name="style">text-align:left;font-weight:bold;font-size:12px</xsl:attribute>
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>


<!-- ■■■■■■■■■■テーブル■■■■■■■■■■ -->
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
      <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<xsl:template match="td">
    <xsl:element name="td">
    <xsl:attribute name="width">70%</xsl:attribute>
    <xsl:call-template name="attribute-td" />
      <xsl:apply-templates />
    </xsl:element>
</xsl:template>

<!-- □□□□□□表用テンプレート□□□□□□ -->
<xsl:template name="attribute-td">
  <xsl:if test="@colspan">
    <xsl:attribute name="colspan"><xsl:value-of select="@colspan" /></xsl:attribute>
  </xsl:if>
  <xsl:if test="@rowspan">
    <xsl:attribute name="rowspan"><xsl:value-of select="@rowspan" /></xsl:attribute>
  </xsl:if>
</xsl:template>


<!-- ■■■■■■■■■■リンク■■■■■■■■■■■ -->
<xsl:template match="ref">
  <xsl:element name="a">
    <xsl:attribute name="href">javascript:jump2Contents('<xsl:value-of select="@local" />','<xsl:value-of select="@contents" />','<xsl:value-of select="@id" />')</xsl:attribute>
    <xsl:attribute name="class">button</xsl:attribute>
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<xsl:template match="a">
  <xsl:element name="a">
    <xsl:attribute name="name"><xsl:value-of select="@name" /></xsl:attribute>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
