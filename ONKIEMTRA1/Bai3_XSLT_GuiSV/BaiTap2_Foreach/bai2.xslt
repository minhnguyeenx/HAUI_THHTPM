<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="DS">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="bt2.css"></link>
			</head>
			<body>
				<h1 align="center">BẢNG LƯƠNG THÁNG</h1>
				<xsl:for-each select="congty">
					<div class="check">
						<h3>
							Tên công ty: <xsl:value-of select="@TenCT"/>
						</h3>
						<xsl:for-each select="donvi">
							<h3>
								Tên phòng: <xsl:value-of select="tendv"/>
							</h3>
							<table border="1" cellspacing="0">
								<tr>
									<th>STT</th>
									<th>Họ tên</th>
									<th>Ngày sinh</th>
									<th>Ngày công</th>
									<th>Lương</th>
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
										<xsl:choose>
											<xsl:when test="ngaycong > 25">
												<td>
													<xsl:value-of select="20*150000 + 5*200000 + (ngaycong - 25)*250000"/>
												</td>
											</xsl:when>
											<xsl:when test="ngaycong > 20">
												<td>
													<xsl:value-of select="20*150000 + (ngaycong - 20)*200000"/>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td>
													<xsl:value-of select="ngaycong*150000"/>
												</td>
											</xsl:otherwise>
										</xsl:choose>
									</tr>
								</xsl:for-each>
							</table>
						</xsl:for-each>
					</div>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
