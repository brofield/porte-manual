<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="4.0" encoding="UTF-8" />

<xsl:template match="/">
	<html>
		<head>
			<title><xsl:value-of select="//TITLE[1]"/></title>
			<link rel="stylesheet" href="../css/main2.css" type="text/css" />
			<link rel="stylesheet" href="../css/style.css" type="text/css" />
			<script language="JavaScript" src="../js/hidden.js" />
		</head>
		<body onload="printAndCloseZ();setTab(1)">
			<form name="divValue">
				<xsl:element name="input">
					<xsl:attribute name="type">hidden</xsl:attribute>
					<xsl:attribute name="name">hid</xsl:attribute>
					<xsl:attribute name="value"><xsl:value-of select="$printNumber + 1"/></xsl:attribute>
				</xsl:element>
<!--
				<INPUT TYPE="hidden" NAME="hid" VALUE="3"/>
				<INPUT TYPE="hidden" NAME="tm" VALUE="2"/>
-->
			</form>
			<table width="100%" cellspacing="0" cellpadding="2" style="display:none" id="print">
				<tr>
					<td align="left" width="20%" id="print3">
						<input title="チェックの入った項目を印刷します" type="submit" name="submit" value="印刷確認" onClick="printSelect()"/>
					</td>
					<td align="left" width="20%" style="display:none" id="print4">
						<input type="submit" name="submit" value="印刷" onClick="printCheck()"/>
					</td>
					<td align="center" width="80%">
						<table border="0" width="100%" cellpadding="2" cellspacing="0" id="print2">
							<tr>
								<td align="center">
									<input type="submit" name="submit3" value="全選択" onClick="selectAll(true)"/>
									<input type="submit" name="submit4" value="全解除" onClick="selectAll(false)"/>
								</td>
							</tr>
						</table>
					</td>
					<td align="right" width="20%">
						<input type="submit" name="submit2" value="閉じる" onclick="closeWindow()"/>
					</td>
				</tr>
			</table>
			<div align="left"><form name="bmform"><xsl:apply-templates /></form></div>
			<div id="print5">
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
				<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
			</div>
		</body>
	</html>
</xsl:template>


<xsl:template match="SECTION">
	<xsl:element name="a">
		<xsl:attribute name="name"><xsl:number format="1" level="any" count="SECTION"/></xsl:attribute>
	</xsl:element>
	<xsl:element name="div">
		<xsl:attribute name="id">bm<xsl:number format="1" level="any" count="SECTION"/></xsl:attribute>
	<xsl:apply-templates />
	</xsl:element>
</xsl:template>


<!-- 印刷用変数宣言 -->
<xsl:variable name="printNumber" select="count(//SECTION)"/>


<!-- SCTITLE -->
<xsl:template match="SCTITLE">
	<!-- SCTITLEは本文に表示しないので何もしない -->
</xsl:template>


<!-- チェックボックス用テンプレート	2003.09.26.追加 -->
<xsl:template name="Input">
	<xsl:if test="../../@SCID">
		<xsl:element name="input">
			<xsl:attribute name="type">checkbox</xsl:attribute>
			<xsl:attribute name="name">check<xsl:number format="1" level="any" count="SECTION"/></xsl:attribute>
			<xsl:attribute name="value">checkbox</xsl:attribute>
			<xsl:attribute name="style">display:none</xsl:attribute>
		</xsl:element>
	</xsl:if>
</xsl:template>
<!-- メモ用テンプレート	2003.09.19.追加 -->
<xsl:template name="memo">
<!--
	<xsl:element name="img">
		<xsl:attribute name="src">../images/memo_w.gif</xsl:attribute>
		<xsl:attribute name="width">40</xsl:attribute>
		<xsl:attribute name="height">20</xsl:attribute>
		<xsl:attribute name="id"><xsl:value-of select="../@INFOID" /></xsl:attribute>
		<xsl:attribute name="onClick">memo('<xsl:value-of select="../@INFOID" />','<xsl:apply-templates />')</xsl:attribute>
		<xsl:attribute name="style">cursor:hand</xsl:attribute>
	</xsl:element>
