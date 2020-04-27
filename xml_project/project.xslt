<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:key name="service-by-category" match="service" use="@category" />

	<xsl:template match="/">
		<div>
			<h2>Total number of services:<xsl:value-of select="count(//service)"/></h2>
			<xsl:apply-templates select="//service[generate-id(.) = generate-id(key('service-by-category', @category)[1] )]"/>
		</div>
	</xsl:template>

	<xsl:template match="service">
		<h2>Category: <xsl:value-of select="@category"/></h2>
		<h3>Total: <xsl:value-of select="count(//service[@category = current()/@category])"/></h3>
		<ul>
			<p>Prices:</p><xsl:apply-templates select="key('service-by-category', @category)" mode="grouping"/>
		</ul>
	</xsl:template>
</xsl:stylesheet>