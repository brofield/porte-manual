<?xml version="1.0" encoding="UTF-8"?>
<!-- 2004.10.09　HINREF が表示されないところがあったのを修正 -->
<!-- 2003.09.24　全体的に整理 -->
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
		<body onload="boVis(5);printAndClose();setTab(0);changeImg(document.location.href.split('/')[document.location.href.split('/').length - 1].split('.')[0]);">
			<table width="100%" cellspacing="0" cellpadding="2" style="display:none" id="print">
				<tr>
					<td align="left"><input type="submit" name="submit" value="印刷" onClick="printCheck()"/></td>
					<td align="center">　</td>
					<td align="right"><input type="submit" name="submit2" value="閉じる" onClick="closeWindow()"/></td>
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


<!-- メモ用テンプレート	2003.09.19.追加 -->
<xsl:template name="memo">
</xsl:template>
<!-- TITLE 2003.09.19.修正-->
<xsl:template match="TITLE">
	<xsl:choose>
	<xsl:when test="parent::PARA">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
			<xsl:choose>
			<xsl:when test="parent::PARA/@INFOTYPE='SYSTEM'">
				<td width="5%" class="blue">　</td>
				<td width="80%" class="blue" align="center"><xsl:apply-templates /></td>
				<td align="right" class="blue" width="15%"> </td>
			</xsl:when>
			<xsl:when test="parent::PARA/@INFOTYPE='PARTS'">
				<td width="5%" class="gray">　</td>
				<td width="80%" class="gray" align="center"><xsl:apply-templates /></td>
				<td align="right" class="gray" width="15%"> </td>
			</xsl:when>
			<xsl:otherwise>
				<td align="center" class="gray"><xsl:apply-templates /></td>
			</xsl:otherwise>
				</xsl:choose>
			</tr>
		</table>
	</xsl:when>
	<xsl:when test="parent::MECA or parent::INDICATE or parent::BIND or parent::SPEC">
		<!-- MECA,INDICATE,BINDのTITLEは、下で定義 -->
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
				<xsl:when test="ancestor::TABLE">
					<xsl:apply-templates />
				</xsl:when>
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
						</xsl:element><a name="{translate(@ID,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')}"><xsl:value-of select="descendant::TITLE"/></a>
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
		<xsl:attribute name="src">../xml/grph_ent/<xsl:value-of select="translate(@GRAPHICNAME,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>.png</xsl:attribute>
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
								<xsl:attribute name="value">../swf/<xsl:value-of select="translate(@GRAPHICNAME,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>.swf</xsl:attribute>
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
	<xsl:variable name="ID" select="translate(@REFID,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
	<xsl:variable name="JUDGE" select="substring($ID,5,1)" />
	<xsl:choose>
		<xsl:when test="($JUDGE='s')or($JUDGE='t')">
			<img src="../images/reference_0.gif" width="23" height="15" align="absmiddle" style="margin:0px 5px 0px 0px;cursor:hand" onMouseOver="this.src = '../images/reference_1.gif'" onMouseOut="this.src = '../images/reference_0.gif'" onClick="pocModal('{$ID}.html#{substring($ID,5)}')" alt="相互参照" />
		</xsl:when>
		<xsl:otherwise>
			<img src="../images/reference_0.gif" width="23" height="15" align="absmiddle" style="margin:0px 5px 0px 0px;cursor:hand" onMouseOver="this.src = '../images/reference_1.gif'" onMouseOut="this.src = '../images/reference_0.gif'" onClick="pocModal('s{substring($ID,2,13)}.html#t{substring($ID,5)}')" alt="相互参照" />
		</xsl:otherwise>
	</xsl:choose>
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
						<xsl:call-template name="blank-cell"/>
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
							<xsl:call-template name="blank-cell"/>
						</td>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_01'">
						<xsl:choose>
						<xsl:when test="@COLNAME='1' or @NAMEST&lt;'1'">
							<td>
								<xsl:attribute name="class">gray3_dark</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:call-template name="blank-cell"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:call-template name="blank-cell"/>
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
								<xsl:call-template name="blank-cell"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:call-template name="blank-cell"/>
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
								<xsl:call-template name="blank-cell"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:call-template name="blank-cell"/>
							</td>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_10'">
						<td>
							<xsl:attribute name="class">color1</xsl:attribute>
							<xsl:call-template name="Attribute-table"/>
							<xsl:call-template name="blank-cell"/>
						</td>
					</xsl:when>
					<xsl:when test="ancestor::TGROUP/@TGROUPSTYLE='Table_11'">
						<xsl:choose>
						<xsl:when test="@COLNAME='1' or @NAMEST&lt;'1'">
							<td>
								<xsl:attribute name="class">gray2</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:call-template name="blank-cell"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:call-template name="blank-cell"/>
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
								<xsl:call-template name="blank-cell"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:call-template name="blank-cell"/>
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
								<xsl:call-template name="blank-cell"/>
							</td>
						</xsl:when>
						<xsl:otherwise>
							<td>
								<xsl:attribute name="class">color1</xsl:attribute>
								<xsl:call-template name="Attribute-table"/>
								<xsl:call-template name="blank-cell"/>
							</td>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<td>
							<xsl:attribute name="class">color1</xsl:attribute>
							<xsl:call-template name="Attribute-table"/>
							<xsl:call-template name="blank-cell"/>
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
<xsl:template name="blank-cell">
	<xsl:if test=".!=''"><xsl:apply-templates /></xsl:if>
	<xsl:if test=".=''">&#160;</xsl:if>
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
