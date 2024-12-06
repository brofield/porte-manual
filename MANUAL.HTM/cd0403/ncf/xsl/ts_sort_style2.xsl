<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>ソート</title>
      </head>
      <body>
      </body>
      <xsl:apply-templates select="document" />
    </html>
  </xsl:template>

<xsl:template match="document">
  <table border="1" cellspacing="0" cellpadding="2" width="95%" bordercolor="#FFFFFF">
    <tr>
      <th class="gray2" align="center">
        品名コード
        <input type="button" value="▼" onClick="sort1()" />
      </th>
      <th class="color2" align="center">
        ＳＳ修理品目
        <input type="button" value="▼" onClick="sort2()" />
      </th>
      <th class="gray2" align="center">
        メーカー
        <input type="button" value="▼" onClick="sort3()" />
      </th>
    </tr>
    <xsl:for-each select="info">
      <xsl:sort select="category" data-type="text"/>
      <tr>
        <td class="gray3_dark" align="center">
          <xsl:apply-templates select="code/ptxt" />
        </td>
        <td class="gray3" align="center">
          <xsl:apply-templates select="category/ptxt" />
        </td>
        <td class="gray3_dark" align="center">
          <xsl:apply-templates select="maker/ptxt" />
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
