<div class="card mb-3">
    <div class="row g-0">
        <div class="col-md-4">
            <?php
            //取得產品圖片檔名資料
            $SQLstring = sprintf("SELECT * FROM product_img WHERE product_img.p_id=%d ORDER BY sort", $_GET['p_id']);
            $img_rs = $link->query($SQLstring);
            $imgList = $img_rs->fetch();
            ?>
            <img id="showGoods" name="showGoods" src="product_img/<?php echo $imgList['img_file']; ?>" class="img-fluid rounded-start" alt="<?php echo $data['p_name']; ?>" title="<?php echo $data['p_name']; ?>">
            <div class="row mt-2">
                <?php do { ?>
                    <div class="col-md-2"><a href="product_img/<?php echo $imgList['img_file']; ?>" rel="group" class="fancybox" title="<?php echo $data['p_name']; ?>"><img src="product_img/<?php echo $imgList['img_file']; ?>" alt="<?php echo $data['p_name']; ?>" class="img-fluid" title="<?php echo $data['p_name']; ?>"></a></div>
                <?php } while ($imgList = $img_rs->fetch()); ?>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h5 class="card-title"><?php echo $data['p_name']; ?></h5>
                <p class="card-text"><?php echo $data['p_intro']; ?></p>
                <h3 class="color_ec7a9a">$<?php echo $data['p_price']; ?></h3>
                <div class="row mt-3">
                    <div class="col-md-4">
                        <div class="input-group">
                            <input type="number" id="qty" name="qty" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" value="1">
                            <button id="button01" class="color-pink" type="button" onclick="addcart(<?php echo $data['p_id']; ?>)"><a title="加入購物車"><i class="fas fa-cart-plus"></i></a></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<hr style="color:#333;">
<?php echo $data['p_content']; ?>