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
</head>

<body>
    <section id="header">
            <!-- 引入導覽列 -->
            <?php require_once("navbar.php") ?>
    </section>
    <!-- 引入 sidebar 分類導覽 -->
            <?php require_once("sidebar_tabs.php") ?>
    <div class="container-2">
        <section id="content" class="">
            <!-- 引入廣告輪播 -->
            <?php require_once("carousel.php") ?>
            <!-- 引入產品清單 -->
            <?php require_once("product_list_popover.php") ?>
            <!-- 引入熱銷商品 -->
            <?php require_once("hot_carousel.php") ?>
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
    <?php require_once("jsfile.php") ?>
    <script type="text/javascript">
        /**
         * 頁籤導覽列顯示/隱藏控制
         * 取得所有 <a> 的父層 <li>
         * 用於追蹤是否懸停在 <a> 或 <div> 上
         * 使用 setTimeout 延遲檢查，給滑鼠移動到 div 的時間
         */
        document.addEventListener("DOMContentLoaded", function() {
            const tabLinks = document.querySelectorAll(
                ".nav-tabs.myTabs .nav-link.tab-link"
            );

            tabLinks.forEach(function(tabLink) {
                const targetId = tabLink.getAttribute("data-bs-target");
                const tabPane = document.querySelector(
                    ".tab-content.tab-pane-content > " + targetId
                );
                
                if (tabPane) {
                  const parentLi = tabLink.parentNode;
                  let isHovered = false;
                    parentLi.addEventListener("mouseenter", function() {
                        isHovered = true;
                        tabPane.classList.add("active", "show");
                    });

                    parentLi.addEventListener("mouseleave", function() {
                        isHovered = false;
                        setTimeout(function() {
                            if (!isHovered) {
                                tabPane.classList.remove("active", "show");
                            }
                        }, 1);
                    });

                    tabPane.addEventListener("mouseenter", function() {
                        isHovered = true;
                    });

                    tabPane.addEventListener("mouseleave", function() {
                        isHovered = false;
                        tabPane.classList.remove("active", "show");
                    });
                }
            });

            // // 啟用 Bootstrap 的 Tab 功能 (針對第一層)
            // var firstLevelTabElList = document.querySelectorAll('.nav-tabs.myTabs a[data-bs-toggle="tab"]')
            // firstLevelTabElList.forEach(tabEl => {
            //     var tab = new bootstrap.Tab(tabEl)
            // })
        });
</script>

</body>

</html>