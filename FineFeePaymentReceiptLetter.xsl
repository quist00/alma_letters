<?xml version="1.0" encoding="utf-8"?>
<!--
  Modified on 20160707 by Wee Hiong
  1. Add do-not-reply message to the footer.

  Modified on 20151222 by Wee Hiong
  1. Remove sender's address as contact information is now inside the header.
  2. Add link to library account.
  3. Add intro message before Transaction ID.
  4. Make Transaction ID take the common font instead of H4.

  Modified on 20151002 by Wee Hiong
  1. Fix wrong column for total amount.
  2. Add currency to total amount.

  Modified on 20151002 by Wee Hiong
  1. Add the name of the item that caused the fine.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:include href="header.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
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
        <br />
        <!-- mailReason.xsl -->
        <xsl:call-template name="toWhomIsConcerned" />
        <div class="messageArea">
          <div class="messageBody">
            <table cellspacing="0" cellpadding="5" border="0">
              <tr>
                <td>
                  <h>You have made the following payment:</h>
                </td>
              </tr>
              <tr>
                <td>
                  <xsl:if test="notification_data/transaction_id != ''">
                    <b>@@transaction_id@@:
                      <xsl:value-of select="/notification_data/transaction_id" />
                    </b>
                  </xsl:if>
                  <xsl:for-each select="notification_data/labels_list">
                    <table cellspacing="0" cellpadding="5" border="0">
                      <tr>
                        <td>
                          <xsl:value-of select="letter.fineFeePaymentReceiptLetter.message" />
                        </td>
                      </tr>
                    </table>
                    <br />
                  </xsl:for-each>
                  <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                      <!-- style.xsl -->
                      <xsl:call-template name="mainTableStyleCss" />
                    </xsl:attribute>
                    <tr>
                      <th>@@fee_type@@</th>
                      <th>Item</th>
                      <th>@@payment_date@@</th>
                      <th align="right">@@paid_amount@@</th>
                      <th>@@payment_method@@</th>
                      <th>@@note@@</th>
                    </tr>
                    <xsl:for-each select="notification_data/user_fines_fees_list/user_fines_fees">
                      <tr>
                        <td>
                          <xsl:value-of select="fine_fee_type_display" />
                        </td>
                        <td>
                          <xsl:value-of select="item_title" />
                        </td>
                        <td>
                          <xsl:value-of select="create_date" />
                        </td>
                        <td align="right">
                          <xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_ammount/currency" />
                          <xsl:text> </xsl:text>
                          <xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_amount_display" />
                        </td>
                        <td>
                          <xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_method" />
                        </td>
                        <td>
                          <xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_note" />
                        </td>
                      </tr>
                    </xsl:for-each>
                    <tr>
                      <td />
                      <td />
                      <td align="right">
                        <b>@@total@@:</b>
                      </td>
                      <td align="right">
                        <xsl:value-of select="notification_data/currency" />
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="notification_data/total_amount_paid" />
                      </td>
                      <td />
                      <td />
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
            <br />
            <!-- footer.xsl -->
            <xsl:call-template name="myAccount" />
            <xsl:call-template name="doNotReply" />
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
