<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="congty">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="bt1.css"></link>
			</head>
			<body>
				<h1 align="center">BẢNG LƯƠNG THÁNG 11-2020</h1>
				<xsl:apply-templates select="donvi"></xsl:apply-templates>
				<h2 align="right">THỦ TRƯỞNG ĐƠN VỊ</h2>
				<br></br>
				<center>-----------------------------------------</center>
			</body>
		</html>
    </xsl:template>
	<xsl:template match="donvi">
		<h3>
			Mã đơn vị: <xsl:value-of select="@madv"/>
		</h3>
		<h3>
			Tên đơn vị: <xsl:value-of select="tendv"/>
		</h3>
		<h3>
			Điện thoại: <xsl:value-of select="dienthoai"/>
		</h3>
		<h2 align="center">DANH SÁCH NHÂN VIÊN</h2>
		<table border="1" cellspacing="0">
			<tr class="tieude">
				<td>SỐ TT</td>
				<td>MÃ NV</td>
				<td>HỌ TÊN</td>
				<td>NGÀY SINH</td>
				<td>HS LƯƠNG</td>
				<td>LƯƠNG	</td>
			</tr>
			<xsl:apply-templates select="nhanvien"></xsl:apply-templates>
		</table>
	</xsl:template>
	<xsl:template match="nhanvien">
		<xsl:if test="hsluong >=3">
			<tr>
				<td class="so">
					<xsl:value-of select="position()"/>
				</td>
				<td class="chu">
					<xsl:value-of select="manv"/>
				</td>
				<td class="chu">
					<xsl:value-of select="hoten"/>
				</td>
				<td class="chu">
					<xsl:value-of select="ngaysinh"/>
				</td>
				<td class="so">
					<xsl:value-of select="hsluong"/>
				</td>
				<td class="so">
					<xsl:value-of select="hsluong * 720000"/>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
