<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="TV">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="de1.css"></link>
			</head>
			<body>
				<h1 align="center">DANH MỤC SÁCH</h1>
				<xsl:apply-templates select="NhaXB"></xsl:apply-templates>
			</body>
		</html>
    </xsl:template>
	<xsl:template match="NhaXB">
		<h3>
			Nhà xuất bản: <xsl:value-of select="@TenNXB"/>
		</h3>
		<table border="1" cellspacing="0">
			<tr>
				<th>STT</th>
				<th>Tên sách</th>
				<th>Số trang</th>
				<th>Giá</th>
			</tr>
			<xsl:apply-templates select ="Sach"></xsl:apply-templates>
		</table>
	</xsl:template>
	<xsl:template match="Sach">
		<tr>
			<td>
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<xsl:value-of select="TenSach"/>
			</td>
			<td>
				<xsl:value-of select="SoTrang"/>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="SoTrang &lt;= 100">
						<xsl:value-of select="SoTrang*4000"/>
					</xsl:when>
					<xsl:when test="SoTrang &lt;= 150">
						<xsl:value-of select="100*4000 + (SoTrang - 100)*3000"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="100*4000 + 50*3000 + (SoTrang - 150)*2000"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
