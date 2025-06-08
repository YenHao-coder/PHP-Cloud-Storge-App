
<?php
// 取得收件者地址資料
$SQLstring = sprintf("SELECT *, city.Name AS ctName, town.Name AS toName FROM addbook,city,town WHERE emailid='%d' AND setdefault='1' AND addbook.myzip=town.Post AND town.AutoNo=city.AutoNo", $_SESSION['emailid']);
$addbook_rs = $link->query($SQLstring);
if ($addbook_rs && $addbook_rs->rowCount() != 0) {
    $data = $addbook_rs->fetch();
    $cname = $data['cname'];
    $mobile = $data['mobile'];
    $myzip = $data['myzip'];
    $address = $data['address'];
    $ctName = $data['ctName'];
    $toName = $data['toName'];
} else {
    $cname = "";
    $mobile = "";
    $myzip = "";
    $address = "";
    $ctName = "";
    $toName = "";
}
?>
<!-- <div class="stats-row-container">
            <div class="hitpoints-container">
                <span class="hitpoints-icon">❤️</span> <span class="hitpoints-text">Hitpoints</span>
                <span class="hitpoints-value">884</span>
            </div>
            <div class="hitpoints-container">
                <span class="hitpoints-icon">❤️</span> <span class="hitpoints-text">Hitpoints</span>
                <span class="hitpoints-value">884</span>
            </div>
            </div> -->
