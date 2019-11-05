<?xml version="1.0" ?>
<!--source: https://sourceforge.net/p/xmltv/feature-requests/37/  -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <xsl:variable name="ch1">
        <xsl:value-of select="tvchannels/channel[1]" />
    </xsl:variable>
    <xsl:variable name="ch2">
        <xsl:value-of select="tvchannels/channel[2]" />
    </xsl:variable>
    <xsl:variable name="ch3">
        <xsl:value-of select="tvchannels/channel[3]" />
    </xsl:variable>
    <xsl:key name="channel" match="/tv/channel" use="@id" />

    <xsl:template match="tv">
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="channel">
                <xsl:sort select="substring-before(display-name[1],'')" data-type="number" />
            </xsl:apply-templates>
            <xsl:apply-templates select="programme">
                <xsl:sort select="@start" />
                <xsl:sort select="substring-before(key('channel',@channel)/display-name[1],' ')" data-type="number" />
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="channel">
        <xsl:copy>
            <xsl:attribute name="id">
                <xsl:value-of select="./display-name[1]" />
            </xsl:attribute>
            <xsl:apply-templates select="@*[not(name() = 'id')]" />
            <xsl:apply-templates select="node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="programme">
        <xsl:copy>
            <xsl:attribute name="channel">
                <xsl:value-of select="key('channel',@channel)/display-name[1]" />
            </xsl:attribute>
            <xsl:apply-templates select="@*[not(name() = 'channel')]" />
            <xsl:apply-templates select="node()" />
        </xsl:copy>
    </xsl:template>

    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="node()" />
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>