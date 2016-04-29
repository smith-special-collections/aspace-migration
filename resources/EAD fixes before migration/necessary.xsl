<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:strip-space elements="*"/>
    
    <!-- standard identity template, which does all of the copying -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- get rid of those bioghist daos -->
    <xsl:template match="bioghist/dao"/>
    
    <!-- that titleproper/subtitle isn't quite right. Let's fix it. -->
    <xsl:template match="titlestmt">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <titleproper>
                <xsl:value-of select="(subtitle,titleproper)" separator=" for the "/>
            </titleproper>
        </xsl:copy>
    </xsl:template>
    
    <!-- finds descgrps, gets them outta there -->
    <xsl:template match="descgrp">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- finds head elements, gets them outta there -->
    <xsl:template match="head"/>
    
    <!-- Extents that begin with non-numeric characters -->
    <!-- Start by stripping parens -->
    <xsl:template match="extent/text()[matches(., '^\(')]">
        <xsl:value-of select="translate(., '()', '')"/>
    </xsl:template>
    <!-- Now add zeroes to the beginning of decimals -->
    <xsl:template match="extent/text()[matches(., '^\.')]">
        <xsl:value-of select="concat('0', .)"/>
    </xsl:template>
</xsl:stylesheet>