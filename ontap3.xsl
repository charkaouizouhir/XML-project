<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Présentation ONTAP</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        color: #333;
                        margin: 0;
                        padding: 0;
                    }
                    .container {
                        max-width: 900px;
                        margin: auto;
                        padding: 20px;
                    }
                    .slide {
                        background: #fff;
                        padding: 20px;
                        border-radius: 8px;
                        margin-bottom: 20px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }
                    h1, h2 {
                        color: #004080;
                        text-align: center;
                    }
                    .subtitle {
                        color: #666;
                        font-style: italic;
                    }
                    img {
                        max-width: 100%;
                        border-radius: 8px;
                        margin-top: 20px;
                    }
                    .advantages {
                        list-style-type: disc;
                        padding-left: 20px;
                    }
                    .conclusion {
                        text-align: center;
                        background: #004080;
                        color: #fff;
                        padding: 20px;
                        border-radius: 8px;
                    }
                    /* Positionner le bouton en haut à droite */
                    .download-button-container {
                        position: fixed;
                        top: 20px;
                        right: 20px;
                        z-index: 1000;
                    }
                    .download-button {
                        background-color: #004080;
                        color: white;
                        border: none;
                        padding: 10px 20px;
                        font-size: 16px;
                        cursor: pointer;
                        border-radius: 5px;
                    }
                    .download-button:hover {
                        background-color: #006bb3;
                    }
                </style>
                <!-- Inclure jsPDF -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
            </head>
            <body>
                <!-- Conteneur du bouton de téléchargement -->
                <div class="download-button-container">
                    <button class="download-button" onclick="downloadPDF()">Télécharger en PDF</button>
                </div>

                <!-- Contenu principal -->
                <div class="container">
                    <h1>Présentation ONTAP</h1>
                    <xsl:for-each select="ONTAP/Presentation/Slide">
                        <div class="slide">
                            <h2><xsl:value-of select="Title"/></h2>
                            <img src="{Image/@src}" alt="{Image/@alt}"/>
                            <p><xsl:value-of select="Text"/></p>
                            <xsl:if test="Advantage">
                                <h3>Avantages :</h3>
                                <ul class="advantages">
                                    <xsl:for-each select="Advantage">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ul>
                            </xsl:if>
                        </div>
                    </xsl:for-each>
                </div>

                <!-- Script pour télécharger le PDF -->
                <script>
                    function downloadPDF() {
                        const { jsPDF } = window.jspdf;
                        const doc = new jsPDF();

                        // Capture du contenu HTML de la page et création du PDF
                        doc.html(document.body, {
                            callback: function (doc) {
                                doc.save('presentation_ontap.pdf');
                            },
                            margin: [10, 10, 10, 10],
                            x: 10,
                            y: 10
                        });
                    }
                </script>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
