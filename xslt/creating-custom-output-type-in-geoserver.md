Creating a custom output type in GeoServer using XSLT
-----------------------------------------------------

 1. To create a custom output type in GeoServer using XSLT, you need to define two files:

     a. A custom output type declaration file

     b. A custom output transformation file

 2. Each pair of custom output files should specify the transformation of one and only one feature class 


 3. A custom output type declaration file should be named <formatName><featureClass>.xml (e.g., kayml-geodetic-control.xml)
    where <formatName> is "kayml-"
      and <featureClass> is a meaningful contraction of the featureClass name in the BC Geographical Wherehouse
    
 4. A custom output transformation file should be named <formatName><featureClass>.xslt (e.g., kayml-geodetic-control.xslt)
 
 5. Here is an example request for a custom output type called kayml-geodetic-control:
 
    http://delivery.openmaps.gov.bc.ca/geo/pub/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=pub:WHSE_REFERENCE.MASCOT_GEODETIC_CONTROL&maxFeatures=50&outputFormat=kayml-geodetic-control&srsname=EPSG:4326
 
 6. Given a feature class called WHSE_REFERENCE.MASCOT_GEODETIC_CONTROL, the custom output type declaration file is named kayml-geodetic-control.xml and has the following contents:

 ```html
 <transform>
     <sourceFormat>text/xml; subtype=gml/2.1.2</sourceFormat>
     <outputFormat>kayml-geodetic-control</outputFormat>
     <outputMimeType>application/vnd.google-earth.kml+xml</outputMimeType>
     <fileExtension>kml</fileExtension>
     <xslt>kayml-geodetic-control.xslt</xslt>
     <featureType>
       <id>pub:WHSE_REFERENCE.MASCOT_GEODETIC_CONTROL</id>
     </featureType>
   </transform>     
 ```   
  
 6. Here is the custom output type transformation file named kayml-geodetic-control.xslt:
 
 ```
 <?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:pub="http://openmaps.gov.bc.ca/geo/"
xmlns:gml="http://www.opengis.net/gml" xmlns:atom="http://www.w3.org/2005/Atom"
xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2"
xmlns:wfs="http://www.opengis.net/wfs" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="utf-8" method="xml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" />
  <xsl:template match="/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2"
    xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
      <Document>
        <Style id="gcm1">
          <IconStyle>
            <color>ff00aaff</color>
            <scale>1.6</scale>
            <Icon>
              <href>http://maps.google.com/mapfiles/kml/shapes/placemark_circle.png</href>
            </Icon>
            <hotSpot x="0.5" y="0.5" xunits="fraction" yunits="fraction" />
          </IconStyle>
          <BalloonStyle>
            <text>
              <![CDATA[  
                                        <tbody>
                                                <table cellspacing="0" cellpadding="2" border="0" width="270">
                                                <tr> <td align="left"><b><font size="5" font color="blue"><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/final_long.html?Q_GCM_NO=$[GCM_NUMBER]" TARGET="_blank">GCM&nbsp;Number:&nbsp;$[GCM_NUMBER]</b></td>   <td></td> </tr>
                                                <tr> <td align="left">&nbsp;</td>   <td>&nbsp;</td> </tr>
                                                <tr> <td align="left">Latitude:</td>   <td>$[LATITUDE_DEGREES]&deg $[LATITUDE_MINUTES]' $[LATITUDE_SECONDS]"</td> </tr>
                                                <tr> <td align="left">Longitude:</td>   <td>$[LONGITUDE_DEGREES]&deg $[LONGITUDE_MINUTES]' $[LONGITUDE_SECONDS]" </td> </tr>
                                                <tr> <td align="left">Tablet&nbsp;Marking:</td>   <td>$[TABLET_MARKING] </td> </tr>
                                                <tr> <td align="left">Municipality&nbsp;Name:</td>   <td>$[MUNICIPALITY_NAME] </td> </tr>
                                                </table>
                                        </tbody>
                                        <P><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/tloc.html?Q_GCM_NO=$[GCM_NUMBER]&amp;TYPE=F" TARGET="_blank">Narrative Description and Sketch if available</A></P>
                                        
                                ]]>
</text>
          </BalloonStyle>
          <LabelStyle>
            <scale>0</scale>
          </LabelStyle>
        </Style>
        <Style id="gcm2">
          <IconStyle>
            <scale>1.0</scale>
            <Icon>
              <href>http://maps.google.com/mapfiles/kml/shapes/placemark_square.png</href>
            </Icon>
            <hotSpot x="0.5" y="0.5" xunits="fraction" yunits="fraction" />
          </IconStyle>
          <BalloonStyle>
            <text>
              <![CDATA[  
                                        <tbody>
                                                <table cellspacing="0" cellpadding="2" border="0" width="270">
                                                <tr> <td align="left"><b><font size="5" font color="blue"><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/final_long.html?Q_GCM_NO=$[GCM_NUMBER]" TARGET="_blank">GCM&nbsp;Number:&nbsp;$[GCM_NUMBER]</b></td>   <td></td> </tr>
                                                <tr> <td align="left">&nbsp;</td>   <td>&nbsp;</td> </tr>
                                                <tr> <td align="left">Latitude:</td>   <td>$[LATITUDE_DEGREES]&deg $[LATITUDE_MINUTES]' $[LATITUDE_SECONDS]"</td> </tr>
                                                <tr> <td align="left">Longitude:</td>   <td>$[LONGITUDE_DEGREES]&deg $[LONGITUDE_MINUTES]' $[LONGITUDE_SECONDS]" </td> </tr>
                                                <tr> <td align="left">Tablet&nbsp;Marking:</td>   <td>$[TABLET_MARKING] </td> </tr>
                                                <tr> <td align="left">Municipality&nbsp;Name:</td>   <td>$[MUNICIPALITY_NAME] </td> </tr>
                                                </table>
                                        </tbody>
                                        <P><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/tloc.html?Q_GCM_NO=$[GCM_NUMBER]&amp;TYPE=F" TARGET="_blank">Narrative Description and Sketch if available</A></P>
                                        
                                ]]>
</text>
          </BalloonStyle>
          <LabelStyle>
            <scale>0</scale>
          </LabelStyle>
          <ListStyle></ListStyle>
        </Style>
        <Style id="gcm3">
          <IconStyle>
            <color>ff0000ff</color>
            <scale>1.0</scale>
            <Icon>
              <href>http://maps.google.com/mapfiles/kml/shapes/placemark_square.png</href>
            </Icon>
            <hotSpot x="0.5" y="0.5" xunits="fraction" yunits="fraction" />
          </IconStyle>
          <BalloonStyle>
            <text>
              <![CDATA[  
                                        <tbody>
                                                <table cellspacing="0" cellpadding="2" border="0" width="270">
                                                <tr> <td align="left"><b><font size="5" font color="blue"><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/final_long.html?Q_GCM_NO=$[GCM_NUMBER]" TARGET="_blank">GCM&nbsp;Number:&nbsp;$[GCM_NUMBER]</b></td>   <td></td> </tr>
                                                <tr> <td align="left">&nbsp;</td>   <td>&nbsp;</td> </tr>
                                                <tr> <td align="left">Latitude:</td>   <td>$[LATITUDE_DEGREES]&deg $[LATITUDE_MINUTES]' $[LATITUDE_SECONDS]"</td> </tr>
                                                <tr> <td align="left">Longitude:</td>   <td>$[LONGITUDE_DEGREES]&deg $[LONGITUDE_MINUTES]' $[LONGITUDE_SECONDS]" </td> </tr>
                                                <tr> <td align="left">Tablet&nbsp;Marking:</td>   <td>$[TABLET_MARKING] </td> </tr>
                                                <tr> <td align="left">Municipality&nbsp;Name:</td>   <td>$[MUNICIPALITY_NAME] </td> </tr>
                                                </table>
                                        </tbody>
                                        <P><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/tloc.html?Q_GCM_NO=$[GCM_NUMBER]&amp;TYPE=F" TARGET="_blank">Narrative Description and Sketch if available</A></P>
                                        
                                ]]>
</text>
          </BalloonStyle>
          <LabelStyle>
            <scale>0</scale>
          </LabelStyle>
          <ListStyle></ListStyle>
        </Style>
        <Style id="gcm4">
          <IconStyle>
            <color>ff0000ff</color>
            <scale>1.0</scale>
            <Icon>
              <href>http://maps.google.com/mapfiles/kml/shapes/triangle.png</href>
            </Icon>
            <hotSpot x="0.5" y="0.5" xunits="fraction" yunits="fraction" />
          </IconStyle>
          <BalloonStyle>
            <text>
              <![CDATA[  
                                        <tbody>
                                                <table cellspacing="0" cellpadding="2" border="0" width="270">
                                                <tr> <td align="left"><b><font size="5" font color="blue"><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/highSD.html?Q_GCM_NO=$[GCM_NUMBER]" TARGET="_blank">GCM&nbsp;Number:&nbsp;$[GCM_NUMBER]</b></td>   <td></td> </tr>
                                                <tr> <td align="left">&nbsp;</td>   <td>&nbsp;</td> </tr>
                                                <tr> <td align="left">Latitude:</td>   <td>$[LATITUDE_DEGREES]&deg $[LATITUDE_MINUTES]' $[LATITUDE_SECONDS]"</td> </tr>
                                                <tr> <td align="left">Longitude:</td>   <td>$[LONGITUDE_DEGREES]&deg $[LONGITUDE_MINUTES]' $[LONGITUDE_SECONDS]" </td> </tr>
                                                <tr> <td align="left">Tablet&nbsp;Marking:</td>   <td>$[TABLET_MARKING] </td> </tr>
                                                <tr> <td align="left">Municipality&nbsp;Name:</td>   <td>$[MUNICIPALITY_NAME] </td> </tr>
                                                </table>
                                        </tbody>
                                        <P><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/tloc.html?Q_GCM_NO=$[GCM_NUMBER]&amp;TYPE=F" TARGET="_blank">Narrative Description and Sketch if available</A></P>
                                        
                                ]]>
</text>
          </BalloonStyle>
          <LabelStyle>
            <scale>0</scale>
          </LabelStyle>
          <ListStyle></ListStyle>
        </Style>
        <Style id="gcm5">
          <IconStyle>
            <color>ffff0000</color>
            <scale>1.0</scale>
            <Icon>
              <href>http://maps.google.com/mapfiles/kml/shapes/triangle.png</href>
            </Icon>
            <hotSpot x="0.5" y="0.5" xunits="fraction" yunits="fraction" />
          </IconStyle>
          <BalloonStyle>
            <text>
              <![CDATA[  
                                        <tbody>
                                                <table cellspacing="0" cellpadding="2" border="0" width="270">
                                                <tr> <td align="left"><b><font size="5" font color="blue"><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/final_long.html?Q_GCM_NO=$[GCM_NUMBER]" TARGET="_blank">GCM&nbsp;Number:&nbsp;$[GCM_NUMBER]</b></td>   <td></td> </tr>
                                                <tr> <td align="left">&nbsp;</td>   <td>&nbsp;</td> </tr>
                                                <tr> <td align="left">Latitude:</td>   <td>$[LATITUDE_DEGREES]&deg $[LATITUDE_MINUTES]' $[LATITUDE_SECONDS]"</td> </tr>
                                                <tr> <td align="left">Longitude:</td>   <td>$[LONGITUDE_DEGREES]&deg $[LONGITUDE_MINUTES]' $[LONGITUDE_SECONDS]" </td> </tr>
                                                <tr> <td align="left">Tablet&nbsp;Marking:</td>   <td>$[TABLET_MARKING] </td> </tr>
                                                <tr> <td align="left">Municipality&nbsp;Name:</td>   <td>$[MUNICIPALITY_NAME] </td> </tr>
                                                </table>
                                        </tbody>
                                        <P><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/tloc.html?Q_GCM_NO=$[GCM_NUMBER]&amp;TYPE=F" TARGET="_blank">Narrative Description and Sketch if available</A></P>
                                        
                                ]]>
</text>
          </BalloonStyle>
          <LabelStyle>
            <scale>0</scale>
          </LabelStyle>
          <ListStyle></ListStyle>
        </Style>
        <Style id="gcm6">
          <IconStyle>
            <scale>1.0</scale>
            <color>ffff0000</color>
            <Icon>
              <href>http://maps.google.com/mapfiles/kml/shapes/shaded_dot.png</href>
            </Icon>
            <hotSpot x="0.5" y="0.5" xunits="fraction" yunits="fraction" />
          </IconStyle>
          <BalloonStyle>
            <text>
              <![CDATA[  
                                        <tbody>
                                                <table cellspacing="0" cellpadding="2" border="0" width="270">
                                                <tr> <td align="left"><b><font size="5" font color="blue"><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/prelim_long.html?Q_GCM_NO=$[GCM_NUMBER]" TARGET="_blank">GCM&nbsp;Number:&nbsp;$[GCM_NUMBER]</b></td>   <td></td> </tr>
                                                <tr> <td align="left">&nbsp;</td>   <td>&nbsp;</td> </tr>
                                                <tr> <td align="left">Latitude:</td>   <td>$[LATITUDE_DEGREES]&deg $[LATITUDE_MINUTES]' $[LATITUDE_SECONDS]"</td> </tr>
                                                <tr> <td align="left">Longitude:</td>   <td>$[LONGITUDE_DEGREES]&deg $[LONGITUDE_MINUTES]' $[LONGITUDE_SECONDS]" </td> </tr>
                                                <tr> <td align="left">Tablet&nbsp;Marking:</td>   <td>$[TABLET_MARKING] </td> </tr>
                                                <tr> <td align="left">Municipality&nbsp;Name:</td>   <td>$[MUNICIPALITY_NAME] </td> </tr>
                                                </table>
                                        </tbody>
                                        <P><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/tloc.html?Q_GCM_NO=$[GCM_NUMBER]&amp;TYPE=P" TARGET="_blank">Narrative Description and Sketch if available</A></P>
                                        
                                ]]>
</text>
          </BalloonStyle>
          <LabelStyle>
            <scale>0</scale>
          </LabelStyle>
          <ListStyle></ListStyle>
        </Style>
        <Style id="gcm7">
          <IconStyle>
            <color>ff00ff00</color>
            <scale>0.5</scale>
            <Icon>
              <href>http://test.openmaps.gov.bc.ca/kml/icons/x_green.gif</href>
            </Icon>
            <hotSpot x="0.5" y="0.5" xunits="fraction" yunits="fraction" />
          </IconStyle>
          <BalloonStyle>
            <text>
              <![CDATA[  
                                        <tbody>
                                                <table cellspacing="0" cellpadding="2" border="0" width="270">
                                                <tr> <td align="left"><b><font size="5" font color="blue"><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/final_long.html?Q_GCM_NO=$[GCM_NUMBER]" TARGET="_blank">GCM&nbsp;Number:&nbsp;$[GCM_NUMBER]</b></td>   <td></td> </tr>
                                                <tr> <td align="left">&nbsp;</td>   <td>&nbsp;</td> </tr>
                                                <tr> <td align="left">Latitude:</td>   <td>$[LATITUDE_DEGREES]&deg $[LATITUDE_MINUTES]' $[LATITUDE_SECONDS]"</td> </tr>
                                                <tr> <td align="left">Longitude:</td>   <td>$[LONGITUDE_DEGREES]&deg $[LONGITUDE_MINUTES]' $[LONGITUDE_SECONDS]" </td> </tr>
                                                <tr> <td align="left">Tablet&nbsp;Marking:</td>   <td>$[TABLET_MARKING] </td> </tr>
                                                <tr> <td align="left">Municipality&nbsp;Name:</td>   <td>$[MUNICIPALITY_NAME] </td> </tr>
                                                </table>
                                        </tbody>
                                        <P><A HREF="http://a100.gov.bc.ca/pub/mascotw/protected/tloc.html?Q_GCM_NO=$[GCM_NUMBER]&amp;TYPE=F" TARGET="_blank">Narrative Description and Sketch if available</A></P>
                                        
                                ]]>
</text>
          </BalloonStyle>
          <LabelStyle>
            <scale>0</scale>
          </LabelStyle>
          <ListStyle></ListStyle>
        </Style>
        <Folder>
          <name>Geodetic Control Monuments</name>
          <xsl:for-each select="wfs:FeatureCollection/gml:featureMember/pub:WHSE_REFERENCE.MASCOT_GEODETIC_CONTROL">

            <Snippet />
            <Placemark>
              <name><xsl:value-of select="pub:GCM_NUMBER" /></name>
              <Snippet />
              <gx:balloonVisibility>0</gx:balloonVisibility>
              <styleUrl>#gcm<xsl:value-of select="pub:SYMBOLOGY_TYPE" /></styleUrl>
              <ExtendedData>
                <Data name="LATITUDE_DEGREES">
                  <value><xsl:value-of select="pub:LATITUDE_DEGREES" /></value>
                </Data>
                <Data name="LATITUDE_MINUTES">
                  <value><xsl:value-of select="pub:LATITUDE_MINUTES" /></value>
                </Data>
                <Data name="LATITUDE_SECONDS">
                  <value><xsl:value-of select="pub:LATITUDE_SECONDS" /></value>
                </Data>
                <Data name="LONGITUDE_DEGREES">
                  <value><xsl:value-of select="pub:LONGITUDE_DEGREES" /></value>
                </Data>
                <Data name="LONGITUDE_MINUTES">
                  <value><xsl:value-of select="pub:LONGITUDE_MINUTES" /></value>
                </Data>
                <Data name="LONGITUDE_SECONDS">
                  <value><xsl:value-of select="pub:LONGITUDE_SECONDS" /></value>
                </Data>
                <Data name="TABLET_MARKING">
                  <value><xsl:value-of select="pub:TABLET_MARKING" /></value>
                </Data>
                <Data name="MUNICIPALITY_NAME">
                  <value><xsl:value-of select="pub:MUNICIPALITY_NAME" /></value>
                </Data>
                <Data name="GCM_NUMBER">
                  <value><xsl:value-of select="pub:GCM_NUMBER" /></value>
                </Data>
                <Data name="SYMBOLOGY_TYPE">
                  <value><xsl:value-of select="pub:SYMBOLOGY_TYPE" /></value>
                </Data>
              </ExtendedData>
              <Point>
					      <coordinates><xsl:value-of select="pub:GEOMETRY/gml:Point/gml:coordinates" />,0</coordinates>
              </Point>
            </Placemark>
          </xsl:for-each>
        </Folder>
      </Document>
    </kml>
  </xsl:template>
</xsl:stylesheet>
```
 
    



