<table class="featureInfo">
  <caption class="featureInfo">${type.name}</caption>
  <#assign odd = false>
  <#list features as feature>
    <#if odd>
      <tr class="odd">
    <#else>
      <tr>
    </#if>
    <#assign odd = !odd>

    <#list feature.attributes as attribute>
      <#if !attribute.isGeometry>
        <td>${attribute.value}</td>
      </#if>
    </#list>
    </tr>
  </#list>
</table>
