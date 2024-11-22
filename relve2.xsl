<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Opérations Crédit</title>
            </head>
            <body>
                <h1>Opérations de type CREDIT</h1>
                <p><strong>RIB :</strong> <xsl:value-of select="/releve/@RIB" /></p>
                
                <table border="1">
                    <tr>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="/releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@date" /></td>
                            <td><xsl:value-of select="@montant" /> MAD</td>
                            <td><xsl:value-of select="@description" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
