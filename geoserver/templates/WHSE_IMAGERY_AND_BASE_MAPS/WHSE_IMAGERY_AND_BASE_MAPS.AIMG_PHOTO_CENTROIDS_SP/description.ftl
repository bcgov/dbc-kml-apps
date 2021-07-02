<html>
  <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  </head>
  <body>
    <div class="pull-left">
<#if THUMBNAIL_IMAGE_URL.value>
      <div><a href="${THUMBNAIL_IMAGE_URL.value}" target="_blank"><img src="${THUMBNAIL_IMAGE_URL.value}" width="120" border="4"/></a></div>
</#if>
<#if !THUMBNAIL_IMAGE_URL.value>
      <div class="alert alert-warning" style="width:120px;font-weight:700;font-size:1.1em;text-align:center">No preview available for this photo</div>
</#if>
      <div style="padding-top: 0.8em">
        <form method="get" action="https://a100.gov.bc.ca/ext/mtec/cart/addProducts.do" target="_blank">
        <input name="itemIndex" type="hidden" value="1" />
        <input name="productId1" type="hidden" value="${FILM_ROLL.value}/${FRAME_NUMBER.value}" />
        <input name="productDefinitionId1" type="hidden" value="1" />
        <input name="productName1" type="hidden" value="Digital Air Photo" />
        <input name="productDescription1" type="hidden" value=""/>
        <button type="submit" class="btn btn-primary"style="width: 100%"><span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart</button>
      </form>
      <a class="btn btn-primary" style="width: 100%" href="https://a100.gov.bc.ca/ext/mtec/cart/contents.do" target="_blank"><span class="glyphicon glyphicon-shopping-cart"></span> View Cart</a>
      </div>
    </div>
    <div style="margin-left: 125px">    
      <table class="table table-bordered">
        <tbody>
          <tr>
            <th>Roll/Frame</th>
            <td>${FILM_ROLL.value}/${FRAME_NUMBER.value}</td>
          </tr>
          <tr>
            <th>Date/Time</th>
            <td>${PHOTO_DATE.value} ${PHOTO_TIME.value}</td>
          </tr>
          <tr>
            <th>Flying Height (m)</th>
            <td>${FLYING_HEIGHT.value}</td>
          </tr>
          <tr>
            <th>Focal Length (mm)</th>
            <td>${FOCAL_LENGTH.value}</td>
          </tr>
          <tr>
            <th>Media</th>
            <td>${MEDIA.value}</td>
          </tr>
          <tr>
            <th>Nominal Scale</th>
            <td>${SCALE.value}</td>
          </tr>
          <tr>
            <th>Ground Sample Distance (cm)</th>
            <td>${GROUND_SAMPLE_DISTANCE.value}</td>
          </tr>
          <tr>
            <th>Operation Tag</th>
            <td>${OPERATION_TAG.value}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <p>Click on the thumbnail to view or print a low-resolution version of this air photo.</p> 

    <p>To purchase a full-resolution version of this air photo, click the 'Add to Cart' button above.</p>

    <p>The Base Map Online Store can be used to find and purchase <a href="https://a100.gov.bc.ca/ext/mtec/products/airPhoto">full-resolution air photos</a> and <a href="https://a100.gov.bc.ca/ext/mtec/products/mapsheet">orthophoto/map products</a>.</p>
  </body>
</html>
