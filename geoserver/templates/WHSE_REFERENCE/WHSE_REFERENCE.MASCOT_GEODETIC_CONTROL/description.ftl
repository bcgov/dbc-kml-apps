<table class="featureInfo">
  <caption class="featureInfo">Point Information</caption>
  <#list attributes as attribute>
    <#switch attribute.name>
      <#case "GCM_NUMBER">
        <tr>
          <td>GCM Number</td>
          <td>${attribute.value}</td>
        </tr>
        <#break>
      <#default>
    </#switch>
  </#list>
</table>
