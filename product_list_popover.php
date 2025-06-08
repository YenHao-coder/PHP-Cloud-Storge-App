<?php
// 建立 product 藥妝商品 RS
$maxRows_rs = 12; //分頁設定數量
$pageNum_rs = 0; //起始頁 = 0
if (isset($_GET['pageNum_rs'])) {
    $pageNum_rs = $_GET['pageNum_rs'];
}

$startRow_rs = $pageNum_rs * $maxRows_rs;
if (isset($_GET['search_name'])) {
    // 使用關鍵字查詢
    $queryFirst = sprintf("SELECT * FROM product, product_img, pyclass WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid= pyclass.classid AND product.p_name LIKE '%s' ORDER BY product.p_id DESC", '%' . $_GET['search_name'] . '%');
} elseif (isset($_GET['level']) && $_GET['level'] == 1) {
    //使用第一層類別查詢
    $queryFirst = sprintf("SELECT * FROM product, product_img, pyclass WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid= pyclass.classid AND pyclass.uplink='%d' ORDER BY product.p_id DESC", $_GET['classid']);
} elseif (isset($_GET['classid'])) {
    // 使用產品類別查詢
    $queryFirst = sprintf("SELECT * FROM product, product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id AND product.classid= '%d' ORDER BY product.p_id DESC", $_GET['classid']);
} else {
    // 列出產品product資料查詢
    $queryFirst = sprintf("SELECT * FROM product, product_img WHERE p_open=1 AND product_img.sort=1 AND product.p_id=product_img.p_id ORDER BY product.p_id DESC", $maxRows_rs);
}

$query = sprintf("%s LIMIT %d,%d", $queryFirst, $startRow_rs, $maxRows_rs);
$pList01 = $link->query($query);
// echo "<h1>$query</h1>";
$i = 1; //控制每列產生
?>
<?php
if ($pList01->rowCount() != 0) { ?>
    <?php
    while ($pList01_Rows = $pList01->fetch()) {
    ?>
        <?php if ($i % 4 == 1) { ?> <div class="row text-center"><?php } ?>
            <div class="col-md-3">
                <div class="card mb-3">
                    <a href="goods.php?p_id=<?php echo $pList01_Rows['p_id']; ?>">
                        <img src="./product_img/<?php echo $pList01_Rows['img_file']; ?>" class="card-img-top" alt="<?php echo $pList01_Rows['p_name']; ?>" title="<?php echo $pList01_Rows['p_name']; ?>">
<!-- <span class="color_ec7a9a"><?php echo $pList01_Rows['p_name']; ?></span> -->
</a>
                            <span>
                                <a
                                    class="popover-trigger"
                                    data-bs-toggle="popover"
                                    data-bs-placement="bottom"
                                    data-bs-html="true"
                                    data-bs-title="<?php echo $pList01_Rows['p_name']; ?>"
                                    data-product-id="<?php echo $pList01_Rows['p_id']; ?>"
                                    data-product-intro="<?php echo htmlspecialchars($pList01_Rows['p_intro'], ENT_QUOTES, 'UTF-8'); ?>"
                                    data-product-price="NT<?php echo $pList01_Rows['p_price']; ?>"
                                ><i class="fas fa-ellipsis-h color_ec7a9a" ></i></a>
                            </span>
<!-- <div class="btn btn-outline-light" style="border:none;">
<button type="button" id="button01[]" name="button01[]" onclick="addcart(<?php echo $pList01_Rows['p_id']; ?>)"><i class="fas fa-shopping-cart"></i></button>
</div> -->
                            
                            
                </div>
            </div>
            <?php if ($i % 4 == 0 || $i == $pList01->rowCount()) { ?>
                </div><?php } ?>
        <?php $i++;
    }
        ?>
        <div class="row mt-3">
            <?php
            if (isset($_GET['totalRows_rs'])) {
                $totalRows_rs = $_GET['totalRows_rs'];
            } else {
                $all_rs = $link->query($queryFirst);
                $totalRows_rs = $all_rs->rowCount();
            }
            $totalPages_rs = ceil($totalRows_rs / $maxRows_rs) - 1;
            //呼叫分頁功能函數
            $prev_rs = "&laquo;";
            $next_rs = "&raquo;";
            $separator = "|";
            $max_links = 20;
            $pages_rs = buildNavigation($pageNum_rs, $totalPages_rs, $prev_rs, $next_rs, $separator, $max_links, true, 3, "rs");
            ?>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center custom-pagination">
                    <?php echo $pages_rs[0] . $pages_rs[1] . $pages_rs[2]; ?>
                </ul>
            </nav>
        </div>
    <?php } else { ?>
        <div class="alert alert-danger" role="alert">
            抱歉，沒有相關產品。
        </div>
    <?php } ?>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const popoverTriggerList = document.querySelectorAll('.popover-trigger');
    let currentlyVisiblePopover = null; //追蹤目前顯示的彈窗實例
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => {
      const productId = popoverTriggerEl.dataset.productId;
      const productName = popoverTriggerEl.dataset.bsTitle;
    //   const productIntroFull = popoverTriggerEl.dataset.productIntro; // 從 data-product-intro 獲取完整簡述
      const productPrice = popoverTriggerEl.dataset.productPrice; // 從 data-product-price 獲取價格

      const dynamicContent = `
        <div>
        <h6>${productPrice}</h6>
        <p>${productName}</p>
        <div class="input-group mb-3">
            <input type="number" id="qty" name="qty" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value="1">
            <button class="btn" type="button" onclick="addcart('${productId}')" ><a title="加入購物車"><i class="fas fa-cart-plus"></i></a></button>
        </div>          
          
        </div>
      `;

      const popover = new bootstrap.Popover(popoverTriggerEl, {
        content: dynamicContent,
        title:"",
        html: true,
        placement: 'bottom',
        sanitize: true,
        allowList: {
          ...bootstrap.Popover.Default.allowList,
          h5: [],
          ul: [],
          li: [],
          div: [],
          p: [],
          button: ['type', 'class', 'onclick'],
          input: ['type', 'id', 'value', 'min'],
          i:['class'],
        }
      });

       // 為每個觸發元素添加事件監聽器，以控制彈窗的顯示和隱藏
      popoverTriggerEl.addEventListener('click', function(){

        if(currentlyVisiblePopover && currentlyVisiblePopover._element !== popoverTriggerEl){
            // 如果目前有彈窗顯示，且不是當前點擊的觸發元素所對應的彈窗，則隱藏它
            currentlyVisiblePopover.hide()
        }

        // 顯示或切換當前點擊的彈窗
        popover.toggle();

        // 更新目前顯示的彈窗
        currentlyVisiblePopover = bootstrap.Popover.getInstance(popoverTriggerEl);

        });

        popoverTriggerEl.addEventListener('hidden.bs.popover', function(){
            if (currentlyVisiblePopover && currentlyVisiblePopover._element === popoverTriggerEl) {
          currentlyVisiblePopover = null;
        }
        });
        return popover;
    });
  });
</script>