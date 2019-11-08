<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <link rel="stylesheet" type="text/css" href="../css/xhtml_tvguide.css" />
            </head>

            <xsl:variable name="logodisney" select="../vectors/disneychannel.svg"></xsl:variable>
            <xsl:variable name="logotv4_fakta" select="../vectors/tv4_fakta.svg"></xsl:variable>
            <xsl:variable name="logovisataction" select="../vectors/viasataction.svg"></xsl:variable>

            <body>
                <div id="program">
                    <!-- <xsl:value-of select="document(../vectors/disneychannel.svg)" /> -->
                    <img height="100" src="../vectors/disneychannel.svg"></img>
                    <img height="100" src="../vectors/tv4_fakta.svg"></img>
                    <img height="100" src="../vectors/visataction.svg" alt="Viasat action"></img>

                    <table>
                        <xsl:for-each select="document('../xml/tvguide.xml')/tvguide/tv">
                            <tr>
                                <th>
                                    <xsl:value-of select="programme/@channel" />
                                </th>
                            </tr>
                            <xsl:for-each select="document('../xml/tvguide.xml')/tvguide/tv/programme">
                                <tr>
                                    <td>
                                        <xsl:value-of select="title" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="substring(@start, 9, 2)" />
                                        .
                                        <xsl:value-of select="substring(@start, 11, 2)" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>