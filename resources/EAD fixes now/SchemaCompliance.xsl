<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:isbn:1-931666-22-9" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:ead="urn:isbn:1-931666-22-9"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ns2="http://www.w3.org/1999/xlink"
    version="2.0" exclude-result-prefixes="#all">

    <!-- standard identity template, which does all of the copying -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- update country code, repository code and maintenance agency code -->
    <xsl:template match="ead:unitid">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="countrycode">US</xsl:attribute>
            <xsl:attribute name="repositorycode">
                <xsl:value-of select="concat('US-', @repositorycode)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="ead:eadid">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="countrycode">US</xsl:attribute>
            <xsl:attribute name="mainagencycode">
                <xsl:value-of select="concat('US-', @mainagencycode)"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <!-- same for scriptcode -->
    <xsl:template match="ead:language[@scriptcode]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="scriptcode">Latn</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <!-- fix dumb mistakes where people didn't fill out the template for @normal AND didn't validate -->
    <xsl:template match="@normal[matches(., 'yyyy-mm-dd')]"/>

</xsl:stylesheet>
