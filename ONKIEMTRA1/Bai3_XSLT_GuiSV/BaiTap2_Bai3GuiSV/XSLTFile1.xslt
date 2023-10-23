<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="DS">
		<html>
			<body>
				<h1 align="center">BẢNG LƯƠNG THÁNG</h1>
				
				<xsl:for-each select="congty">
					<h2>Tên công ty: <xsl:value-of select="@TenCT"/></h2>
					<select>
						<xsl:apply-templates select="donvi"></xsl:apply-templates>
					</select>
					<xsl:for-each select="donvi">
						<h2>Tên phòng: <xsl:value-of select="tendv"/></h2>
						<table border="1" cellspacing="0">
							<tr>
								<td>STT</td>
								<td>Họ tên</td>
								<td>Ngày sinh</td>
								<td>Ngày công</td>
								<td>Lương</td>
							</tr>
							<xsl:for-each select="nhanvien">
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
											<xsl:when test="ngaycong > 25">
												<xsl:value-of select="20*150000+ 5*200000 + (ngaycong - 25)*250000"/>
											</xsl:when>
											<xsl:when test="ngaycong > 20">
												<xsl:value-of select="20 * 150000 + (ngaycong - 20)*200000"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="ngaycong * 150000"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:for-each>
						</table>
					</xsl:for-each>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
	<xsl:template match="donvi">
		<option>
			<xsl:value-of select="tendv"/>
		</option>	
	</xsl:template>
</xsl:stylesheet>