-->
</xsl:template>
<!-- タイトル 2003.07.08.修正-->
<xsl:template match="TITLE">
	<xsl:choose>
	<xsl:when test="parent::PARA">
		<table width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<xsl:choose>
				<xsl:when test="parent::PARA/@INFOTYPE='SYSTEM'">
					<td width="5%" class="blue"><xsl:call-template name="Input" /></td>
					<td width="80%" class="blue" align="center"><xsl:apply-templates/></td>
					<td align="right" class="blue" width="15%"> </td>
				</xsl:when>
				<xsl:when test="parent::PARA/@INFOTYPE='PARTS'">
					<td width="5%" class="gray"><xsl:call-template name="Input" /></td>
					<td width="80%" class="gray" align="center"><xsl:apply-templates/></td>
					<td align="right" class="gray" width="15%"> </td>
				</xsl:when>
				<xsl:otherwise>
					<td align="center" class="gray"><xsl:apply-templates/></td>
				</xsl:otherwise>
				</xsl:choose>
			</tr>
		</table>
	</xsl:when>
	<xsl:when test="parent::MECA or parent::INDICATE or parent::BIND or parent::SPEC">
		<!-- MECA,INDICATE,BINDのTITLEは、下の「MECA」で定義 -->
	</xsl:when>
	<xsl:when test="parent::LIST1">
		<tr>
			<td colspan="2">
				<br />
				<table width="95%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="blue2"><xsl:apply-templates /></td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:when>
	<xsl:otherwise>
		<br />
		<table width="95%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="blue2"><xsl:apply-templates /></td>
			</tr>
		</table>
	</xsl:otherwise>
	</xsl:choose>
	<br />
</xsl:template>


<!-- LIST用テンプレート -->
<xsl:template name="List">
	<xsl:choose>
	<xsl:when test="ancestor::LIST1">
		<table width="100%" border="0" cellspacing="0" cellpadding="2">
			<xsl:apply-templates />
		</table>
	</xsl:when>
	<xsl:otherwise>
		<table width="95%" border="0" cellspacing="0" cellpadding="2">
			<xsl:apply-templates />
		</table>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>
<!-- LIST -->
<xsl:template match="LIST1">
	<xsl:call-template name="List" />
</xsl:template>
<xsl:template match="LIST2">
	<tr>
		<td width="22">　</td>
		<td align="right">
			<xsl:call-template name="List" />
		</td>
	</tr>
</xsl:template>
<xsl:template match="LIST3">
	<tr>
		<td width="22">　</td>
		<td align="right">
			<xsl:call-template name="List" />
		</td>
	</tr>
</xsl:template>

<!-- ITEM用テンプレート -->
<xsl:template name="Item">
	<tr>
		<td width="22" align="center" valign="top" class="text">●</td>
		<td class="text"><xsl:apply-templates /></td>
	</tr>
</xsl:template>
<!-- ITEM -->
<xsl:template match="ITEM">
	<xsl:choose>
	<xsl:when test="ancestor::HINT">
		<xsl:variable name="HintID" select="descendant::PTXT/@ID" />
		<xsl:variable name="IDLength" select="string-length($HintID)" />
		<tr>
			<td width="27" align="center" valign="top" class="text">＊<xsl:if test="preceding-sibling::ITEM or following-sibling::ITEM"><xsl:number /></xsl:if></td>
<!--
			<xsl:choose>
			<xsl:when test="count(../ITEM) = 1">
				<td width="22" align="center" valign="top" class="text">＊</td>
			</xsl:when>
			<xsl:otherwise>
				<td width="27" align="center" valign="top" class="text">＊<xsl:number level="any" from="HINT" count="ITEM" format="1" />：</td>
			</xsl:otherwise>
			</xsl:choose>
