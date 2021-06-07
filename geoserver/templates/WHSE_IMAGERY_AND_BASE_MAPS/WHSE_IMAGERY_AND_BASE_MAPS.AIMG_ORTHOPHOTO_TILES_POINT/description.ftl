<html>
  <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  </head>
  <body>
    <div class="pull-left">
      <div><a href="${THUMBNAIL_IMAGE_URL.value}" target="_blank"><img src="${THUMBNAIL_IMAGE_URL.value}" width="120" border="4"/></a></div>
      <div style="padding-top: 0.8em">
        <form method="get" action="https://a100.gov.bc.ca/ext/mtec/cart/addProducts.do" target="_blank">
        <input name="itemIndex" type="hidden" value="1" />
        <input name="productDefinitionId1" type="hidden" value="8" />
        <input name="productId1" type="hidden" value="${ORTHOPHOTO_TILE_POLY_ID.value}" />
        <input name="filePath1" type="hidden" value="airborne/ortho_tiles/"/>
        <input name="fileName1" type="hidden" value="${FILENAME.value}" />
        <button type="submit" class="btn btn-primary"style="width: 100%"><span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</button>
      </form>
      <a class="btn btn-primary" style="width: 100%" href="https://a100.gov.bc.ca/ext/mtec/cart/contents.do" target="_blank"><span class="glyphicon glyphicon-shopping-cart"></span> View Cart</a>
      </div>
    </div>
    <div style="margin-left: 125px">    
      <table class="table table-bordered">
        <tbody>
          <tr>
            <th>Year</th>
            <td>${YEAR_OPERATIONAL.value}</td>
          </tr>
          <tr>
            <th>Mapsheet</th>
            <td>${GEOEXTENT_MAPSHEET.value} (${MAP_SYSTEM_GRID.value})</td>
          </tr>
          <tr>
            <th>Projection</th>
            <td>${PROJECTION.value}</td>
          </tr>
          <tr>
            <th>Resolution</th>
            <td>${RESOLUTION.value}</td>
          </tr>
          <tr>
            <th>Colour</th>
            <td>${COLOUR_CONTENT.value}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <p>Click on the thumbnail to view or print a low-resolution version of this air photo.</p> 

    <p>To purchase a full-resolution version of this air photo, click the 'Add to Cart' button above.</p>

    <p>The Base Map Online Store can be used to find and purchase <a href="https://a100.gov.bc.ca/ext/mtec/products/airPhoto">full-resolution air photos</a> and <a href="https://a100.gov.bc.ca/ext/mtec/products/mapsheet">orthophoto/map products</a>.</p>
  </body>
</html>
