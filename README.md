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

The need for creating custom output type is stil unclear. If they are needed, this is how its done.
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

## Process
- Connect to Government network (VPN)
- Get mapserver layer name from the KML file in /mapserver/**kml-name**.kml. It should be in the href tag within the url to mapserver.
- Use this layer name in a subversion query to find an associated map file.
  > http://apps.bcgov/svn/webmaps/sites/trunk/mapfiles/#repossearch=**layer-name**&repossearch-meta-start=0&repossearch-content-start=0 
- This will hopefully return a **mapfile.map** file. Open this and look for the **DATA** parameter within a **LAYER** entry. This is the features class name geoserver uses. There will most likely be multiple layers entries in which we must coincide with individual kml templates.
- An alternative is to checkout all the map files like this:
  >  svn checkout http://apps.bcgov/svn/webmaps/sites/trunk/mapfiles
  Then use a search tool like *grep*
  >  grep 'TA_MUNICIP' *.map
  This is handy if you don't want to operate in VPN all the time.
- Use the feature class name to look up the layer name and style with a wms *getFeatureInfo* request. Use the style closely resembling the layer entry in the mapserver mapfile.
  > http://openmaps.gov.bc.ca/geo/pub/**feature-class-name**/wms?request=getcapabilities
- Use the feature class name to look up exposed attributes and their associated names.
  > http://openmaps.gov.bc.ca/geo/pub/**feature-class-name**/wfs?request=DescribeFeatureType


## Usefull links
[WMS GetCapabilities](http://delivery.openmaps.gov.bc.ca/geo/ows?service=wms&version=1.3.0&request=GetCapabilities)
[WFS GetCapabilities](http://delivery.openmaps.gov.bc.ca/geo/ows?service=wfs&version=1.0.0&request=GetCapabilities)
[WMS GetMap](http://delivery.openmaps.gov.bc.ca/geo/pub/wms?service=WMS&version=1.1.0&request=GetMap&layers=pub:WHSE_BASEMAPPING.DBM_BC_7H_MIL_BATHYMETRC_POLY&styles=&bbox=273875.663,362346.895,1870571.76,1735670.856&width=512&height=440&srs=EPSG:3005&format=image/png)
[KML BCGOV Web Map Libary](http://delivery.openmaps.gov.bc.ca/kml/BCGov_Web_Map_Library.kml)
[KML FrontCounter BC](http://delivery.openmaps.gov.bc.ca/kml/front_counter_bc_loader.kml)
[KML Airphoto Viewer](http://delivery.openmaps.gov.bc.ca/kml/BCGov_Airphoto_Viewer_Loader.kml)

[Geodetic control](http://delivery.openmaps.gov.bc.ca/kml/geo//BCGov_Geodetic_Survey_WMS.kml)
[Jenkins Build](https://cis.apps.gov.bc.ca/int/job/DLVR-OPENMAPS/job/geoserver_ftl_overide/)

You can also specify it by data store:layer format like this
[Geodetic Control](http://delivery.openmaps.gov.bc.ca/geo/pub/wms/kml?layers=pub:WHSE_REFERENCE.MASCOT_GEODETIC_CONTROL)

## KML Templating

Node must be installed on the system.
Make sure the following modules are installed globally.
```
npm i -g pug-cli html2pug jstransformer-cdata livescript
```

Convert the existing kml files into pug files like this
```
html2pug kmlfile.kml
```

There is an npm step for building pug files back into kml:

```
npm run build
```