-->
			<td class="text"><xsl:apply-templates /></td>
		</tr>
	</xsl:when>
	<xsl:when test="ancestor::CAUTION or ancestor::WARNING">
		<xsl:apply-templates />
	</xsl:when>
	<xsl:otherwise>
		<xsl:choose>
		<xsl:when test="ancestor::MECA">
			<xsl:choose>
			<xsl:when test="ancestor::TABLE">
				<xsl:apply-templates />
			</xsl:when>
			<xsl:when test="parent::LIST1">
				<tr>
					<td width="22" align="center" valign="top" class="text">・</td>
					<td class="text"><xsl:apply-templates /></td>
				</tr>
			</xsl:when>
			<xsl:when test="parent::LIST2">
				<xsl:choose>
				<xsl:when test="../@TYPE='UNORDERED' or not(../@TYPE)">
					<tr>
						<td width="22" align="center" valign="top" class="text">－</td>
						<td class="text"><xsl:apply-templates /></td>
					</tr>
				</xsl:when>
				<xsl:when test="../@TYPE='ORDERED'">
					<tr>
						<td width="22" align="center" valign="top" class="text">
							<xsl:number level="single" format="a" count="LIST2/ITEM"/>.
						</td>
						<td class="text"><xsl:apply-templates /></td>
					</tr>
				</xsl:when>
				</xsl:choose>
			</xsl:when>
		</xsl:choose>
	</xsl:when>
	<xsl:otherwise>
		<xsl:if test="ancestor::PARA">
			<xsl:choose>
			<xsl:when test="parent::LIST1">
				<tr>
					<td width="22" align="center" valign="top" class="text">●</td>
					<td class="text"><xsl:apply-templates /></td>
				</tr>
			</xsl:when>
			<xsl:when test="parent::LIST2">
				<xsl:choose>
				<xsl:when test="../@TYPE='UNORDERED' or not(../@TYPE)">
					<tr>
						<td width="22" align="center" valign="top" class="text">・</td>
						<td class="text"><xsl:apply-templates /></td>
						</tr>
					</xsl:when>
					<xsl:when test="../@TYPE='ORDERED'">
						<tr>
							<td width="22" align="center" valign="top" class="text">
								<xsl:number level="single" format="1" count="LIST2/ITEM"/>.
							</td>
							<td class="text"><xsl:apply-templates /></td>
						</tr>
					</xsl:when>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="parent::LIST3">
					<xsl:choose>
					<xsl:when test="../@TYPE='UNORDERED' or not(../@TYPE)">
						<tr>
							<td width="22" align="center" valign="top" class="text">－</td>
							<td class="text"><xsl:apply-templates /></td>
						</tr>
					</xsl:when>
					<xsl:when test="../@TYPE='ORDERED'">
						<tr>
							<td width="22" align="center" valign="top" class="text">
								<xsl:number level="single" format="A" count="LIST3/ITEM"/>.
							</td>
							<td class="text"><xsl:apply-templates /></td>
						</tr>
					</xsl:when>
					</xsl:choose>
				</xsl:when>
				</xsl:choose>
			</xsl:if>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<!-- 表示非表示(MECA,INDICATE,BIND) -->
<!-- 表示非表示(MECA,INDICATE,BIND)用テンプレート1 -->
<xsl:template name="Div">
	<br/>
	<xsl:element name="div">
		<xsl:attribute name="id">tm<xsl:value-of select="@ID"/></xsl:attribute>
			<xsl:if test="@INDSW = 'ON'">
				<xsl:attribute name="style">display:block</xsl:attribute>
			</xsl:if>
			<xsl:if test="@INDSW = 'OFF' or not(@INDSW)">
				<xsl:attribute name="style">display:none</xsl:attribute>
			</xsl:if>
		<br/>
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>
<!-- 表示非表示(MECA,INDICATE,BIND)用テンプレート2 -->
<xsl:template name="imID">
	<xsl:attribute name="border">0</xsl:attribute>
	<xsl:attribute name="id">im<xsl:value-of select="@ID"/></xsl:attribute>
	<xsl:attribute name="align">absmiddle</xsl:attribute>
