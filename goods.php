<!-- 將資料庫連線程式載入 -->
<?php require_once('Connections/conn_db.php'); ?>
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once("php_lib.php") ?>
<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("headfile.php") ?>
    <link rel="stylesheet" href="./fancybox-2.1.7/source/jquery.fancybox.css">
</head>

<body>
    <section id="header">
        <!-- 引入導覽列 -->
        <?php require_once("navbar.php") ?>
    </section>

    <!-- 引入 sidebar 分類導覽 -->
    <?php require_once("sidebar_tabs.php") ?>
    <section id="content">
        <div class="container-2">
            
            <!-- 引入產品類別分項麵包屑 -->
            <?php require_once("breadcrumb.php") ?>
            <!-- 產品詳細資訊 -->
            <?php require_once("goods_content.php") ?>
            <hr>
            <!-- 引入熱銷商品 -->
            <?php require_once("hot_carousel.php") ?>
        </div>
    </section>
    <hr>
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
    <script type="text/javascript" src="./fancybox-2.1.7/source/jquery.fancybox.js"></script>
    <script type="text/javascript">
        $(function() {
            // 定義滑鼠滑過圖片檔名填入主圖src中
            $(".card .row.mt-2 .col-md-2 a").mouseover(function() {
                let imgsrc = $(this).children("img").attr("src");
                $("#showGoods").attr({
                    "src": imgsrc
                });
            });

            //將子圖片放到lightbox展示
            $(".fancybox").fancybox();
        });
    </script>

</body>

</html>