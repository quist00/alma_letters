<?xml version="1.0" encoding="utf-8"?>
<!--
    Modified on 20151116 by Wee Hiong
    1. Add message to ask user to renew or return items as soon as possible.

    Modified on 20150910 by Wee Hiong
    1. Remove signature and footer.
    2. Replace description column with call number.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="header.xsl" />
    <xsl:include href="senderReceiver.xsl" />
    <xsl:include href="mailReason.xsl" />
    <xsl:include href="footer.xsl" />
    <xsl:include href="style.xsl" />
    <xsl:include href="recordTitle.xsl" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="generalStyle" />
            </head>
            <body>
                <xsl:attribute name="style">
                    <!-- style.xsl -->
                    <xsl:call-template name="bodyStyleCss" />
                </xsl:attribute>
                <!-- header.xsl -->
                <xsl:call-template name="head" />
                <!-- SenderReceiver.xsl -->
                <xsl:call-template name="senderReceiver" />
                <br />
                <!-- mailReason.xsl -->
                <xsl:call-template name="toWhomIsConcerned" />
                <div class="messageArea">
                    <div class="messageBody">
                        <table cellspacing="0" cellpadding="5" border="0">
                            <tr>
                                <td>
                                    <b>@@message@@</b>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>@@loans@@</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="5" class="listing">
                                        <xsl:attribute name="style">
                                            <!-- style.xsl -->
                                            <xsl:call-template name="mainTableStyleCss" />
                                        </xsl:attribute>
                                        <tr>
                                            <th>@@title@@</th>
                                            <th>@@call_number@@</th>
                                            <th>@@author@@</th>
                                            <th>@@due_date@@</th>
                                            <th>@@library@@</th>
                                        </tr>
                                        <xsl:for-each select="notification_data/item_loans/item_loan">
                                            <tr>
                                                <td>
                                                    <xsl:value-of select="title" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="call_number" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="author" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="due_date" />
                                                </td>
                                                <td>
                                                    <xsl:value-of select="library_name" />
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <b>Please renew these loans by logging into your library account, or return them to the library as soon as possible. Thank you.</b>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />@@additional_info_1@@
                        <br />@@additional_info_2@@
                        <br />
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