</xsl:template>
<!-- 表示非表示(MECA,INDICATE,BIND)用テンプレート3 -->
<xsl:template name="Indicate">
	<table width="100%" cellspacing="0" cellpadding="2">
		<tr>
			<td class="frame">
				<xsl:element name="span">
					<xsl:attribute name="onClick">treeMenu('tm<xsl:value-of select="@ID"/>');chgImg('im<xsl:value-of select="@ID"/>');</xsl:attribute>
					<xsl:attribute name="onMouseOver">this.style.color = '#3B96BF';this.style.textDecoration = 'none'</xsl:attribute>
					<xsl:attribute name="onMouseOut">this.style.color = '#1B6384';this.style.textDecoration = 'underline'</xsl:attribute>
					<xsl:attribute name="style">cursor:hand;color:#1B6384;text-decoration = 'underline'</xsl:attribute>
						<xsl:element name="img">
							<xsl:choose>
							<xsl:when test="self::MECA">
								<xsl:if test="@MECATYPE = 'GENERAL'">
									<xsl:if test="@INDSW = 'ON'">
										<xsl:attribute name="src">../images/detail_b1.gif</xsl:attribute>
									</xsl:if>
									<xsl:if test="@INDSW = 'OFF' or not(@INDSW)">
										<xsl:attribute name="src">../images/detail_b0.gif</xsl:attribute>
									</xsl:if>
								</xsl:if>
								<xsl:if test="@MECATYPE = 'ACTUATE'">
									<xsl:if test="@INDSW = 'ON'">
										<xsl:attribute name="src">../images/detail1.gif</xsl:attribute>
									</xsl:if>
									<xsl:if test="@INDSW = 'OFF' or not(@INDSW)">
										<xsl:attribute name="src">../images/detail0.gif</xsl:attribute>
									</xsl:if>
								</xsl:if>
							</xsl:when>
							<xsl:when test="self::INDICATE">
								<xsl:if test="@INDSW = 'ON'">
									<xsl:attribute name="src">../images/detail1.gif</xsl:attribute>
								</xsl:if>
								<xsl:if test="@INDSW = 'OFF' or not(@INDSW)">
									<xsl:attribute name="src">../images/detail0.gif</xsl:attribute>
								</xsl:if>
							</xsl:when>
							<xsl:when test="self::BIND">
								<xsl:if test="@INDSW = 'ON'">
									<xsl:attribute name="src">../images/detail_a1.gif</xsl:attribute>
								</xsl:if>
								<xsl:if test="@INDSW = 'OFF' or not(@INDSW)">
									<xsl:attribute name="src">../images/detail_a0.gif</xsl:attribute>
								</xsl:if>
							</xsl:when>
							<xsl:when test="self::SPEC">
								<xsl:if test="@INDSW = 'ON'">
									<xsl:attribute name="src">../images/detail1.gif</xsl:attribute>
								</xsl:if>
								<xsl:if test="@INDSW = 'OFF' or not(@INDSW)">
									<xsl:attribute name="src">../images/detail0.gif</xsl:attribute>
								</xsl:if>
							</xsl:when>
							</xsl:choose>
							<xsl:call-template name="imID" />
						</xsl:element><xsl:value-of select="descendant::TITLE"/>
				</xsl:element>
				<xsl:call-template name="Div" />
			</td>
		</tr>
	</table>
	<br/>
</xsl:template>
<!-- MECA -->
<xsl:template match="MECA">
	<xsl:call-template name="Indicate" />
</xsl:template>
<!-- INDICATE -->
<xsl:template match="INDICATE">
	<xsl:call-template name="Indicate" />
</xsl:template>
<!-- BIND -->
<xsl:template match="BIND">
	<xsl:call-template name="Indicate" />
</xsl:template>
<!-- SPEC -->
<xsl:template match="SPEC">
	<xsl:call-template name="Indicate" />
</xsl:template>


<!-- イラスト用テンプレート -->
<xsl:template name="Img">
	<xsl:element name="img">
		<xsl:attribute name="src">../xml/grph_ent/<xsl:value-of select="@GRAPHICNAME"/>.png</xsl:attribute>
	</xsl:element>
</xsl:template>
<!-- イラスト -->
<xsl:template match="GRAPHIC">
	<xsl:choose>
	<xsl:when test="parent::FIGURE">
		<table width="100%" border="0" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center">
					<xsl:choose>
					<xsl:when test="../@FIGURETYPE='MOVIE'">
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0" width="500" height="250">
							<xsl:element name="param">
								<xsl:attribute name="name">movie</xsl:attribute>
								<xsl:attribute name="value">../swf/<xsl:value-of select="@GRAPHICNAME"/>.swf</xsl:attribute>
							</xsl:element>
							<param name="quality" value="hight"/>
						</object>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Img" />
					</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="Img" />
	</xsl:otherwise>
	</xsl:choose>
	<br />
</xsl:template>


<!-- HINT -->
<xsl:template match="HINT">
	<table width="95%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="blue2">参　考</td>
		</tr>
	</table>
	<xsl:apply-templates />
</xsl:template>

