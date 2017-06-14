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
- Get mapserver layer name from the template file in /mapserver/templates/template-**kml-name**.kml. It should be in the tail end of the file within this line [resultset layer=**layer-name**]
- Use this layer name in a subversion query to find an associated map file.
  > http://apps.bcgov/svn/webmaps/sites/trunk/mapfiles/#repossearch=**layer-name**&repossearch-meta-start=0&repossearch-content-start=0 
- This will hopefully return a **mapfile.map** file. Open this and look for the **DATA** parameter within a **LAYER** entry. This is the features class name geoserver uses. There will most likely be multiple layers entries in which we must coincide with individual kml templates.
- Use the feature class name to look up the layer name and style with a wms *getFeatureInfo* request. Use the style closely resembling the layer entry in the mapserver mapfile.
  > http://openmaps.gov.bc.ca/geo/pub/**feature-class-name**/wms?request=getcapabilities
- Use the feature class name to look up exposed attributes and their associated names.
  > http://openmaps.gov.bc.ca/geo/pub/**feature-class-name**/wfs?request=DescribeFeatureType



## Development

A sandbox instance of *Geoserver* is located here:
> 52.60.184.85

Geoserver is running on port 8080. However, that port is not exposed to the public. So if granted *ssh* access you can forward that port to your local machine like this:
> ssh -L 8080:localhost:8080 ubuntu@52.60.184.85

Then point your browser to *http//:localhost:8080/geoserver*.

### Deploying XSLT template to sandbox
They are located at the following location on the sandbox server:
> /usr/share/geoserver/geoserver-2.11.0/data_dir/wfs/transform/

So to deploy you can run something like this:
```bash
scp kayml_geodetic_control.* \
ubuntu@52.60.184.85:/usr/share/geoserver/geoserver-2.11.0/data_dir/wfs/transform/
```

## Usefull links
[WMS GetCapabilities](http://delivery.openmaps.gov.bc.ca/geo/ows?service=wms&version=1.3.0&request=GetCapabilities)
[WFS GetCapabilities](http://delivery.openmaps.gov.bc.ca/geo/ows?service=wfs&version=1.0.0&request=GetCapabilities)
[WMS GetMap](http://delivery.openmaps.gov.bc.ca/geo/pub/wms?service=WMS&version=1.1.0&request=GetMap&layers=pub:WHSE_BASEMAPPING.DBM_BC_7H_MIL_BATHYMETRC_POLY&styles=&bbox=273875.663,362346.895,1870571.76,1735670.856&width=512&height=440&srs=EPSG:3005&format=image/png)
[KML BCGOV Web Map Libary](http://delivery.openmaps.gov.bc.ca/kml/BCGov_Web_Map_Library.kml)
[KML FrontCounter BC](http://delivery.openmaps.gov.bc.ca/kml/front_counter_bc_loader.kml)
[KML Airphoto Viewer](http://delivery.openmaps.gov.bc.ca/kml/BCGov_Airphoto_Viewer_Loader.kml)

[Geodetic control](http://delivery.openmaps.gov.bc.ca/kml/geo//BCGov_Geodetic_Survey_WMS.kml)
[Jenkins Build](https://cis.apps.gov.bc.ca/int/job/DLVR-OPENMAPS/job/geoserver_ftl_overide/)

[testing](http://delivery.openmaps.gov.bc.ca/kml?layers=pub:WHSE_REFERENCE.MASCOT_GEODETIC_CONTROL)
