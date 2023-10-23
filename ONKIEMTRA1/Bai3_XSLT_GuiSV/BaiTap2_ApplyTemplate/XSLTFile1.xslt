<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="DS">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="Stylesheet1.css"></link>
			</head>
			<body>
				<h1 align="center">BẢNG LƯƠNG THÁNG</h1>
				<xsl:apply-templates select="congty"></xsl:apply-templates>
			</body>
		</html>
    </xsl:template>
	<xsl:template match="congty">
		<div class="check">
			<h3>
				Tên công ty: <xsl:value-of select="@TenCT"/>
			</h3>
			<xsl:apply-templates select="donvi"></xsl:apply-templates>
		</div>
	</xsl:template>
	<xsl:template match="donvi">
		<h3>
			Tên đơn vị: <xsl:value-of select="tendv"/>
		</h3>
		<table border="1" cellspacing="0">
			<tr>
				<th>STT</th>
				<th>Họ tên</th>
				<th>Ngày sinh</th>
				<th>Ngày công</th>
				<th>Lương</th>
			</tr>
			<xsl:apply-templates select="nhanvien"></xsl:apply-templates>
		</table>
	</xsl:template>
	<xsl:template match="nhanvien">
		<tr>
			<td>
				<xsl:value-of select="position()"/>
			</td>
			<td>
				<xsl:value-of select="hoten"/>
			</td>
			<td>
				<xsl:value-of select="ngaysinh"/>
			</td>
			<td>
				<xsl:value-of select="ngaycong"/>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="ngaycong &lt;= 20">
						<xsl:value-of select="ngaycong*150000"/>
					</xsl:when>
					<xsl:when test="ngaycong &lt;= 25">
						<xsl:value-of select="20*150000 + (ngaycong - 20)*200000"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="20*150000 + 5*200000 + (ngaycong - 25)*250000"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
