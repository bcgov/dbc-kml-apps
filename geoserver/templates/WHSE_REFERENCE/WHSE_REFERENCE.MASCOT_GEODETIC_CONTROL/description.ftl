<table class="featureInfo">
  <caption class="featureInfo">${type.name}</caption>
  <#list attributes as attribute>
    <tr>
      <td>${attribute.name}</td>
      <td>${attribute.value}</td>
    </tr>
  </#list>
</table>