<!-- HINTREF -->
<xsl:template match="HINTREF">
	<xsl:variable name="href"><xsl:value-of select="@REFID" /></xsl:variable>
	<!-- 表内の注 -->
	<xsl:choose>
	<xsl:when test="ancestor::TABLE">
		<xsl:for-each select="(ancestor::TABLE/following::HINT[1]/LIST1/ITEM) | (ancestor::TABLE/LEGEND/HINT[1]/LIST1/ITEM)">
			<xsl:if test="PTXT/@ID = $href">
				<a href="{concat('#',$href)}"><sup>*<xsl:if test="preceding-sibling::ITEM or following-sibling::ITEM"><xsl:number format="1" /></xsl:if></sup></a>
			</xsl:if>
		</xsl:for-each>
	</xsl:when>
	<!-- 本文中の注 -->
	<xsl:otherwise>
		<xsl:for-each select="parent::PTXT/following-sibling::HINT[1]/LIST1/ITEM | parent::PTXT/following-sibling::HINT[1]/PTXT | ancestor::LIST1/following-sibling::HINT[1]/LIST1/ITEM | ancestor::CAUTION//HINT[1]/LIST1/ITEM">
			<xsl:if test="PTXT/@ID = $href">
				<a href="{concat('#',$href)}"><sup>*
					<xsl:if test="preceding-sibling::ITEM or following-sibling::ITEM"><xsl:number /></xsl:if>
				</sup></a>
			</xsl:if>
		</xsl:for-each>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<!-- CAUTION -->
<xsl:template match="CAUTION">
	<xsl:call-template name="CautionAndWarning" />
</xsl:template>

<!-- WARNING -->
<xsl:template match="WARNING">
	<xsl:call-template name="CautionAndWarning" />
</xsl:template>

<!-- CAUTION,WARNING用テンプレート -->
<xsl:template name="CautionAndWarning">
	<table width="95%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td width="22" align="center" valign="top">　</td>
			<xsl:choose>
				<xsl:when test="self::CAUTION">
					<td class="text_red">■注　意■</td>
				</xsl:when>
				<xsl:when test="self::WARNING">
					<td class="text_red">■警　告■</td>
				</xsl:when>
			</xsl:choose>
		</tr>
		<tr>
			<td width="22" align="center" valign="top">　</td>
			<td class="text_red"><xsl:apply-templates/></td>
		</tr>
	</table>
	<br/>
</xsl:template>

<!-- SECRET -->
<xsl:template match="SECRET">
	<div style="border:#E7DEE5 solid 1px;background-color:#F9F3F3">
		<xsl:apply-templates />
	</div>
	<br />
</xsl:template>


<!-- PTXT -->
<xsl:template match="PTXT">
	<xsl:choose>
	<xsl:when test="parent::INFOSUB or parent::TOPIC">
		<table width="95%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="color1"><xsl:apply-templates /></td>
			</tr>
		</table>
		<br />
	</xsl:when>
	<xsl:otherwise>
		<xsl:if test="@ID">
			<xsl:element name="a">
				<xsl:attribute name="name"><xsl:value-of select="@ID" /></xsl:attribute>
			</xsl:element>
		</xsl:if>
		<div class="text">
			<xsl:apply-templates />
		</div>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>


<!-- XREF -->
<xsl:template match="XREF">
	<img src="../images/reference_0.gif" width="23" height="15" align="absmiddle" style="margin:0px 5px 0px 0px;cursor:hand" onMouseOver="this.src = '../images/reference_1.gif'" onMouseOut="this.src = '../images/reference_0.gif'" onClick="pocModal('{@REFID}.html')" alt="相互参照"/>
<!--
	<span>
		<xsl:attribute name="style">color:crimson;text-decoration:underline;cursor:hand</xsl:attribute>
		<xsl:attribute name="onMouseOver">this.style.color = 'palevioletred';this.style.textDecoration = 'none'</xsl:attribute>
		<xsl:attribute name="onMouseOut">this.style.color='crimson';this.style.textDecoration = 'underline'</xsl:attribute>
		<xsl:attribute name="onClick">pocModal('<xsl:value-of select="@REFID" />.xml')</xsl:attribute>
		｛相互参照先｝
	</span>
-->
</xsl:template>


