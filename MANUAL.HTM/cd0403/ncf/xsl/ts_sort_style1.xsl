<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0" encoding="UTF-8" />

<xsl:template match="/">
  <html>
    <head>
      <title><xsl:value-of select="//title[1]" /></title>
      <link rel="stylesheet" href="../css/main2.css" type="text/css" />
      <link rel="stylesheet" href="../css/style.css" type="text/css" />
      <script language="JavaScript" src="../js/hidden.js"></script>
    </head>
    <body onLoad="boVis(5)">
    <xsl:apply-templates select="document" />
    </body>
  </html>
</xsl:template>

<xsl:template match="document">
  <table border="0" cellspacing="0" cellpadding="2" width="100%">
    <tr>
      <td class="gray" colspan="4">
        <center>
          <font class="bold"><xsl:apply-templates select="title"/></font> 
        </center>
      </td>
    </tr>
  </table><br />
  <table border="1" cellspacing="0" cellpadding="2" width="95%" bordercolor="#FFFFFF">
    <tr>
      <th class="gray2" align="center">
        品名コード
      </th>
      <th class="gray2" align="center">
        ＳＳ修理品目
      </th>
      <th class="gray2" align="center">
        メーカー
      </th>
    </tr>
    <xsl:for-each select="info">
      <xsl:sort select="code" data-type="text"/>
      <tr>
        <td class="gray3" align="center">
          <xsl:if test="code/ptxt!=''"><xsl:apply-templates select="code/ptxt" /></xsl:if><xsl:if test="code/ptxt=''">&#160;</xsl:if>
        </td>
        <td class="gray3_dark" align="center">
					<xsl:attribute name="style">background-color:#C7D0D6;padding-top:2px;padding-left:2px;color:#666666;text-align:center</xsl:attribute>
          <xsl:if test="category/ptxt!=''"><xsl:apply-templates select="category/ptxt" /></xsl:if><xsl:if test="category/ptxt=''">&#160;</xsl:if>
        </td>
        <td class="gray3_dark" align="center">
					<xsl:attribute name="style">background-color:#C7D0D6;padding-top:2px;padding-left:2px;color:#666666;text-align:center</xsl:attribute>
          <xsl:if test="maker/ptxt!=''"><xsl:apply-templates select="maker/ptxt" /></xsl:if><xsl:if test="maker/ptxt=''">&#160;</xsl:if>
        </td>
      </tr>
    </xsl:for-each>
  </table>
</xsl:template>

<xsl:template match="ptxt">
  <div>
    <xsl:apply-templates />
  </div>
</xsl:template>

</xsl:stylesheet>
