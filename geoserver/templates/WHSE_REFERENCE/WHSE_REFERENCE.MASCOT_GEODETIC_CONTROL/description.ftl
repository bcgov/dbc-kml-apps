<table class="featureInfo" width="320">
  <#assign latitude = "${attributes.LATITUDE_DEGREES.value}&deg; ${attributes.LATITUDE_MINUTES.value}&#39; ${attributes.LATITUDE_SECONDS.value}&#34;">
  <#assign longitude = "-${attributes.LONGITUDE_DEGREES.value}&deg; ${attributes.LONGITUDE_MINUTES.value}&#39; ${attributes.LONGITUDE_SECONDS.value}&#34;">
  <#list attributes as attribute>
    <#switch attribute.name>
      <#case "GCM_NUMBER">
        <tr>
          <td>GCM Number</td>
          <td>${attribute.value}</td>
        </tr>
      <#break>
      <#case "TABLET_MARKING">
        <tr>
          <td>Tablet Marking</td>
          <td>${attribute.value}</td>
        </tr>
      <#break>
      <#case "MUNICIPALITY_NAME">
        <tr>
          <td>Municipality</td>
          <td>${attribute.value}</td>
        </tr>
      <#break>
      <#case "MASCOTW_GCM_QUERY_URL">
        <tr>
          <td>Additional Information</td>
          <td><a href="${attribute.value}">Link</a></td>
        </tr>
      <#break>
      <#case "LATITUDE_DEGREES">
        <tr>
          <td>Latitude</td>
          <td>${latitude}</td>
        </tr>
      <#break>
      <#case "LONGITUDE_DEGREES">
        <tr>
          <td>Longitude</td>
          <td>${longitude}</td>
        </tr>
      <#break>
      <#default>
    </#switch>
  </#list>
</table>
