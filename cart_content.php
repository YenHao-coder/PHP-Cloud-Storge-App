<?php
// 建立購物車資料查詢
$SQLstring = "SELECT * FROM cart,product,product_img WHERE ip='" . $_SERVER['REMOTE_ADDR'] . "' AND orderid IS NULL AND cart.p_id=product_img.p_id AND cart.p_id=product.p_id AND product_img.sort=1 ORDER BY cartid DESC";
$cart_rs = $link->query($SQLstring);
$ptotal = 0; //設定累加的變數,初始=0
?>
<h3>尊敬的會員 <?php echo $_SESSION['cname']? $_SESSION['cname'] : '' ?> 購物車:</h3>
<?php if ($cart_rs->rowCount() != 0) { ?>
    <a href="checkout.php" id="btn04" name="btn04" ><button class="btn-outline-pink" title="結帳"><i class="fa-solid fa-sack-dollar"></i></button></a>
    <a title="清空購物車"><button type="button" id="btn03" name="btn03" class="btn-outline-pink" onclick="btn_confirmLink('是否確定清空購物車?','shopcart_del.php?mode=2')"><i class="fas fa-trash-restore-alt"></i></button></a>
    <a href= "index.php" id="btn01" name="btn01" ><button class="color-button" title="回首頁"><i class="fas fa-home"></i></button></a>
    <button type="button" id="btn02" name="btn02" class="color-button" onclick="window.history.go(-1);"><a title="回上頁"><i class="fas fa-undo-alt"></i></a></button>

    <div class='table-responsive-md'>
        <table class="table mt-3 ">
            <thead>
                <tr class="color-thead ">
                    <td width="15%">產品編號</td>
                    <td width="15%">圖片</td>
                    <td width="15%">名稱</td>
                    <td width="15%">價格</td>
                    <td width="10%">數量</td>
                    <td width="15%">小計</td>
                    <td width="15%">下次再買</td>
                </tr>
            </thead>
            <tbody>
                <?php while ($cart_data = $cart_rs->fetch()) { ?>
                    <tr>
                        <td><?php echo $cart_data['p_id']; ?></td>
                        <td><img src="product_img/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>" class="img-fluid"></td>
                        <td><?php echo $cart_data['p_name']; ?></td>
                        <td>
                            <h4 class="color_ec7a9a pt-1">$<?php echo $cart_data['p_price']; ?></h4>
                        </td>
                        <td style="min-width:100px;">
                            <div class="input-group"><input type="number" name="qty[]" id="qty[]" value="<?php echo $cart_data['qty']; ?>" min="1" max="49" cartid="<?php echo $cart_data['cartid']; ?>" required class="form-control"></div>
                        </td>
                        <td>
                            <h4 class="color_ec7a9a pt-1">$<?php echo $cart_data['p_price'] * $cart_data['qty']; ?></h4>
                        </td>
                        <td><button type="button" id="btn[]" name="btn[]" class="btn-outline-pink btn-lg" onclick="btn_confirmLink('確定刪除本資料?','shopcart_del.php?mode=1&cartid=<?php echo $cart_data['cartid']; ?>')"><a title="刪除"><i class="fa-solid fa-trash"></i></a></button></td>
                    </tr>
                <?php $ptotal += $cart_data['p_price'] * $cart_data['qty'];
                } ?>
            </tbody>
            <tfoot>
                <tr class="justify-content-end">
                    <td colspan="7" class="color_495057">累計:<?php echo $ptotal; ?></td>
                </tr>
                <tr>
                    <td colspan="7" class="color_495057">運費:100</td>
                </tr>
                <tr>
                    <td colspan="7" class="color_ec7a9a">總計:<?php echo $ptotal + 100; ?></td>
                </tr>
                <tr>
                    <td colspan="7"><a href="checkout.php" id="btn04" name="btn04" title="結帳"><button class="btn-outline-pink"><i class="fa-solid fa-sack-dollar"></i></button></a>
                </tr>
            </tfoot>
        </table>
    </div>
<?php } else { ?>
    <div class="alert alert-warning" role="alert">
        抱歉!目前購物車沒有相關產品。
    </div>
<?php } ?>