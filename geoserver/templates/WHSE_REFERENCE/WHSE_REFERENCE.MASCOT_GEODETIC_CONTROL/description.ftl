<table class="featureInfo">
  <caption class="featureInfo">${type.name}</caption>
  <tr>
  <#list type.attributes as attribute>

  <#-- map field names to aliases -->
  <#assign attributeAlias = attribute.name>
  <#if attribute.name == 'SE_ANNO_CAD_DATA'>
  <#assign attributeAlias = 'SE Anno CAD Data'>
  </#if>
  <#if attribute.name == 'OBJECTID'>
  <#assign attributeAlias = 'ObjectID'>
  </#if>
  <#if attribute.name == 'MASCOTW_GCM_QUERY_URL'>
  <#assign attributeAlias = 'MASCOTW GCM Query URL'>
  </#if>
  <#if attribute.name == 'MUNICIPALITY_NAME'>
  <#assign attributeAlias = 'Municipality Name'>
  </#if>
  <#if attribute.name == 'SYMBOLOGY_TYPE'>
  <#assign attributeAlias = 'Symbology Type'>
  </#if>
  <#if attribute.name == 'TABLET_MARKING'>
  <#assign attributeAlias = 'Tablet Marking'>
  </#if>
  <#if attribute.name == 'LONGITUDE_SECONDS'>
  <#assign attributeAlias = 'Longitude Seconds'>
  </#if>
  <#if attribute.name == 'LONGITUDE_MINUTES'>
  <#assign attributeAlias = 'Longitude Minutes'>
  </#if>
  <#if attribute.name == 'LONGITUDE_DEGREES'>
  <#assign attributeAlias = 'Longitude Degrees'>
  </#if>
  <#if attribute.name == 'LATITUDE_SECONDS'>
  <#assign attributeAlias = 'Latitude Seconds'>
  </#if>
  <#if attribute.name == 'LATITUDE_MINUTES'>
  <#assign attributeAlias = 'Latitude Minutes'>
  </#if>
  <#if attribute.name == 'LATITUDE_DEGREES'>
  <#assign attributeAlias = 'Latitude Degrees'>
  </#if>
  <#if attribute.name == 'GCM_NUMBER'>
  <#assign attributeAlias = 'GCM No.'>
  </#if>

  <#if !attribute.isGeometry>
    <th>${attributeAlias}</th>
  </#if>

  </#list>
  </tr>
</table>