<!-- EMPH 強調表示 -->
<xsl:template match="EMPH">
	<xsl:element name="span">
		<xsl:choose>
		<xsl:when test="@ETYPE='BOLD'">
			<xsl:attribute name="style">font-weight:bold</xsl:attribute>
		</xsl:when>
		<xsl:when test="@ETYPE='BOLDITAL'">
			<xsl:attribute name="style">font-weight:bold;font-style:italic</xsl:attribute>
		</xsl:when>
		<xsl:when test="@ETYPE='ITAL'">
			<xsl:attribute name="style">font-style:italic</xsl:attribute>
		</xsl:when>
		<xsl:when test="@ETYPE='ROMAN'">
			<xsl:attribute name="style">font-family:"Times New Roman"</xsl:attribute>
		</xsl:when>
		</xsl:choose>
		<xsl:apply-templates />
	</xsl:element>
</xsl:template>


<!-- TABLE -->
<xsl:template match="TABLE/TGROUP">
	<table width="95%" border="1" cellspacing="0" cellpadding="5" bordercolor="#FFFFFF">
		<xsl:for-each select="THEAD/ROW">
			<tr>
				<xsl:for-each select="ENTRY">
					<td>
						<xsl:attribute name="class">gray3_dark</xsl:attribute>
						<xsl:call-template name="Attribute-table"/>
						<xsl:apply-templates />
					</td>
				</xsl:for-each>
			</tr>
		</xsl:for-each>
		<xsl:for-each select="TBODY/ROW">
			<tr>
				<xsl:for-each select="ENTRY">
					<xsl:choose>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_00'">
						<td>
							<xsl:attribute name="class">color1</xsl:attribute>
							<xsl:call-template name="Attribute-table"/>
							<xsl:apply-templates />
						</td>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_01'">
						<xsl:choose>
						<xsl:when test="@COLNAME='1' or @NAMEST&lt;'1'">
							<td>
								<xsl:attribute name="class">gray3_dark</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_02'">
						<xsl:choose>
						<xsl:when test="@COLNAME&lt;3 or @NAMEST&lt;'3'">
							<td>
								<xsl:attribute name="class">gray3_dark</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_03'">
						<xsl:choose>
						<xsl:when test="@COLNAME&lt;4 or @NAMEST&lt;'4'">
							<td>
								<xsl:attribute name="class">gray3_dark</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_10'">
						<td>
							<xsl:attribute name="class">color1</xsl:attribute>
							<xsl:call-template name="Attribute-table"/>
							<xsl:apply-templates />
						</td>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_11'">
						<xsl:choose>
						<xsl:when test="@COLNAME='1' or @NAMEST&lt;'1'">
							<td>
								<xsl:attribute name="class">gray2</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_12'">
						<xsl:choose>
						<xsl:when test="@COLNAME&lt;'3' or @NAMEST&lt;'3'">
							<td>
								<xsl:attribute name="class">gray2</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_13'">
						<xsl:choose>
						<xsl:when test="@COLNAME&lt;'4' or @NAMEST&lt;'4'">
							<td>
								<xsl:attribute name="class">gray2</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:apply-templates />
							</td>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<td>
							<xsl:attribute name="class">color1</xsl:attribute>
							<xsl:call-template name="Attribute-table"/>
							<xsl:apply-templates />
						</td>
					</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>
			</tr>
		</xsl:for-each>
	</table>
	<br />
</xsl:template>
<!-- テーブル用テンプレート -->
<xsl:template name="Attribute-table">
	<xsl:variable name="COLNAME" select="@COLNAME"/>
	<xsl:if test="@NAMEST">
		<xsl:attribute name="colspan"><xsl:value-of select="@NAMEEND - @NAMEST + 1"/></xsl:attribute>
	</xsl:if>
	<xsl:if test="@MOREROWS">
		<xsl:attribute name="rowspan"><xsl:value-of select="@MOREROWS + 1"/></xsl:attribute>
	</xsl:if>
	<xsl:if test="@VALIGN">
		<xsl:attribute name="valign"><xsl:value-of select="@VALIGN"/></xsl:attribute>
	</xsl:if>
	<xsl:if test="@ALIGN">
		<xsl:attribute name="align"><xsl:value-of select="@ALIGN"/></xsl:attribute>
	</xsl:if>
</xsl:template>


<!-- SUP -->
<xsl:template match="SUP">
	<SUP><xsl:apply-templates /></SUP>
</xsl:template>


<!-- SUB -->
<xsl:template match="SUB">
	<SUB><xsl:apply-templates /></SUB>
</xsl:template>


</xsl:stylesheet>
