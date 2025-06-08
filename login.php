<!-- 將資料庫連線程式載入 -->
<?php require_once('Connections/conn_db.php'); ?>
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once("php_lib.php"); ?>
<?php
// 取得要返回的 php 頁面
if (isset($_GET['sPath'])) {
    $sPath = $_GET['sPath'] . ".php";
} else {
    //登入完成預設要進入首頁
    $sPath = "index.php";
}
//檢查是否完成登入驗證
if (isset($_SESSION['login'])) {
    header(sprintf("location: %s", $sPath));
    // php 5.2.6舊版採用下列方式
    // echo "<script>window.location.href = '". $sPath ."';</script>"
}
?>
<!doctype html>
<html lang="zh-TW">

<head>
    <!-- 引入網頁標頭 -->
    <?php require_once("headfile.php") ?>
</head>

<body>
    <section id="header">
        <!-- 引入導覽列 -->
        <?php require_once("navbar.php") ?>
        <!-- 引入 sidebar 分類導覽 -->
        <?php require_once("sidebar_tabs.php") ?>
    </section>
    <div class="container-2">
        <section id="content">
            <!-- 引入登入模組 -->
            <?php require_once("login_content.php") ?>
        </section>
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
    <div id="loading" name="loading" style="display:none;position:fixed;width:100%;height:100%;top:0;left:0;background-color:rgba(255,255,255,0.5);z-index:9999"><i class="fas fa-spinner fa-spin fa-5x fa-fw" style="position:absolute;top:50%;left:50%"></i></div>
    <script type="text/javascript" src="commlib.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#form1").submit(function() {
                const inputAccount = $("#inputAccount").val();
                const inputPassword = MD5($("#inputPassword").val());
                $("#loading").show();
                //利用$ajax函數呼叫後台的auth_user.php驗證帳號密碼
                $.ajax({
                    url: "auth_user.php",
                    type: 'post',
                    dataType: 'json',
                    data: {
                        inputAccount: inputAccount,
                        inputPassword: inputPassword,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            // window.location.reload()
                            window.location.href = "<?php echo $sPath; ?>"
                        } else {
                            alert(data.m);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連線到後台資料庫")
                    }
                });
            });
        });
    </script>
</body>

</html>