<h3>尊敬的會員 <?php echo $_SESSION['cname'] ?> 您好: </h3>
<div class="row">
    <div class="card col" style="width:15rem;">
        <div class="card-header color_ec7a9a " style="background-color:#f9e3eb;">
            <a title="配送資訊"><i class="fas fa-truck fa-flip-horizontal me-1"></i><span class="delivInfo-value">配送資訊</span></a>
            <a title="選擇其他收件人"><button type='button' class="btn-outline-pink" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-sync-alt"></i></button></a>
        </div>
        <div class="stats-row-container">
            <div class="delivInfo-container">
                <span class="delivInfo-icon"><i class="fas fa-user-alt"></i></span>
                <span class="delivInfo-text">姓名:</span>
                <span class="delivInfo-value"> <?php echo $cname; ?> </span>
            </div>
            <div class="delivInfo-container">
                <span class="delivInfo-icon"><i class="fas fa-phone-alt"></i></span>
                <span class="delivInfo-text">電話:</span>
                <span class="delivInfo-value"><?php echo $mobile; ?></span>
            </div>
            <div class="delivInfo-container">
                <span class="delivInfo-icon"><i class="fas fa-at"></i></span>
                <span class="delivInfo-text">郵遞區號:</span>
                <span class="delivInfo-value"><?php echo $myzip . $ctName . $toName; ?></span>
            </div>
            <div class="delivInfo-container">
                <span class="delivInfo-icon"><i class="fas fa-map-marker-alt"></i></span>
                <span class="delivInfo-text">收件地址:</span>
                <span class="delivInfo-value"><?php echo $address; ?></span>
            </div>
        </div>
    </div>
    <div class="card col ms-3">

        <ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-bottom:9px;justify-content: space-between;">
            <li class="nav-item" role="presentation">
                <a title="貨到付款"><button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true"><span style="font-size:14pt;color:#495057;"><i class="far fa-money-bill-alt"></i></span></button></a>
            </li>
            <li class="nav-item" role="presentation">
                <a title="信用卡"><button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false"><span style="font-size:14pt;color:#495057;"><i class="fas fa-credit-card me-1"></i></span></button></a>
            </li>
            <li class="nav-item" role="presentation">
                <a title="銀行轉帳"><button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false"><span style="font-size:14pt;color:#495057;"><i class="fas fa-cash-register"></i></span></button></a>
            </li>
            <li class="nav-item" role="presentation">
                <a title="電子支付"><button class="nav-link" id="epay-tab" data-bs-toggle="tab" data-bs-target="#epay" type="button" role="tab" aria-controls="epay" aria-selected="false"><span style="font-size:14pt;color:#495057;"><i class="fas fa-mobile-alt"></i></span></button></a>
            </li>
        </ul>

        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active ps-3" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                <div class="stats-row-container">
                    <div class="delivInfo-container">
                        <span class="delivInfo-icon"><i class="fas fa-user-alt"></i></span>
                        <span class="delivInfo-text">姓名:</span>
                        <span class="delivInfo-value"> <?php echo $cname; ?> </span>
                    </div>
                    <div class="delivInfo-container">
                        <span class="delivInfo-icon"><i class="fas fa-phone-alt"></i></span>
                        <span class="delivInfo-text">電話:</span>
                        <span class="delivInfo-value"><?php echo $mobile; ?></span>
                    </div>
                    <div class="delivInfo-container">
                        <span class="delivInfo-icon"><i class="fas fa-at"></i></span>
                        <span class="delivInfo-text">郵遞區號:</span>
                        <span class="delivInfo-value"><?php echo $myzip . $ctName . $toName; ?></span>
                    </div>
                    <div class="delivInfo-container">
                        <span class="delivInfo-icon"><i class="fas fa-map-marker-alt"></i></span>
                        <span class="delivInfo-text">收件地址:</span>
                        <span class="delivInfo-value"><?php echo $address; ?></span>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                <table class="table caption-top">
                    <thead>
                        <tr>
                            <th scope="col" width="5%">#</th>
                            <th scope="col" width="30%">信用卡系統</th>
                            <th scope="col" width="30%">發卡銀行</th>
                            <th scope="col" width="30%">信用卡號</th>
                            <th scope="col" width="5%"><a title="使用其他信用卡付款"><button type="button" class="btn-outline-pink"><i class="fas fa-plus-square"></i></button></a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><input type="radio" name="creditCard" id="creditCard[]" checked></th>
                            <td><img src="images/Visa_Inc._logo.svg" alt="visa" class="img-fluid"></td>
                            <td>玉山商業銀行</td>
                            <td>0000 ****</td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="radio" name="creditCard" id="creditCard[]"></th>
                            <td><img src="images/MasterCard_Logo.svg" alt="master" class="img-fluid"></td>
                            <td>玉山商業銀行</td>
                            <td>0000 ****</td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="radio" name="creditCard" id="creditCard[]"></th>
                            <td><img src="images/UnionPay_logo.svg" alt="unionpay" class="img-fluid"></td>
                            <td>玉山商業銀行</td>
                            <td>0000 ****</td>
                        </tr>

                    </tbody>
                </table>
                <hr style="color:#dee2e6;">

            </div>
            <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                <div class="stats-row-container">
                    <img src="images/Cathay-bk-rgb-db.svg" alt="cathy" class="img-fluid">
                    <div class="delivInfo-container">
                        <span class="delivInfo-icon"><i class="fas fa-university"></i></span>                        
                        <span class="delivInfo-value">國泰世華銀行 銀行代碼: 013</span>
                    </div>
                    <div class="delivInfo-container">
                        <span class="delivInfo-icon"><i class="fas fa-user-alt"></i></span>
                        <span class="delivInfo-value">林曉強</span>
                    </div>
                    <div class="delivInfo-container">
                        <span class="delivInfo-icon"><i class="fas fa-address-card"></i></span>                        
                        <span class="delivInfo-value">1234-5678-9012-3456</span>
                    </div>
                    <div class="delivInfo-container">
                        <span class="delivInfo-icon"><i class="fas fa-comment-dots"></i></span>                        
                        <span class="delivInfo-value">完成匯款後，需要1、2個工作天，帶系統入款完成後，將以簡訊通知訂單完成付款</span>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="epay" role="tabpanel" aria-labelledby="epay-tab" tabindex="0">
                <table class="table caption-top">
                    <caption>選擇電子支付方式</caption>
                    <thead>
                        <tr>
                            <th scope="col" width="5%">#</th>
                            <th scope="col" width="35%">電子支付系統</th>
                            <th scope="col" width="60%">電子支付系統</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row"><input type="radio" name="epay[]" id="epay[]" checked></th>
                            <td><img src="images/Apple_Pay_logo.svg" alt="applepay" class="img-fluid"></td>
                            <td>Apple pay</td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="radio" name="epay[]" id="epay[]"></th>
                            <td><img src="images/Line_pay_logo.svg" alt="linepay" class="img-fluid"></td>
                            <td>Line pay</td>
                        </tr>
                        <tr>
                            <th scope="row"><input type="radio" name="epay[]" id="epay[]"></th>
                            <td><img src="images/JKOPAY_logo.svg" alt="jkopay" class="img-fluid"></td>
                            <td>JKOPAY</td>
                        </tr>


                    </tbody>
                </table>
            </div>


        </div>

    </div>
    <?php
    // 建立結帳資料查詢
    $SQLstring = "SELECT * FROM cart,product,product_img WHERE ip='" . $_SERVER['REMOTE_ADDR'] . "' AND orderid IS NULL AND cart.p_id = product_img.p_id AND cart.p_id = product.p_id AND product_img.sort = 1 ORDER BY cartid DESC";
    $cart_rs = $link->query($SQLstring);
    $ptotal = 0; //設定累加的變數，初始=0;
    ?>


    <div class="table-responsive-md" sytle="width:90%;">
        <table class="table table-hover mt-1">
            <thead class="color-thead">
                <tr>
                    <td width="10%">
                        <h6>編號</h6>
                    </td>
                    <td width="10%">
                        <h6>圖片</h6>
                    </td>
                    <td width="30%">
                        <h6>名稱</h6>
                    </td>
                    <td width="15%">
                        <h6>價格</h6>
                    </td>
                    <td width="15%">
                        <h6>數量</h6>
                    </td>
                    <td width="20%">
                        <h6>小計</h6>
                    </td>
                </tr>
            </thead>

            <tbody>
                <?php while ($cart_data = $cart_rs->fetch()) { ?>
                    <tr>
                        <td>
                            <h6><?php echo $cart_data['p_id']; ?></h6>
                        </td>
                        <td><img src="product_img/<?php echo $cart_data['img_file']; ?>" alt="<?php echo $cart_data['p_name']; ?>" class="img-fluid"></td>
                        <td>
                            <h6><?php echo $cart_data['p_name']; ?></h6>
                        </td>
                        <td>
                            <h6 class="pt-1">$<?php echo $cart_data['p_price']; ?></h6>
                        </td>
                        <td>
                            <h6><?php echo $cart_data['qty']; ?></h6>
                        </td>
                        <td>
                            <h6 class="pt-1">$<?php echo $cart_data['p_price'] * $cart_data['qty']; ?></h6>
                        </td>
                    </tr>
                <?php $ptotal += $cart_data['p_price'] * $cart_data['qty'];
                } ?>

            </tbody>
            <tfoot>
                <tr>
                    <td colspan="7">
                        <h6>累計:<?php echo $ptotal; ?></h6>
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <h6>運費: 100</h6>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" class="color_red">
                        <h6>總計:<?php echo $ptotal + 100; ?></h6>
                    </td>
                </tr>
                <tr>
                    <td colspan="7"><a title="確認結帳"><button type="button" class="btn btn-outline-pink mr-2" id="btn04" name="btn04"><i class="fas fa-archive pr-2"></i></button></a>
                        <a title="回上一頁"><button type="button" class=" color-button mr-2" id="btn05" name="btn05" onclick=window.history.go(-1)><i class="fas fa-arrow-left"></i></button></a>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>