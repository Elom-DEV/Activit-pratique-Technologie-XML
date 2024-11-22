<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé Bancaire</title>
            </head>
            <body>
                <h1>Relevé Bancaire</h1>
                <p><strong>RIB :</strong> <xsl:value-of select="/releve/@RIB"/></p>
                <p><strong>Date du relevé :</strong> <xsl:value-of select="/releve/dateReleve"/></p>
                <p><strong>Solde :</strong> <xsl:value-of select="/releve/solde"/> MAD</p>
                
                <h2>Opérations</h2>
                <table border="1">
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="/releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/> MAD</td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h3>Totaux</h3>
                <p><strong>Total Débit :</strong> 
                    <xsl:value-of select="sum(/releve/operations/operation[@type='DEBIT']/@montant)"/> MAD
                </p>
                <p><strong>Total Crédit :</strong> 
                    <xsl:value-of select="sum(/releve/operations/operation[@type='CREDIT']/@montant)"/> MAD
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
