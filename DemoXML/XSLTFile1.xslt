<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <Books>
      <xsl:for-each select="Books/Book">
        <xsl:if test="Price &gt; 15000">
          <Book>
            <xsl:attribute name="Id"><xsl:value-of select="@Id"/></xsl:attribute>
            <Name>
              <xsl:value-of select="Name"/>
            </Name>
            <CategoryBook>
              <xsl:value-of select="CategoryBook"/>
            </CategoryBook>
            <Author>
              <xsl:value-of select="Author"/>
            </Author>
            <Publisher>
              <xsl:value-of select="Publisher"/>
            </Publisher>
            <Price>
              <xsl:value-of select="Price"/>
            </Price>
          </Book>
        </xsl:if>
      </xsl:for-each>
    </Books>
  </xsl:template>
</xsl:stylesheet>
