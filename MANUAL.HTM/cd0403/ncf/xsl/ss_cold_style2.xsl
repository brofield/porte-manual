<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="4.0" encoding="UTF-8" />


<xsl:template match="/">
  <html>
    <head>
      <title><xsl:value-of select="//TITLE[1]"/></title>
      <link rel="stylesheet" href="../css/main2.css" type="text/css" />
      <link rel="stylesheet" href="../css/style.css" />  
      <script language="JavaScript" src="../js/hidden.js" />
    </head>

    <body onload="printAndClose();setTab(0)">
      <form name="divValue">
        <INPUT TYPE="hidden" NAME="hid" VALUE="0"/>
        <INPUT TYPE="hidden" NAME="tm" VALUE="0"/>
      </form>
      <table width="100%" cellspacing="0" cellpadding="2" style="display:none" id="print">
        <tr> 
          <td align="left"> 
            <input type="submit" name="submit" value="印刷" onClick="printCheck()"/>
          </td>
          <td align="center">　</td>
          <td align="right"> 
            <input type="submit" name="submit2" value="閉じる" onClick="closeWindow()"/>
          </td>
        </tr>
      </table>

      <div align="left"><xsl:apply-templates /></div>
    </body>
  </html>
</xsl:template>

<!-- SCTITLE -->
<xsl:template match="SCTITLE">
  <!-- SCTITLEは本文に表示しないので何もしない -->
</xsl:template>

<!-- タイトル 2003.07.08.修正-->
<xsl:template match="PARA/TITLE">
  <table width="100%" cellspacing="0" cellpadding="0">
    <tr> 
    <xsl:choose>
    <xsl:when test="../@INFOTYPE[. = 'SYSTEM']">
      <td align="center" class="blue">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td width="5%" class="blue">　</td>
            <td width="80%" class="blue" align="center"><xsl:apply-templates/></td>
            <td align="right" class="blue" width="15%"><img src="../images/memo_0.gif" width="40" height="20"/></td>
          </tr>
        </table>
      </td>
    </xsl:when>
    <xsl:when test="../@INFOTYPE[. = 'PARTS']">
      <td align="center" class="gray">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td width="5%" class="gray">　</td>
            <td width="80%" class="gray" align="center"><xsl:apply-templates/></td>
            <td align="right" class="gray" width="15%"><img src="../images/memo_0.gif" width="40" height="20"/></td>
          </tr>
        </table>
      </td>
    </xsl:when>
    <xsl:when test="../@INFOTYPE[. = 'GENERAL']">
      <td align="center" class="gray">
        <xsl:apply-templates/>
      </td>
    </xsl:when>
    </xsl:choose>
    </tr>
  </table>
  <br/>
	<xsl:element name="form">
		<xsl:element name="input">
			<xsl:attribute name="type">radio</xsl:attribute>
			<xsl:attribute name="name">radiobutton1</xsl:attribute>
			<xsl:attribute name="value">radiobutton1</xsl:attribute>
			<xsl:attribute name="onClick">changeCold1()</xsl:attribute>
			主要装備一覧
		</xsl:element>
		<br/>
		<xsl:element name="input">
			<xsl:attribute name="type">radio</xsl:attribute>
			<xsl:attribute name="name">radiobutton1</xsl:attribute>
			<xsl:attribute name="value">radiobutton1</xsl:attribute>
			<xsl:attribute name="onClick">changeCold2()</xsl:attribute>
			<xsl:attribute name="checked" />
			寒冷地仕様一覧
		</xsl:element>
	</xsl:element>
</xsl:template>


<!-- PTXT -->
<xsl:template match="PTXT">
  <div>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<!-- SUP -->
<xsl:template match="SUP">
  <SUP>
    <xsl:apply-templates/>
  </SUP>
</xsl:template>

<!-- SUB -->
<xsl:template match="SUB">
  <SUB>
    <xsl:apply-templates/>
  </SUB>
