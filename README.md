[![img](https://img.shields.io/badge/Lifecycle-Stable-97ca00)](https://github.com/bcgov/repomountie/blob/master/doc/lifecycle-badges.md)

# dbc-kml-apps
DataBC KML Applications and Templates

The purpose of this repo is to convert existing mapserver kml applications and templates to use geoserver and house the results.


dbc-kml-apps/apps is for converted kml apps


dbc-kml-apps/apps/icons is for custom icons organized by kml app


dbc-kml-apps/geoserver is for geoserver ftl templates, named sld's, and xslts grouped by data source


dbc-kml-mapserver/kml holds the original kml apps that need to be converted

[Here](https://github.com/bcgov/dbc-kml-apps/blob/master/mapserver/templates/kml_template_layer_classification.csv) is a handy table for understanding the layers in existing mapserver templates.

Creating a custom output type for the DataBC GeoServer using XSLT
------------------------------------------------------------------

The need for creating cutstom output type is stil unclear. If they are needed, this is how its done.
To create a custom output type in GeoServer using XSLT, you need to define two files:

     a. A custom output type declaration file

     b. A custom output transformation file

 
 Each pair of custom output files should specify the transformation of one and only one feature class. 

 A custom output type declaration file should be named <formatName><featureClass>.xml (e.g., kayml_geodetic_control.xml)
    where <formatName> is "kayml_"
      and <featureClass> is a meaningful contraction of the featureClass name in the BC Geographical WhereHouse
    
 A custom output transformation file should be named <formatName><featureClass>.xslt (e.g., kayml_geodetic_control.xslt)
 
 Here is an example request for a custom output type called kayml_geodetic_control.xml:
 
    http://delivery.openmaps.gov.bc.ca/geo/pub/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=pub:WHSE_REFERENCE.MASCOT_GEODETIC_CONTROL&maxFeatures=50&outputFormat=kayml_geodetic_control&srsname=EPSG:4326
 
 Given a feature class called WHSE_REFERENCE.MASCOT_GEODETIC_CONTROL, the custom output type declaration file is named [kayml_geodetic_control.xml](https://github.com/bcgov/dbc-kml-apps/blob/master/geoserver/geodetic_control/kayml_geodetic_control.xml)
  
 The custom output type transformation file for this feature class is called [kayml_geodetic_control.xslt](https://github.com/bcgov/dbc-kml-apps/blob/master/geoserver/geodetic_control/kayml_geodetic_control.xslt)
 
## Build Air Photo Viewers

Each year the air photo viewer must be updated to add that year to the list of years.

1. Create a new git branch.
2. Edit mapserver/src/build.sh
3. Change the line 'let CURRENT_YEAR=2016' to the most recent year.
4. If new older photography is available change the line 'let FIRST_YEAR=1963' to the oldest year.
5. Save the file.
6. On a unix based system on in cygwin run ./mapserver/src/build.sh
7. Commit the changes to git and create a pull request for the branch to master.

     
