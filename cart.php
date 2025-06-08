<!-- 將資料庫連線程式載入 -->
<?php require_once('Connections/conn_db.php'); ?>
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once("php_lib.php") ?>
<?php
if (!isset($_SESSION['login'])) {
    $sPath = "login.php?sPath=checkout";
    header(sprintf("Location: %s", $sPath));
}
?>
<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("headfile.php") ?>
    <style type="text/css">
        /* 輸入錯誤時，顯示紅框 */
        table input:invalid {
            border: solid red 3px;
        }
    </style>
</head>

<body>
    <section id="header">
        <!-- 引入導覽列 -->
        <?php require_once("navbar.php") ?>
    </section>
    <section id="content">
        <!-- 引入 sidebar 分類導覽 -->
        <?php require_once("sidebar_tabs.php") ?>
        <div class="container-2">            
            <!-- 引入購物車內容模組 -->
            <?php require_once("cart_content.php") ?>
            <!-- 引入熱銷商品 -->
            <?php require_once("hot_carousel.php") ?>
    </section>
    <hr>

    </div>
    <section id="scontent">
        <!-- 引入服務說明 -->
        <?php require_once("scontent.php") ?>
    </section>
    <section id="footer">
        <!-- 引入聯絡資訊 -->
        <?php require_once("footer.php") ?>
    </section>
    <!-- 引入聯絡資訊 -->
    <?php require_once("jsfile.php") ?>
    <script type="text/javascript">
        $("input").change(function() {
            let qty = $(this).val();
            const cartid = $(this).attr("cartid");
            if (qty <= 0 || qty >= 20) {
                alert("更改數量需大於0以上, 以及小於20以下。");
                return false;
            }
            // 將變更的數量寫入後台資料庫
            $.ajax({
                url: 'change_qty.php',
                type: 'post',
                dataType: 'json',
                data: {
                    cartid: cartid,
                    qty: qty,
                },
                success: function(data) {
                    if (data.c == true) {
                        // alert(data.m);
                        window.location.reload();
                    } else {
                        alert(data.m);
                    }
                },
                error: function(data) {
                    alert('系統目前無法連接到後台資料庫');
                }
            });
        });
    </script>
</body>

</html>