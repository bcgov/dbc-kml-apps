<table class="featureInfo">
  <caption class="featureInfo">${type.name}</caption>
  <#list features as feature>
    <#list feature.attributes as attribute>
      <td>${attribute.value}</td>
    </#list>
    </tr>
  </#list>
</table>
