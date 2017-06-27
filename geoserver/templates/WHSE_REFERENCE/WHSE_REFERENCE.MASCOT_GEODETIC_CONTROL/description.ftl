<table class="featureInfo">
  <caption class="featureInfo">${type.name}</caption>
  <#list attributes as attribute>
    <#switch attribute.name>
      <#case "GCM_NUMBER">
        <tr>
          <td>${attribute.name}</td>
          <td>${attribute.value}</td>
        </tr>
        <#break>
      <#default>
    </#switch>
  </#list>
</table>
