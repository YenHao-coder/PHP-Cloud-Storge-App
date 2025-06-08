<?php //建立熱銷商品查詢
$SQLstring = "SELECT * FROM hot,product,product_img WHERE hot.p_id=product_img.p_id AND hot.p_id=product.p_id AND product_img.sort=1 ORDER BY h_sort";
$hot = $link->query($SQLstring);
?>
<div id="carouselExampleSlidesOnly" class="carousel slide carousel-dark mb-3" data-bs-ride="carousel">
    <div class="carousel-inner">        
        <p class="text-center"><span class="color_ec7a9a">熱 銷 推 薦</span></p>
        <?php $i = 0;
        while ($data = $hot->fetch()) { ?>
            <div class="carousel-item <?php echo activeShow($i, 0); ?>">
                <a href="goods.php?p_id=<?php echo $data['p_id']; ?>">
                    <img src="product_img/<?php echo $data['img_file']; ?>" alt="HOT <?php echo $data['h_sort']; ?> " title="<?php echo $data['p_name']; ?>" height="70%" width="70%"></a>
            </div>
        <?php $i++; } ?>
    </div>
</div>