</xsl:template>

<!-- 特別 -->
<xsl:template match="INFOSUB/TITLE">
  <table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="blue2">
        <xsl:apply-templates/>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="INFOSUB">
 <br/>
  <table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="color1">
        <xsl:apply-templates/>
      </td>
    </tr>
  </table>
 <br/>
</xsl:template>

<xsl:template match="TABLE/TITLE">
  <table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="blue2">
        <xsl:apply-templates/>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="MECA/TITLE">
  <table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="blue2">
        <xsl:apply-templates/>
      </td>
    </tr>
  </table>
</xsl:template>

<xsl:template match="HINT">
  <table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="blue2">参　考
      </td>
    </tr>
  </table>
  <table width="95%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td class="text">
        <xsl:apply-templates/>
      </td>
    </tr>
  </table>
 <br/>
</xsl:template>



<!-- 表 -->
<xsl:template match="TABLE/TGROUP">
  <br/>
  <table width="95%" border="1" cellspacing="0" cellpadding="5" bordercolor="#FFFFFF">
    <xsl:for-each select="THEAD/ROW">
      <tr>
        <xsl:for-each select="ENTRY">
          <td>
            <xsl:attribute name="class">gray3_dark</xsl:attribute>
            <xsl:call-template name="Attribute-table"/>
            <xsl:apply-templates/>
          </td>
        </xsl:for-each>
      </tr>
    </xsl:for-each>
    <xsl:for-each select="TBODY/ROW">
    <xsl:if test="descendant::ENTRY/@TYPE='ON'">
      <tr>
        <xsl:for-each select="ENTRY">
        <xsl:if test="@TYPE='ON'">
          <td>
            <xsl:call-template name="Attribute-table"/>
            <xsl:attribute name="class">color1</xsl:attribute>
            <xsl:apply-templates/>
          </td>
        </xsl:if>
        </xsl:for-each>
      </tr>
    </xsl:if>
    </xsl:for-each>
  </table>
  <br/>
</xsl:template>





<!-- matome syori -->
  <xsl:template name="A-Tag-ID">
    <xsl:if test="@ID">
      <xsl:element name="a">
        <xsl:attribute name="name"><xsl:value-of select="@ID"/></xsl:attribute>
      </xsl:element>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-ID">
    <xsl:if test="@ID">
      <xsl:attribute name="id"><xsl:value-of select="@ID"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-TTL">
    <xsl:if test="@TITLE">
      <xsl:attribute name="title"><xsl:value-of select="@TITLE"/></xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="Attribute-colsep0">
    <xsl:if test="@COLSEP">
      <xsl:attribute name="border">0</xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-colsep">
    <xsl:if test="@COLSEP">
      <xsl:attribute name="border"><xsl:value-of select="@COLSEP"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="Attribute-frame">
    <xsl:if test="@FRAME">
      <xsl:attribute name="frame"><xsl:value-of select="@FRAME"/></xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="Attribute-align">
    <xsl:if test="@ALIGN">
      <xsl:attribute name="align"><xsl:value-of select="@ALIGN"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-char">
    <xsl:if test="@CHAR">
      <xsl:attribute name="char"><xsl:value-of select="@CHAR"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-charoff">
    <xsl:if test="@CHAROFF">
      <xsl:attribute name="charoff"><xsl:value-of select="@CHAROFF"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-span">
    <xsl:if test="@SPAN">
      <xsl:attribute name="span"><xsl:value-of select="@SPAN"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-valign">
    <xsl:if test="@VALIGN">
      <xsl:attribute name="valign"><xsl:value-of select="@VALIGN"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-width">
    <xsl:if test="@WIDTH">
      <xsl:attribute name="width"><xsl:value-of select="floor((substring-before(@WIDTH,'in'))*72)"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-height">
    <xsl:if test="@HEIGHT">
      <xsl:attribute name="height"><xsl:value-of select="floor((substring-before(@HEIGHT,'in'))*72)"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-border0">
    <xsl:attribute name="border">0</xsl:attribute>
  </xsl:template>
  <xsl:template name="Attribute-border">
    <xsl:if test="@BORDER">
      <xsl:attribute name="border"><xsl:value-of select="@BORDER"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-enumtype">
    <xsl:if test="@ENUMTYPE">
      <xsl:attribute name="type"><xsl:value-of select="@ENUMTYPE"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-cellpadding">
    <xsl:if test="@CELLPADDING">
      <xsl:attribute name="cellpadding"><xsl:value-of select="@CELLPADDING"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-cellspacing">
    <xsl:if test="@CELLSPACING">
      <xsl:attribute name="cellspacing"><xsl:value-of select="@CELLSPACING"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-datafld">
    <xsl:if test="@DATAFLD">
      <xsl:attribute name="datafld"><xsl:value-of select="@DATAFLD"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-colspan">
  
    <xsl:if test="@NAMEST">
      <xsl:attribute name="colspan"><xsl:value-of select="@NAMEEND - @NAMEST + 1"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
