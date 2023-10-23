<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="congty">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="B1_Foreach.css"></link>
			</head>
			<body>
				<h1 align="center">BẢNG LƯƠNG THÁNG 11-2020</h1>
				<xsl:for-each select="donvi">
					<h2>
						Mã đơn vị: <xsl:value-of select="@madv"/>
					</h2>
					<h2>
						Tên đơn vị: <xsl:value-of select="tendv"/>
					</h2>
					<h2>
						Điện thoại: <xsl:value-of select="dienthoai"/>
					</h2>
					<h2 align="center">DANH SÁCH NHÂN VIÊN</h2>
					<table border="1" cellspacing="0">
						<tr class="tieude">
							<th>SỐ TT</th>
							<th>MÃ NV</th>
							<th>HỌ TÊN</th>
							<th>NGÀY SINH</th>
							<th>HS LƯƠNG</th>
							<th>LƯƠNG</th>
						</tr>
						<xsl:for-each select="nhanvien[hsluong >= 3]">
							<tr>
								<td class="chu">
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
									<xsl:value-of select="hsluong * 730000"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<h1 align="right">THỦ TRƯỞNG ĐƠN VỊ</h1>
					<br></br>
					<center>-------------------------------------------------------------</center>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
