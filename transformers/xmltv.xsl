<?xml version="1.0" ?>
<!--source: https://sourceforge.net/p/xmltv/feature-requests/37/  -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" />
    <!-- 
    channel name does not shows in created xml. think it is the use thing since 
    channel does not have any attribute named id but it can be that it is created here..
    trired... can't brain... need sleep -->
    <!-- <xsl:key name="channel" match="/tv/programme" use="@id" /> -->

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
            <!-- <xsl:apply-templates select="channel">
                <xsl:sort select="substring-before(display-name[1],'')" data-type="number" />
            </xsl:apply-templates> -->
            <xsl:apply-templates select="programme">
                <xsl:sort select="@start" />
                <!-- <xsl:sort select="substring-before(key('channel',@channel)/display-name[1],' ')" data-type="number" /> -->
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

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
            <xsl:attribute name="channel">
                <xsl:value-of select="@channel" />
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