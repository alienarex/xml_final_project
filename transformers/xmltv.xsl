<?xml version="1.0" ?>
<!--source: https://sourceforge.net/p/xmltv/feature-requests/37/  -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />

    <!-- XSLT for combine all current xml files to one tvguide -->
    <xsl:template match="/">
        <tvguide>
            <xsl:for-each select="collection/doc">
                <xsl:apply-templates select="document(@filename)/tv" />
            </xsl:for-each>
        </tvguide>
    </xsl:template>

    <xsl:template match="tv">
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="programme">
                <xsl:sort select="@start" />
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

    <!-- Creates node tvguide. if there're attributes in it they're copied into the generated xml tvguide -->
    <xsl:template match="tvguide">
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
            <!-- creates attribute channel and passing value for programme into generated xml -->
            <xsl:attribute name="channel">
                <xsl:value-of select="@channel" />
            </xsl:attribute>
            <!-- creates attribute or node for siblings or children if attribute name isn't channel (as that value is extracted above -->
            <xsl:apply-templates select="@*[not(name() = 'channel')]" />
            <xsl:apply-templates select="node()" />
        </xsl:copy>
    </xsl:template>

    <!-- creates node or a its valuenodes atribude and passing  -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*" />
            <xsl:apply-templates select="node()" />
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>