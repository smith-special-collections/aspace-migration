<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="urn:isbn:1-931666-22-9" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:ead="urn:isbn:1-931666-22-9"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ns2="http://www.w3.org/1999/xlink"
    version="2.0" xpath-default-namespace="urn:isbn:1-931666-22-9">

    <!-- standard identity template, which does all of the copying -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- change c0x to c so that this is all easier -->
    <xsl:template match="c01 | c02 | c03 | c04 | c05 | c06 | c07 | c08 | c09 | c10 | c11 | c12">
        <xsl:element name="c">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- that titleproper/subtitle isn't quite right. Let's fix it. -->
    <xsl:template match="titlestmt">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <titleproper>
                <xsl:value-of select="(subtitle, titleproper)" separator=" for the "/>
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

    <!-- Change <note> to <odd> - or else ASpace will strip it -->
    <xsl:template match="note">
        <xsl:element name="odd">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>

    <!-- odd has to be outside the did -->
    <xsl:template match="did">
        <xsl:copy>
            <xsl:apply-templates select="@* | node() except note"/>
        </xsl:copy>
        <!-- if you've got notes in the did element, promote them to be
            a sibling of did.-->
        <xsl:if test="note">
            <!-- and the previous template listed here will change
            the note element into an odd element (though the ordering of templates 
            doesn't matter) -->
            <xsl:apply-templates select="note"/>
        </xsl:if>
    </xsl:template>

    <!-- let's remove targets that don't point to anything -->
    <xsl:template match="ref/@target | ref/@xlink"/>
    
    <!-- make containers 1.5-ready -->
    <!--adds an @id attribute to the first container element that doesn't already have an @id or @parent attribute-->
    <xsl:template match="container[not(@id|@parent)][@type='box']">
        <xsl:copy>
            <xsl:attribute name="id">
                <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!--adds a @parent attribute to the following container elements that don't already have an @Id or @parent attribute-->
    <xsl:template match="container[not(@id|@parent)][@type='folder']">
        <xsl:copy>
            <xsl:attribute name="parent">
                <xsl:value-of select="generate-id(../container[not(@id|@parent)][@type='box'])"/>
            </xsl:attribute>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
