<!-- 將資料庫連線程式載入 -->
<?php require_once('Connections/conn_db.php'); ?>
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once("php_lib.php") ?>
<?php
//驗證是否帳號登入
if(!isset($_SESSION['login'])){
    $sPath = "login.php?sPath=orderlist";
    header(sprintf("Location: %s", $sPath));
}
?>
<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("headfile.php") ?>
    <style type="text/css">
        .accrodion-header a {
            text-decoration: none;
        }
    </style>
</head>

<body>
    <section id="header">
        <!-- 引入導覽列 -->
        <?php require_once("navbar.php") ?>
    </section>
    <!-- 引入 sidebar 分類導覽 -->
    <?php require_once("sidebar_tabs.php") ?>
    <div class="container-2">
        <section id="content">
            <!-- 引入訂單查詢 -->
            <?php require_once("order_content.php") ?>           
            <!-- 引入熱銷商品 -->
            <?php require_once("hot_carousel.php") ?>          
        </section>
    </div>
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
</body>

</html>