<!--
  <xsl:template name="Attribute-colspan">
    <xsl:if test="@COLSPAN">
      <xsl:attribute name="colspan"><xsl:value-of select="@COLSPAN"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
-->
  <xsl:template name="Attribute-rowspan">
    <xsl:if test="@MOREROWS">
      <xsl:attribute name="rowspan"><xsl:value-of select="@MOREROWS + 1"/></xsl:attribute>
    </xsl:if>
  </xsl:template>


  <xsl:template name="Attribute-class">
    <xsl:if test="@CLASS">
      <xsl:attribute name="class"><xsl:value-of select="@CLASS"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-codebase">
    <xsl:if test="@CODEBASE">
      <xsl:attribute name="codebase"><xsl:value-of select="@CODEBASE"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-type">
    <xsl:if test="@TYPE">
      <xsl:attribute name="type"><xsl:value-of select="@TYPE"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-value">
    <xsl:if test="@VALUE">
      <xsl:attribute name="value"><xsl:value-of select="@VALUE"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-valuetype">
    <xsl:if test="@VALUETYPE">
      <xsl:attribute name="valuetype"><xsl:value-of select="@VALUETYPE"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-graphic">
    <xsl:if test="@GRAPHICNAME">
      <xsl:attribute name="src"><xsl:value-of select="@GRAPHICNAME"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-img">
    <xsl:if test="@GRAPHICNAME">
      <xsl:attribute name="src">../grph_ent<xsl:value-of select="@GRAPHICNAME"/></xsl:attribute>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Attribute-symbol">
    <xsl:if test="@NAME">
      <xsl:attribute name="src">../grph_ent<xsl:value-of select="@NAME"/></xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="Attribute-bg">
      <xsl:attribute name="bgcolor">#FFFFFF</xsl:attribute>
  </xsl:template>

<!--
  <xsl:template name="Attribute-bg">
      <xsl:attribute name="bgcolor">#FFFFCC</xsl:attribute>
  </xsl:template>
  <xsl:template name="Attribute-bg">
      <xsl:attribute name="bgcolor">#CCFFFF</xsl:attribute>
  </xsl:template>
-->

  <xsl:template name="Attribute-bg0">
      <xsl:attribute name="bgcolor">#FFFFFF</xsl:attribute>
  </xsl:template>


<!-- テーブル用テンプレート　2003.07.08. -->
  <xsl:template name="Attribute-table">
    <xsl:variable name="COLNAME" select="@COLNAME"/><!-- widthの値を変数に入れる -->
    <xsl:call-template name="Attribute-align"/>
    <xsl:call-template name="Attribute-valign"/>
    <xsl:call-template name="Attribute-rowspan"/>
    <xsl:call-template name="Attribute-colspan"/>
  </xsl:template>

</xsl:stylesheet>
