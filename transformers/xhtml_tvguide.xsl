<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

    <!-- XSLT for creating THML -->
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <link rel="stylesheet" type="text/css" href="../css/xhtml_tvguide.css" />
            </head>
            <body>
                <section id="tvguide">
                    <!-- loops throught all tv nodes the generated xml document -->
                    <xsl:for-each select="document('../xml/tvguide.xml')/tvguide/tv">
                        <!-- encapsulate programinfo and logo -->
                        <div id="total-channel-info">

                            <!-- div to control sizes of the logos. the if:s inside is for controlling whitch logo to show -->
                            <div id="id-logo">

                                <xsl:if test="programme/@channel = 'disneychannel.com'">
                                    <img class="logo" height="100" src="../vectors/disneychannel.svg" />
                                </xsl:if>
                                <xsl:if test="programme/@channel = 'fakta.tv4.se'">
                                    <img class="logo" height="100" src="../vectors/tv4_fakta.svg" />
                                </xsl:if>
                                <xsl:if test="programme/@channel = 'action.film.viasat.se'">
                                    <img class="logo" height="100" src="../vectors/visataction.svg" alt="Viasat action" />
                                </xsl:if>

                            </div>

                            <table>
                                <tr>
                                    <th>
                                        <xsl:value-of select="programme/@channel" />
                                    </th>
                                </tr>
                                <!-- loops through all programs in node tv. -->
                                <xsl:for-each select="programme">
                                    <tr>
                                        <td>
                                            <span id="programme-time">
                                                <!-- manipulate string for visualisation of time of program -->
                                                <xsl:value-of select="substring(@start, 9, 2)" />:
                                                <xsl:value-of select="substring(@start, 11, 2)" />
                                            </span>
                                            <span id="programme-title">
                                                <xsl:value-of select="title" />

                                            </span>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </div>

                    </xsl:for-each>
                </section>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>