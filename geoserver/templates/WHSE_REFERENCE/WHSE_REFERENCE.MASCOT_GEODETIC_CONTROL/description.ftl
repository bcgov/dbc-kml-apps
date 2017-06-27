<table class="featureInfo">
  <#assign latitude = "${attributes.LATITUDE_DEGREES.value} ${attributes.LATITUDE_MINUTES.value} ${attributes.LATITUDE_SECONDS.value}">
  <#list attributes as attribute>
    <#switch attribute.name>
      <#case "GCM_NUMBER">
        <tr>
          <td>GCM Number</td>
          <td>${attribute.value}</td>
        </tr>
      <#break>
      <#case "LATITUDE_DEGREES">
        <tr>
          <td>Latitude</td>
          <td>${latitude}</td>
        </tr>
      <#break>
      <#default>
    </#switch>
  </#list>
</table>
