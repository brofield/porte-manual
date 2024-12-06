<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="4.0" encoding="UTF-8"/>

	<xsl:attribute-set name="pulist">
		<xsl:attribute name="href">javascript:;</xsl:attribute>
		<xsl:attribute name="onMouseDown">show_popup('<xsl:value-of select="@id"/>')</xsl:attribute>
		<xsl:attribute name="class">menu</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="body_z">
		<xsl:attribute name="bgcolor">#FFFFFF</xsl:attribute>
		<xsl:attribute name="leftmargin">5</xsl:attribute>
		<xsl:attribute name="topmargin">10</xsl:attribute>
		<xsl:attribute name="marginwidth">2</xsl:attribute>
		<xsl:attribute name="marginheight">2</xsl:attribute>
		<xsl:attribute name="onLoad"><xsl:apply-templates select="pu_menu/sct/sc"/></xsl:attribute>
	</xsl:attribute-set>

	<xsl:template match="/">
		<html>
		<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
		<link rel="stylesheet" href="../css/style.css" type="text/css"></link>
		<script language="JavaScript" src="../js/popmenu.js"></script>
		<link rel="stylesheet" href="../css/left.css"></link>
		</head>
		<body xsl:use-attribute-sets="body_z">
			<xsl:apply-templates select="pu_menu"/>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="pu_menu">
		<table width="195" border="0" cellspacing="0" cellpadding="5">
			<tr> 
				<td class="text00"><xsl:value-of select="name"/></td>
			</tr>
		</table>
		<table width="195" border="0" cellspacing="0" cellpadding="5">
				<xsl:apply-templates select="sct"/>
		</table>
	</xsl:template>

	<xsl:template match="sct">
		<xsl:for-each select=".">
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="10" class="buttonbase"><img src="../images/b_icon0.gif" width="10" height="20"></img></td>
							<td width="185">
								<a xsl:use-attribute-sets="pulist">
									<xsl:value-of select="name"/>
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="sc">
	mkarray('<xsl:value-of select="../@id"/>','<xsl:value-of select="@id"/>','<xsl:value-of select="name"/>','<xsl:value-of select="@url"/>');
	</xsl:template>

		
</xsl:stylesheet>

