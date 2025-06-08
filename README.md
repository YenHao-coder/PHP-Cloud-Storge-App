# 🍰 甜點線上商城 🍰
這是一個基於 PHP 5.6.40 的輕量級電商網站，旨在提供一個基本的線上購物體驗，讓用戶能夠瀏覽商品、管理購物車和追蹤訂單。

---
# ✨ 核心功能
- 用戶管理：支援用戶註冊與安全登入，確保個人化購物體驗。
- 購物車功能：用戶可將喜愛的甜點加入購物車，方便集中結帳。
- 訂單追蹤：已註冊用戶可查詢歷史訂單狀態。
- 響應式設計：網站佈局適應不同裝置螢幕大小。
- 會員頁面互動：透過 Vue.js 實現會員資訊修改頁面的動態互動。

---
# 🛠 技術棧
- 後端：
  - PHP 5.6.40
- 前端：
  - HTML
  - CSS (搭配 Bootstrap 5 實現響應式設計)
  - JavaScript (使用 jQuery 增強互動性)
  - Vue.js (透過 CDN 載入，用於會員修改頁面內容)
- 資料庫：
  - MariaDB 10.1.38 (10.1.38-MariaDB - mariadb.org binary distribution)
- 伺服器環境：
  - 網頁伺服器: Apache/2.4.38 (Win64) OpenSSL/1.0.2q PHP/5.6.40
  - 資料庫用戶端: libmysql - mysqlnd 5.0.11-dev - 20120503
 
---
# 🚀 部署專案必要條件
在部署此「甜點線上商城」專案前，請確保您的伺服器環境符合以下最低要求：
- PHP 5.6.40 或更高版本 (建議使用與開發環境相同的版本以避免相容性問題)。
- MariaDB 10.1.38 或兼容的 MySQL 資料庫。
- Apache 2.4.38 或兼容的 Web 伺服器 (需支援 PHP 執行)。
- libmysql - mysqlnd 5.0.11-dev (PHP 的 MySQL 擴展)。
- XAMPP v3.2.3 或類似的整合開發環境 (若在本地開發)。

---
# ⚙️ 安裝步驟
以下是將「甜點線上商城」部署到您本地開發環境或 Web 伺服器的步驟：

1. 克隆專案：
   首先，將此專案從 GitHub 克隆到您的本地電腦：
   ```
   git clone https://github.com/YenHao-coder/PHP-Cloud-Storge-App.git
   cd PHP-Cloud-Storge-App
   ```
2. 資料庫設定：
  - 創建資料庫：
  請登入您的 MariaDB/MySQL 資料庫管理介面 (例如 phpMyAdmin 或透過命令列)，建立一個新的資料庫，命名為：`cakes_shop_db`
  - 匯入資料庫結構與初始數據：
  在您的專案根目錄下，您會找到一個名為`expstore.sql`的 SQL 腳本。
  此檔案包含專案所需的資料庫結構 (Schema)，即所有表格的創建語句，以及少量的靜態參考數據 (如縣市鄉鎮、產品資訊、訂單狀態選項等)。它不包含敏感或實際業務數據。
  請將此腳本匯入到您剛才建立的`cakes_shop_db`資料庫中。

3. 設定資料庫連線：
  - 在專案根目錄下，您需要手動建立一個名為`Connection`的資料夾。
  - 在`Connection`資料夾內，建立一個名為`conn_db.php`的檔案。
  - `conn_db.php`檔案的內容應包含您的資料庫連線資訊。請根據您的實際資料庫配置填寫：
```PHP
<?php
$servername = "localhost"; // 資料庫主機名稱 (若在本地 XAMPP 通常是 localhost)
$username = "您的資料庫用戶名"; // 請替換為您的 MariaDB/MySQL 用戶名
$password = "您的資料庫密碼"; // 請替換為您的 MariaDB/MySQL 密碼
$dbname = "cakes_shop_db"; // 您在步驟 2.a 中建立的資料庫名稱

// 創建連線
$conn = new mysqli($servername, $username, $password, $dbname);

// 檢查連線
if ($conn->connect_error) {
    die("連線失敗: " . $conn->connect_error);
}
// 設定字元集為 UTF-8，以避免中文亂碼
$conn->set_charset("utf8");
?>
```
4. 網頁伺服器設定 (Apache)：
  - 如果您使用 XAMPP，請將整個專案資料夾 (python-ver.3.12.7 或您專案的名稱) 放置到 XAMPP 的 htdocs 目錄下。
  - 本專案沒有特定的 Apache .htaccess 檔案或虛擬主機配置需求，預設的 Apache 設定即可運行。
5. 前端依賴 (無需額外安裝)：
  - 本專案的 Vue.js 和 Axios 均透過 CDN (內容傳遞網路) 載入，無需 Node.js 環境或 npm/yarn 等前端建置工具。確保網路連線暢通即可。

---
# 🖥️ 使用指南
一旦成功部署並設定好資料庫，您可以透過以下步驟開始使用甜點線上商城：
1. 訪問網站：
  在您的瀏覽器中輸入以下 URL 訪問網站：
  [http://sugars.byethost5.com/project01_cloud/index.php](http://sugars.byethost5.com/project01_cloud/)

2. 註冊新會員：

  - 首次使用的用戶，請點擊網站上的「註冊」鏈接，填寫必要的資訊來創建一個新帳戶。
  - 重要提示： 為了您的隱私安全，在註冊過程中不需要填寫任何真實的個人資料，例如真實姓名、地址、電話或電子郵件。本網站僅為展示目的，您的輸入不會被用於任何商業用途，但請自行承擔因提供個人資料可能帶來的風險。
3. 登入：
  註冊後，使用您剛創建的用戶名和密碼登入。

4. 購物車與結帳：
  - 登入後，您可以瀏覽甜點商品並將其加入購物車。
  - 只有在註冊並登入後，才能夠進入購物車進行結帳流程。
5. 追蹤訂單：
  - 成功結帳後，您可以在會員頁面或相關區域查詢您的歷史訂單和訂單狀態。

---
# 📁 重要檔案或資料夾
- `Connection/conn_db.php`：此為資料庫連線設定檔案，需手動建立並配置。
- `expstore.sql`：包含資料庫結構和必要的靜態參考數據的 SQL 腳本。
