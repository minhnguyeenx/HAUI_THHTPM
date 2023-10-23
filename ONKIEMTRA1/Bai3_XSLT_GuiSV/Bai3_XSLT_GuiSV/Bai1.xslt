<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="congty">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="Stylesheet1.css"></link>
			</head>
			<body>
				<h1 align="center">BẢNG LƯƠNG THÁNG 11-2009</h1>
				<xsl:for-each select="donvi">
					<h2>Mã đơn vị: <xsl:value-of select="@madv"/></h2>
					<h2>Tên đơn vị: <xsl:value-of select="tendv"/></h2>
					<h2>Điện thoại: <xsl:value-of select="dienthoai"/></h2>
					<h2 align="center">DANH SÁCH NHÂN VIÊN</h2>

					<table border="1" width="100%" cellspacing="0">
						<tr>
							<th>Số TT</th>
							<th>Mã NV</th>
							<th>Họ tên</th>
							<th>Ngày sinh</th>
							<th>Hệ số lương</th>
							<th>Lương</th>
						</tr>
						<tr>
							<xsl:for-each select="nhanvien[hsluong >= 3]">
								<tr>
									<td>
										<xsl:value-of select="position()"/>
									</td>
									<td>
										<xsl:value-of select="manv"/>
									</td>
									<td>
										<xsl:value-of select="hoten"/>
									</td>
									<td>
										<xsl:value-of select="ngaysinh"/>
									</td>
									<td>
										<xsl:value-of select="hsluong"/>
									</td>
									<td>
										<xsl:value-of select="hsluong*730000"/>
									</td>
								</tr>
							</xsl:for-each>
						</tr>
					</table>
					<h1 align="right">THỦ TRƯỞNG ĐƠN VỊ</h1>

				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
