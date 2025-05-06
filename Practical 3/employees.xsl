<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/employees">
        <html>
            <head>
                <title>Employee List</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f9;
                        margin: 0;
                        padding: 0;
                    }
                    
                    h2 {
                        text-align: center;
                        color: #333;
                        margin-top: 30px;
                        font-size: 32px;
                        text-transform: uppercase;
                    }

                    table {
                        width: 80%;
                        margin: 30px auto;
                        border-collapse: collapse;
                        background-color: white;
                        border-radius: 8px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    th, td {
                        padding: 15px;
                        text-align: center;
                        font-size: 16px;
                    }

                    th {
                        background-color: #4CAF50;
                        color: white;
                        font-weight: bold;
                    }

                    tr:nth-child(even) {
                        background-color: #f2f2f2;
                    }

                    tr:hover {
                        background-color: #ddd;
                    }

                    td {
                        color: #333;
                    }

                    /* Add some styles for responsiveness */
                    @media screen and (max-width: 768px) {
                        table {
                            width: 100%;
                            margin: 10px;
                        }
                    }

                    /* Styling the borders */
                    table, th, td {
                        border: 1px solid #ddd;
                    }

                    /* Add some padding to the page */
                    .content-wrapper {
                        padding: 20px;
                    }
                </style>
            </head>
            <body>
                <div class="content-wrapper">
                    <h2>Employee List</h2>
                    <table>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Salary</th>
                        </tr>
                        <xsl:for-each select="employee">
                            <tr>
                                <td><xsl:value-of select="id"/></td>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="department"/></td>
                                <td><xsl:value-of select="salary"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
