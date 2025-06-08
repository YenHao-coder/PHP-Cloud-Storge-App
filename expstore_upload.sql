-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-06-05 08:20:27
-- 伺服器版本： 10.1.38-MariaDB
-- PHP 版本： 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `expstore`
--

-- --------------------------------------------------------

--
-- 資料表結構 `addbook`
--

CREATE TABLE `addbook` (
  `addressid` int(10) NOT NULL COMMENT '地址ID',
  `setdefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT '預設收件人',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者姓名',
  `mobile` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件者電話',
  `myzip` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '郵遞區號',
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件地址',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `addbook`
--

-- --------------------------------------------------------

--
-- 資料表結構 `carousel`
--

CREATE TABLE `carousel` (
  `caro_id` int(3) NOT NULL COMMENT '輪播編號',
  `caro_title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '輪播標題',
  `caro_content` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '輪播內容介紹',
  `caro_online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上下架',
  `caro_sort` int(3) NOT NULL COMMENT '輪播排序',
  `caro_pic` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '輪播圖檔名稱',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `carousel`
--

INSERT INTO `carousel` (`caro_id`, `caro_title`, `caro_content`, `caro_online`, `caro_sort`, `caro_pic`, `p_id`, `create_date`) VALUES
(1, '喜餅試吃_結婚禮盒推薦_喜糖推薦', NULL, 1, 1, 'car01.jpg', 16, '2025-05-10 12:21:13'),
(2, '牛軋糖_烏結糖_台灣手信', NULL, 1, 2, 'car02.jpg', 31, '2025-05-10 12:21:13'),
(3, '母親節蛋糕推薦', NULL, 0, 3, 'car03.jpg', 63, '2025-05-10 12:21:13'),
(4, '台灣伴手禮_零食甜點推薦', NULL, 1, 4, 'car04.jpg', 48, '2025-05-10 12:21:13'),
(5, '蛋糕買5贈1_甜點推薦_彌月禮盒推薦', NULL, 1, 5, 'car05.jpg', 66, '2025-05-10 12:21:13');

-- --------------------------------------------------------

--
-- 資料表結構 `cart`
--

CREATE TABLE `cart` (
  `cartid` int(10) NOT NULL COMMENT '購物車編號',
  `emailid` int(10) DEFAULT NULL COMMENT '會員編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `qty` int(3) NOT NULL COMMENT '產品數量',
  `orderid` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '訂單編號',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `ip` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂購者的IP',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入購物車時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `cart`
--

-- --------------------------------------------------------

--
-- 資料表結構 `city`
--

CREATE TABLE `city` (
  `AutoNo` int(10) NOT NULL COMMENT '城市編號',
  `Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市名稱',
  `cityOrder` tinyint(2) NOT NULL COMMENT '標記',
  `State` smallint(6) NOT NULL COMMENT '狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `city`
--

INSERT INTO `city` (`AutoNo`, `Name`, `cityOrder`, `State`) VALUES
(1, '臺北市', 0, 0),
(2, '基隆市', 0, 0),
(3, '新北市', 0, 0),
(4, '宜蘭縣', 0, 0),
(5, '新竹市', 0, 0),
(6, '新竹縣', 0, 0),
(7, '桃園市', 0, 0),
(8, '苗栗縣', 0, 0),
(9, '台中市', 0, 0),
(10, '彰化縣', 0, 0),
(11, '南投縣', 0, 0),
(12, '雲林縣', 0, 0),
(13, '嘉義市', 0, 0),
(14, '嘉義縣', 0, 0),
(15, '台南市', 0, 0),
(16, '高雄市', 0, 0),
(17, '南海諸島', 0, 0),
(18, '澎湖縣', 0, 0),
(19, '屏東縣', 0, 0),
(20, '台東縣', 0, 0),
(21, '花蓮縣', 0, 0),
(22, '金門縣', 0, 0),
(23, '連江縣', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `hot`
--

CREATE TABLE `hot` (
  `h_id` int(3) NOT NULL COMMENT '熱銷商品流水號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `h_sort` int(3) DEFAULT NULL COMMENT '熱銷商品排名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `hot`
--

INSERT INTO `hot` (`h_id`, `p_id`, `h_sort`) VALUES
(1, 12, 1),
(2, 60, 2),
(3, 66, 3);

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `emailid` int(11) NOT NULL COMMENT 'email流水號',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email帳號',
  `pw1` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密碼',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否啟動',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '中文姓名',
  `tssn` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '身份證字號',
  `birthday` date NOT NULL COMMENT '生日',
  `imgname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '相片檔名',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `member`
--

-- --------------------------------------------------------

--
-- 資料表結構 `multiselect`
--

CREATE TABLE `multiselect` (
  `msid` int(5) NOT NULL COMMENT '多功能選擇ID',
  `mslevel` int(2) NOT NULL COMMENT '多功能選擇層級',
  `msuplink` int(4) NOT NULL COMMENT '上層連結',
  `opcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛參數',
  `msname` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '多功能選擇名稱',
  `msort` int(11) DEFAULT NULL COMMENT '各功能列表排序',
  `url1` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛網址1',
  `url2` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '外掛網址2',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `multiselect`
--

INSERT INTO `multiselect` (`msid`, `mslevel`, `msuplink`, `opcode`, `msname`, `msort`, `url1`, `url2`, `create_date`, `update_date`) VALUES
(1, 1, 0, NULL, '付款方式', 0, NULL, NULL, '2023-08-11 09:46:53', '2023-08-17 03:42:28'),
(2, 1, 0, NULL, '訂單處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(3, 2, 1, NULL, '貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:37'),
(4, 2, 1, NULL, '信用卡付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:43:54'),
(5, 2, 1, NULL, '銀行轉帳', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:37'),
(6, 2, 1, NULL, '電子支付', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-08-17 03:44:51'),
(7, 2, 2, NULL, '處理中', 1, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:03'),
(8, 2, 2, NULL, '待出貨', 2, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:32'),
(9, 2, 2, NULL, '運送中', 3, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:45:45'),
(10, 2, 2, NULL, '收貨完成', 4, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:10'),
(11, 2, 2, NULL, '退貨中', 5, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:24'),
(12, 2, 2, NULL, '已關閉訂單', 6, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 03:46:35'),
(13, 2, 2, NULL, '無效訂單', 7, NULL, NULL, '2023-08-11 10:06:42', '2023-08-17 05:39:26'),
(14, 2, 2, NULL, '訂單確認', 8, NULL, NULL, '2023-08-18 06:13:47', '2023-10-23 12:37:36'),
(15, 2, 2, NULL, '平台出貨', 9, NULL, NULL, '2023-08-18 06:13:47', '2023-10-25 08:29:31'),
(34, 1, 0, NULL, '付款處理狀態', 0, NULL, NULL, '2023-08-11 09:52:29', '2023-08-17 03:42:41'),
(35, 2, 34, NULL, '侍貨到付款', 1, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(36, 2, 34, NULL, '完成付款', 2, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(37, 2, 34, NULL, '未完成付款', 3, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12'),
(38, 2, 34, NULL, '貨到付款已完成', 4, NULL, NULL, '2023-08-11 09:55:45', '2023-10-25 08:39:12');

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `p_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '產品名稱',
  `p_intro` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '產品簡介',
  `p_price` int(11) DEFAULT NULL COMMENT '產品單價',
  `p_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上架',
  `p_content` text COLLATE utf8_unicode_ci COMMENT '產品詳細規格',
  `p_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '產品輸入日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(12, 41, '芝士鳳梨酥禮盒', '用兩種不同酸甜特性的鳳梨依比例調配，再拌入冬瓜醬，所熬煮出來的鳳梨醬不僅風味佳，口感更是Q軟且有果粒喔！', 486, 1, '<div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n    <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n    <div>\r\n        <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></h2>\r\n        <div>\r\n            <div>\r\n                <ol>\r\n                    <li><span style=\"font-size: medium;\">比利時ITQI絕佳風味獎</span></li>\r\n                </ol>\r\n            </div>\r\n            <div style=\"color: rgb(250, 92, 139);\">\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n            </div>\r\n        </div>\r\n    </div>\r\n    <p></p>\r\n    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span><span style=\"font-size: medium;\">18.2×</span><span style=\"font-size: medium;\">29.8</span><span style=\"font-size: medium;\">×</span><span style=\"font-size: medium;\">4.5cm</span><span style=\"font-size: medium;\">(</span><span style=\"font-size: medium;\">長</span><span style=\"font-size: medium;\">×</span><span style=\"font-size: medium;\">寬</span><span style=\"font-size: medium;\">×</span><span style=\"font-size: medium;\">高)</span><span style=\"font-size: medium;\"><br></span></p>\r\n    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：30天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">更多說明</span><br>建議在食用前，可放入烤箱加熱後食用，風味更佳！</span></p>\r\n    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67ecadfd925ea0000ec59a0f/original.JPG?1743564284\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">營養成分</span></span><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">說明(點擊可查看)</span></a><span style=\"font-size: medium;\"><br></span></p>\r\n    <div><span style=\"font-size: medium;\"><br></span></div>\r\n    <div><br>\r\n    </div>\r\n</div>', '2025-05-10 05:32:33'),
(16, 41, '太妃牛軋糖經典包', '咬下口感Q彈，奶香與焦糖交織出濃郁的香氣，搭配飽滿的加州杏仁果，層次豐富，令人忍不住嘴角上揚！', 520, 1, '<div class=\"ProductDetail-description accordion-item\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block; height: 1231px; padding-top: 0px; margin-top: 0px; padding-bottom: 18px; margin-bottom: 0px;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></h2>\r\n            <div>\r\n                <div>\r\n                    <ol>\r\n                        <li><span style=\"font-size: medium;\">比利時ITQI絕佳風味獎</span></li>\r\n                        <li><span style=\"font-size: medium;\">獲選「臺北國際花卉博覽會」大會指定伴手禮</span></li>\r\n                        <li><span style=\"font-size: medium;\">獲選「台中市十大伴手禮首獎」</span></li>\r\n                        <li><span style=\"font-size: medium;\">獲選「全世界最好吃零食 TOP 10 」</span></li>\r\n                        <li><span style=\"font-size: medium;\">獲選「來台必買伴手禮 TOP 1 」</span></li>\r\n                        <li><span style=\"font-size: medium;\">金馬獎指定糖村伴手禮</span></li>\r\n                        <li><span style=\"font-size: medium;\">網路票選臺灣「十大伴手禮」</span></li>\r\n                        <li><span style=\"font-size: medium;\">網友狂洗IG的夢幻伴手禮</span></li>\r\n                        <li><span style=\"font-size: medium;\">台灣旅遊大資料-全台十大人氣美食商戶TOP1</span></li>\r\n                        <li><span style=\"font-size: medium;\">台灣觀光局觀光節慶祝大會 唯一指定伴手禮</span></li>\r\n                    </ol>\r\n                </div>\r\n                <div style=\"color: rgb(250, 92, 139);\">\r\n                    <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                </div>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">「超人氣夢幻牛軋糖」的秘密?</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\"><br></span></span><span style=\"font-size: medium; font-weight: bold;\">★</span><span style=\"font-size: medium; font-weight: bold;\">嚴選純粹的原料</span><span style=\"font-size: medium;\">&nbsp;– 採用優質法國牛奶製成的奶油，雖然少了香精，讓香氣無法長久維持，但更吃得到醇濃奶香。</span><br><span style=\"font-size: medium; font-weight: bold;\">★</span><span style=\"font-size: medium; font-weight: bold;\">火侯的精準掌握</span><span style=\"font-size: medium;\">&nbsp;– 嚴選飽滿的美國A+杏仁果，低溫烘烤三小時後，再高溫烘烤鎖住色澤與香氣。讓杏仁果色澤金黃飽滿、香氣濃郁。</span><br><span style=\"font-size: medium; font-weight: bold;\">★</span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">時間的精算控制</span>&nbsp;– 煮糖溫度與時間控制的恰到好處，讓牛軋糖軟硬適中、充滿Q彈口感。<br></span><span style=\"font-size: medium; font-weight: bold;\">這就是糖村超人氣夢幻牛軋糖!</span><span style=\"font-size: medium;\"><br></span></p>\r\n            </div>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium; color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br><span style=\"font-size: medium;\">15.5</span><span style=\"font-size: medium;\">x21.8×</span><span style=\"font-size: medium;\">7.8</span><span style=\"font-size: medium;\">cm(長×</span><span style=\"font-size: medium;\">寬</span><span style=\"font-size: medium;\">×</span><span style=\"font-size: medium;\">高)</span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：65天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n        <div>\r\n            <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span><span style=\"color: rgb(187, 35, 14); font-size: medium; font-weight: bold;\">★圖片僅供參考，因杏仁、草莓、蔓越莓乾等農產品大小無法完全相同，產品皆於標準作業下依所標示重量提供為主。</span><br style=\"color: rgb(187, 35, 14);\"><span style=\"font-size: medium;\">★糖村牛軋糖堅持不加固化劑、防腐劑，因此產品會隨放置地點的溫度而改變產品外形及軟硬度；溫度低則會變硬易碎，這是正常物理現象，請放心食用。<span lang=\"EN-US\"><br></span></span>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\">★</span><span style=\"font-size: medium;\">建議冷藏保存，由冰箱取出後，請置於常溫<span lang=\"EN-US\">5-10</span>分鐘後，即可品嚐！</span><br></p>\r\n        </div>\r\n        <div></div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/6819dcbf9d0a4d0011a9eb56/original.JPG?1746525375\" style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">營養成分說明(點擊可查看)</a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n\r\n    </div>\r\n</div>', '2025-05-10 05:35:45'),
(31, 42, '繽紛花賞', '內容物：\r\n❶法式牛軋糖12入\r\n❷蔓越莓多多牛軋糖12入\r\n❸經典原味太陽餅4入\r\n❹芝士鳳梨酥6入\r\n❺牛軋餅-蔥鹽風味6入', 1110, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></h2>\r\n        <div>\r\n            <div>\r\n                <ol>\r\n                    <li><span style=\"font-size: medium;\">比利時ITQI絕佳風味獎</span></li>\r\n                    <li><span style=\"font-size: medium;\">獲選「台中市十大伴手禮首獎」</span></li>\r\n                    <li><span style=\"font-size: medium;\">獲選「全世界最好吃零食 TOP 10 」</span></li>\r\n                    <li><span style=\"font-size: medium;\">獲選「來台必買伴手禮 TOP 1 」</span></li>\r\n                    <li><span style=\"font-size: medium;\">網路票選臺灣「十大伴手禮」</span></li>\r\n                    <li><span style=\"font-size: medium;\">網友狂洗IG的夢幻伴手禮</span></li>\r\n                    <li><span style=\"font-size: medium;\">台灣旅遊大資料-全台十大人氣美食商戶TOP1</span></li>\r\n                    <li><span style=\"font-size: medium;\">台灣觀光局觀光節慶祝大會 唯一指定伴手禮</span></li>\r\n                </ol>\r\n            </div>\r\n            <div style=\"color: rgb(250, 92, 139);\">\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n            </div>\r\n        </div>\r\n        <p class=\"MsoNormal\"><span><span lang=\"EN-US\"></span></span></p>\r\n        <p class=\"MsoNormal\"><span style=\"font-family: 新細明體, serif;\"><span lang=\"EN-US\"></span></span></p>\r\n        <p class=\"MsoNormal\"><span style=\"font-family: 新細明體, serif;\"><span lang=\"EN-US\"></span></span></p>\r\n        <p class=\"MsoNormal\"><span lang=\"EN-US\"></span></p>\r\n        <div style=\"margin-bottom: 7.5pt;\">\r\n            <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">產品特色<br></span></span><span style=\"font-size: medium;\">★</span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">法式牛軋糖：</span>嚴選飽滿香脆的杏仁果，口感Q彈不黏牙，</span><span style=\"font-size: medium;\">散發出濃濃奶香味，男女老少都喜歡！<br></span><span style=\"font-weight: bold; font-size: medium;\">★蔓越莓多多</span><span style=\"font-size: medium; font-weight: 700;\">牛軋糖</span><span style=\"font-size: medium; font-weight: bold;\">：</span><span style=\"font-size: medium;\">紅寶石般色澤的蔓越莓，與不黏牙且Q彈的夢幻牛軋糖搭配，酸酸甜甜、不甜不膩的口感，讓人食指大動！</span><br><span style=\"font-size: medium;\">★<span style=\"font-weight: bold;\">經典原味太陽餅</span></span><span style=\"font-size: medium; font-weight: bold;\">：</span><span style=\"font-size: medium;\">師傅層層疊疊的製餅真功夫，成就了香酥餅皮，滿口甜蜜的麥芽內餡，加入獨家配方，奶香濃郁不甜膩！</span><br><span style=\"font-size: medium;\">★</span><span style=\"font-size: medium; font-weight: bold;\">芝士</span><span style=\"font-size: medium; font-weight: 700;\">鳳梨酥</span><span style=\"font-size: medium; font-weight: bold;\">：</span><span style=\"font-size: medium;\">特調的鳳梨醬，用兩種不同酸甜特性的鳳梨依比例調配，再拌入冬瓜醬，所熬煮出來的鳳梨醬不僅風味佳，口感更是Q軟且有果粒喔！製作方式則是遵循阿嬤的古法製作，但又突破傳統，在酥皮中加入帕瑪森芝士，以慢火烘烤至淡淡的焦褐色，才能將芝士的香、酥、濃與鳳梨餡的滋味搭配至最高境界，彷彿同時悠遊在台灣與義大利的天空！</span><span style=\"font-size: medium;\"><br></span><span style=\"font-size: medium; font-weight: bold;\">★</span><span style=\"font-size: medium; font-weight: 700;\">牛軋餅-蔥鹽風味</span><span style=\"font-size: medium; font-weight: bold;\">：</span><span style=\"font-size: medium;\">微鹹的香蔥蘇打餅乾，軟Q內餡、滑順奶香、富有層次的酥脆感，一片接一片的微甜鹹滋味。</span>\r\n        </div>\r\n        <p class=\"MsoNormal\"><span><span lang=\"EN-US\"></span></span></p>\r\n        <p class=\"MsoNormal\"><span><span lang=\"EN-US\"></span></span></p>\r\n        <p class=\"MsoNormal\"><span><span lang=\"EN-US\"></span></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">尺寸規格</span><br>32.5x36.7x7cm(長×寬×高)<br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：牛軋糖65天內 / 太陽餅45天內 /</span><span style=\"font-size: medium;\">&nbsp;鳳梨酥30天內 /</span><span style=\"font-size: medium;\">&nbsp;牛軋餅25天內</span><span style=\"font-size: medium;\"><br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span></p>\r\n        <div>\r\n            <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br>★糖村牛軋糖堅持不加固化劑、防腐劑，因此產品會隨放置地點的溫度而改變產品外形及軟硬度；溫度低則會變硬易碎，這是正常物理現象，請放心食用。<span lang=\"EN-US\"><br></span></span>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\">★牛軋糖建議冷藏保存，由冰箱取出後，請置於常溫<span lang=\"EN-US\">5-10</span>分鐘後，即可品嚐！</span></p>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/6819cdbb72a499000d02c92a/original.jpg?1746521531\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n    </div>\r\n</div>', '2025-05-10 05:48:35'),

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES

(41, 43, '餅乾野餐盒', '內容物：\r\n❶貝比曲奇-奶香隨享包3入\r\n❷貝比曲奇-咖啡隨享包3入', 510, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div style=\"color: rgb(250, 92, 139);\">\r\n            <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></h2>\r\n            <div style=\"color: rgb(85, 85, 85);\">\r\n                <ol>\r\n                    <li><span style=\"font-size: medium;\">部落客強力推薦</span></li>\r\n                </ol>\r\n            </div>\r\n            <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n        </div>\r\n        <p></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span lang=\"EN-US\" style=\"font-size: medium;\"></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">產品特色<br></span><span style=\"font-weight: bold;\"><span style=\"font-size: medium;\">★</span></span><span style=\"font-size: medium; font-weight: 700;\">貝比曲奇-</span><span style=\"font-weight: bold;\"><span style=\"font-size: medium;\">特濃奶香：</span></span><span style=\"font-size: medium;\">給您最忠於原味的純粹，堅持不使用人工奶油、不加一滴水、恆溫恆濕空間製成，將所有精華鎖在餅乾本體內。讓您欲罷不能的一口接著一口，深陷其中，無法忘懷這迷人的幸福滋味。<br></span><span style=\"font-weight: bold;\"><span style=\"font-size: medium;\">★</span></span><span style=\"font-size: medium; font-weight: 700;\">貝比曲奇-香草咖啡</span><span style=\"font-weight: bold;\"><span style=\"font-size: medium;\">：</span></span><span style=\"font-size: medium;\">馥郁咖啡、優雅韻味，一口接一口回味無窮。研磨阿拉比卡極品咖啡豆與香草莢精華，完美融入貝比曲奇，風味優雅、香氣四溢，令人陶醉！</span></p>\r\n        <p class=\"MsoNormal\"><span style=\"font-family:&quot;新細明體&quot;,&quot;serif&quot;;\"><span lang=\"EN-US\"></span></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span><span style=\"font-size: medium;\">15.6</span><span style=\"font-size: medium;\">x22.4</span><span style=\"font-size: medium;\">x</span><span style=\"font-size: medium;\">15.5cm</span><span style=\"font-size: medium;\">(長×寬×高)&nbsp;&nbsp;</span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：45天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n        <div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\">★咖啡曲奇餅乾上的深色顆粒，是提升口感與風味層次之製作方式，屬正常原物料呈現，請安心食用</span></p>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67d15107543024000b621063/original.JPG?1741771014\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 06:03:47'),

INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES

(48, 44, '草莓牛軋糖禮盒', '內容物：\r\n❶草莓牛軋糖 252g\r\n\r\n滿口香濃的草莓香味，搭配草莓製成的果乾，充滿著滿滿的幸福香濃滋味！', 498, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div>\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></h2>\r\n                <div>\r\n                    <ol>\r\n                        <li><span style=\"font-size: medium;\">網友狂洗IG的夢幻伴手禮獎</span></li>\r\n                    </ol>\r\n                </div>\r\n            </div>\r\n            <div style=\"color: rgb(250, 92, 139);\">\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n            </div>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">「超人氣夢幻牛軋糖」的秘密?</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\"><br></span></span><span style=\"font-size: medium; font-weight: bold;\">★</span><span style=\"font-size: medium; font-weight: bold;\">嚴選純粹的原料</span><span style=\"font-size: medium;\">&nbsp;– 採用優質法國牛奶製成的奶油，雖然少了香精，讓香氣無法長久維持，但更吃得到醇濃奶香。</span><br><span style=\"font-size: medium; font-weight: bold;\">★</span><span style=\"font-size: medium; font-weight: bold;\">火侯的精準掌握</span><span style=\"font-size: medium;\">&nbsp;– 嚴選飽滿的美國A+杏仁果，低溫烘烤三小時後，再高溫烘烤鎖住色澤與香氣。讓杏仁果色澤金黃飽滿、香氣濃郁。</span><br><span style=\"font-size: medium; font-weight: bold;\">★</span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">時間的精算控制</span>&nbsp;– 煮糖溫度與時間控制的恰到好處，讓牛軋糖軟硬適中、充滿Q彈口感。<br></span><span style=\"font-size: medium; font-weight: bold;\">這就是糖村超人氣夢幻牛軋糖!</span><span style=\"font-size: medium;\"><br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium; color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br><span style=\"font-size: medium;\">17x18.9x5cm(長×寬×高)</span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：65天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">更多說明</span><br></span><span style=\"color: rgb(187, 35, 14); font-size: medium; font-weight: bold;\">★圖片僅供參考，因杏仁、草莓、蔓越莓乾等農產品大小無法完全相同，產品皆於標準作業下依所標示重量提供為主。</span><br style=\"color: rgb(187, 35, 14);\"><span style=\"font-size: medium;\">★</span><span style=\"font-size: medium;\">糖村牛軋糖堅持不加固化劑、防腐劑，因此產品會隨放置地點的溫度而改變產品外形及軟硬度；溫度低則會變硬易碎，這是正常物理現象，請放心食用。<span lang=\"EN-US\"><br></span></span><span style=\"font-size: medium;\">★</span><span style=\"font-size: medium;\">建議冷藏保存，由冰箱取出後，請置於常溫<span lang=\"EN-US\">5-10</span>分鐘後，即可品嚐！<br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span lang=\"EN-US\" style=\"font-size: medium;\"></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/681b274f7a3d56000acc87e6/original.JPG?1746609999\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點入可查看)</a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 06:48:13'),
(56, 47, '法式泡芙蛋糕', '搗碎的杏仁糖中和烤過的千層派皮，鹹香的外圍使用法式奶油霜和杏仁片裝飾，呈現派皮和柔軟的雙重口感！\r\n\r\n✦2019蘋果日報 母親節蛋糕評比創新類【亞軍】\r\n評審：乳香自然，口感多樣，奶油香，奶餡柔順，造型可愛。\r\n\r\n★貼心提醒★\r\n1. 『只購買含運組』的商品，請選擇送貨方式:(含運)台灣本島宅配-冷凍\r\n2. 如需一起訂購其他商品，請選擇送貨方式:台灣本島宅配-冷凍', 1040, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></h2>\r\n            <div style=\"color: rgb(85, 85, 85); font-size: 14px;\">\r\n                <div>\r\n                    <ol>\r\n                        <li><span style=\"font-size: medium;\">&nbsp;「母親節蛋糕評比」亞軍</span></li>\r\n                    </ol>\r\n                </div>\r\n                <div style=\"color: rgb(250, 92, 139);\"></div>\r\n            </div>\r\n            <h2 style=\"box-sizing: border-box; font-family: &quot;Open Sans&quot;, Arial; font-weight: 400; line-height: 1.1; color: rgb(0, 142, 221); margin: 5px 0px 20px; font-size: 16px; padding: 15px; display: block; border-bottom: 1px solid rgb(221, 221, 221);\"><span style=\"box-sizing: border-box; color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n            <p></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n        </div>\r\n        <div>\r\n            <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span></div>\r\n            <div><span style=\"font-size: medium;\">6吋/8吋</span></div>\r\n            <div>\r\n                <div>\r\n                    <span style=\"font-size: medium; font-weight: bold; color: rgb(187, 35, 14);\">★此為6吋參考示意圖，蛋糕隨尺寸不同，裝飾量隨之調整</span><br>\r\n                </div>\r\n            </div>\r\n            <div><span style=\"font-size: medium; font-weight: bold; color: rgb(187, 35, 14);\"><br></span></div>\r\n            <div>\r\n                <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium; font-weight: bold; color: rgb(187, 35, 14);\"></span>\r\n            </div>\r\n            <div><span style=\"font-size: medium;\"><br></span></div>\r\n            <div>\r\n                <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明<br></span></span>\r\n                <div>\r\n                    <span style=\"color: rgb(187, 35, 14); font-size: medium;\">★</span><span style=\"color: rgb(187, 35, 14); font-weight: bold; font-size: medium;\">週一無法到貨，請選擇週二到週五到貨</span><br>\r\n                </div>\r\n                <div><span style=\"font-size: medium;\">★為維護運送品質，圓模蛋糕宅配以一箱裝一顆運送，故不列入免運計算<br></span></div>\r\n            </div>\r\n            <div>\r\n                <span style=\"font-size: medium;\">★</span><span style=\"font-size: medium;\">此款蛋糕內含派皮夾層，分食時建議使用長型料理刀或麵包鋸齒刀</span><span style=\"font-size: medium;\"><br></span>\r\n            </div>\r\n            <div>\r\n                <span style=\"font-size: medium;\"><br></span><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。</span><span style=\"font-size: medium;\"><br></span>\r\n            </div>\r\n            <div><span style=\"font-size: medium;\"><br></span></div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67ecc9529c0f9f000b11605e/original.JPG?1743571281\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n        </div>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:30:11'),
(57, 47, '鳳蘋優格湯種蛋糕', '✦輕柔蛋糕、微酸果醬、爽口香緹奶油的輕快口感✦\r\n採用新的技術，呈現完美比例新口感蛋糕，內餡選用台灣在地鳳梨、蘋果、檸檬汁及進口香草莢細熬慢煮，製成微酸口感果醬，搭配自製優格香緹奶油，清爽不甜膩的口感，就像漫步在雲端般的輕快。\r\n\r\n★貼心提醒★\r\n1. 『只購買含運組』的商品，請選擇送貨方式:(含運)台灣本島宅配-冷凍\r\n2. 如需一起訂購其他商品，請選擇送貨方式:台灣本島宅配-冷凍', 1320, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n        <p></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span></div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\">7.5吋</span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"><br><br></span><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明<br></span></span><span style=\"color: rgb(187, 35, 14); font-size: medium;\">★</span><span style=\"color: rgb(187, 35, 14); font-size: medium; font-weight: bold;\">週一無法到貨，請選擇週二到週五到貨</span><br><span style=\"font-size: medium;\">★為維護運送品質，圓模蛋糕宅配以一箱裝一顆運送，故不列入免運計算<br></span><span style=\"font-size: medium;\">★使用現切鳳梨，隨採收季節色澤、風味略有差異，屬正常現象，請安心食用</span><br><br></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。</span><span style=\"font-size: medium;\"><br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67ecc952a2b4c400116cf732/original.JPG?1743571281\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:34:27');
INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(58, 47, '焦糖核桃瑪奇朵慕斯', '入口即化的焦糖瑪奇朵慕斯，與蘭姆葡萄融合的恰如其分，完美增添蛋糕的層次風味，上層佐以手炒焦糖核桃與滑順綿密的白巧克力奶霜，香氣馥郁且甜而不膩，每一口都吃的到核桃的酥脆口感，愈嚼愈散發焦香，十足令人難忘的甜蜜滋味。\r\n\r\n★貼心提醒★\r\n1. 『只購買含運組』的商品，請選擇送貨方式:(含運)台灣本島宅配-冷凍\r\n2. 如需一起訂購其他商品，請選擇送貨方式:台灣本島宅配-冷凍', 990, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div>\r\n                <div style=\"color: rgb(250, 92, 139);\">\r\n                    <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                </div>\r\n            </div>\r\n            <p></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n        </div>\r\n        <div>\r\n            <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span></div>\r\n            <div><span style=\"font-size: medium;\">6吋/7.5吋</span></div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold; color: rgb(187, 35, 14);\">★此為6吋參考示意圖，蛋糕隨尺寸不同，裝飾量隨之調整</span><br></span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n            <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n            <div><span style=\"color: rgb(187, 35, 14);\"><span style=\"font-size: medium;\">★</span><span style=\"font-weight: bold; font-size: medium;\">週一無法到貨，請選擇週二到週五到貨</span></span></div>\r\n            <div><span style=\"font-size: medium;\">★為維護運送品質，圓模蛋糕宅配以一箱裝一顆運送，故不列入免運計算<br></span></div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><br></span><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。<br></span><span style=\"font-size: medium;\"><br></span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/66b4527cb96b8789f1814ce6/original.JPG?1723093628\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">營養成分</span></span><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">說明(點擊可查看)</span></a></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n        </div>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:34:27'),
(59, 47, '生乳波士頓派萊姆青檸', '特調凝乳和霜降披覆於清新奶餡，檸檬果香與濃郁奶霜交織，在舌尖一觸即發，細膩點綴你的味蕾！', 620, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div style=\"color: rgb(250, 92, 139);\">\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n            </div>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span></div>\r\n        <div><span style=\"font-size: medium;\">7吋</span></div>\r\n        <div><span style=\"font-size: medium;\"><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：5天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"><br><br></span>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium; color: rgb(187, 35, 14);\">★</span><span style=\"font-weight: bold; font-size: medium;\"><span style=\"color: rgb(187, 35, 14);\">週一無法到貨，請選擇週二到週五到貨<br></span><br></span>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。<br></span><span style=\"font-size: medium;\"><br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67bd82ddbc0f66000f80ea6e/original.JPG?1740473053\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:41:44'),
(60, 47, '生乳波士頓派芝麻舞鶴鐵觀音', '嚴選日式純黑芝麻與花蓮舞鶴鐵觀音茶，以濃郁芝麻蛋糕為基底，伴隨鐵觀音甘醇茶香入餡，入口即可感受到滑順芝麻奶霜的迷人香氣與清新細緻茶韻，給您微甜不膩的優雅大人味！', 620, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div style=\"color: rgb(250, 92, 139);\">\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n            </div>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span></div>\r\n        <div><span style=\"font-size: medium;\">7吋<br><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：5天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"><br><br></span>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium; color: rgb(187, 35, 14);\">★</span><span style=\"font-weight: bold; font-size: medium;\"><span style=\"color: rgb(187, 35, 14);\">週一無法到貨，請選擇週二到週五到貨<br></span><br></span>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。<br></span><span style=\"font-size: medium;\"><br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67c9519f4ce7a9000ef58b1e/original.JPG?1741246879\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:41:44'),
(61, 47, '生乳波士頓派芋泥布蕾 ', '✦芋見最經典的美味✦\r\n中間夾層是鮮奶油搭配鮮乳製成的芋泥香草布蕾，入口即可感受到芋泥綿密的口感與布蕾的Q彈，接著迸出滑順香緹鮮奶油及蛋糕體的細緻蛋香，口感輕盈不膩，絕妙的好滋味令人印象深刻！\r\n', 480, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div style=\"color: rgb(250, 92, 139);\">\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n            </div>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span></div>\r\n        <div><span style=\"font-size: medium;\">7吋</span></div>\r\n        <div><span style=\"font-size: medium;\"><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：5天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"><br><br></span>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium; color: rgb(187, 35, 14);\">★</span><span style=\"font-weight: bold; font-size: medium;\"><span style=\"color: rgb(187, 35, 14);\">週一無法到貨，請選擇週二到週五到貨</span></span>\r\n        </div>\r\n        <div>\r\n            <span style=\"font-size: medium;\">★因表面的紫薯粉為天然農作物，會隨季節採收而有不同色澤，出現色差屬正常現象，請安心食用</span><br><br>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。<br></span><span style=\"font-size: medium;\"><br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67ecc952266533000cba0bb4/original.JPG?1743571282\"><span style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</span><br></a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:45:53'),
(62, 47, '生乳波士頓派法式香緹', '有別於一般的波士頓派，中間夾層以北海道奶霜和法國鮮奶油研製而成的生乳餡，一入口立即能感受到濃濃奶香和綿細蛋糕體在嘴裡化開，口感輕盈不膩，奶香迷人，好吃不膩口！\r\n', 480, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div style=\"color: rgb(250, 92, 139);\">\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt; color: rgb(85, 85, 85); font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n            </div>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">尺寸規格</span><br></span></div>\r\n        <div><span style=\"font-size: medium;\">7吋<br><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：5天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"><br><br></span>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium; color: rgb(187, 35, 14);\">★</span><span style=\"font-weight: bold; font-size: medium;\"><span style=\"color: rgb(187, 35, 14);\">週一無法到貨，請選擇週二到週五到貨<br></span><br></span>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。<br></span><span style=\"font-size: medium;\"><br></span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67ecc95230477d000de72c4c/original.JPG?1743571282\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><br></p>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:45:53'),
(63, 46, '櫻桃優格布朗尼蛋糕', '6吋：920元\r\n7.5吋：1320元\r\n12吋：2500元\r\n\r\n低脂櫻桃優格的酸甜，搭配巧克力布朗尼的濃郁，交織出一道美味幸福的時光!\r\n\r\n※本產品為台灣以下限定門市訂購與取貨，無宅配服務※\r\n1.台北敦南店  \r\n2.竹北自強店  \r\n3.台中崇德店 \r\n若想購買，請聯絡我們', 1320, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div style=\"color: rgb(250, 92, 139);\">\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n            </div>\r\n            <div>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n            </div>\r\n            <div><span style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">尺寸規格</span></div>\r\n            <div>\r\n                <span style=\"font-size: medium;\">6吋/7.5吋</span><span style=\"font-size: medium;\">/12吋</span><br><span style=\"font-size: medium; color: rgb(187, 35, 14); font-weight: bold;\">★此為參考示意圖，蛋糕隨尺寸不同，裝飾量隨之調整</span><br>\r\n            </div>\r\n            <div><span style=\"font-size: medium; color: rgb(187, 35, 14); font-weight: bold;\"><br></span></div>\r\n            <div>\r\n                <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium; color: rgb(187, 35, 14); font-weight: bold;\"></span>\r\n            </div>\r\n            <div><span style=\"font-size: medium;\"><br></span></div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67ecc9521b1d9c000fda71e1/original.JPG?1743571282\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n        </div>\r\n        <div><br></div>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:50:31'),
(64, 46, '黑森林蛋糕', '4吋：520元(暫停供應)\r\n6吋：790元\r\n8吋：1220元\r\n12吋：2500元\r\n\r\n酸甜的櫻桃醬，再加上白蘭地酒香，使蛋糕出現對比強烈的獨特口味，是成熟女性的最佳選擇!\r\n\r\n※本產品為台灣以下限定門市訂購與取貨，無宅配服務※\r\n1.台北敦南店  \r\n2.竹北自強店  \r\n3.台中崇德店\r\n若想購買，請聯絡我們 \r\n', 1220, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div style=\"color: rgb(250, 92, 139);\">\r\n            <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n        </div>\r\n        <div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n        </div>\r\n        <div><span style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\"><br></span></div>\r\n        <div><span style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">尺寸規格</span></div>\r\n        <div>\r\n            <span style=\"font-size: medium;\">4</span><span style=\"font-size: medium;\">吋/</span><span style=\"font-size: medium;\">6吋/8吋</span><span style=\"font-size: medium;\">/12吋</span>\r\n        </div>\r\n        <div>\r\n            <span style=\"font-size: medium; color: rgb(187, 35, 14); font-weight: bold;\">★此為參考示意圖，蛋糕隨尺寸不同，裝飾量隨之調整</span><br>\r\n        </div>\r\n        <div><span style=\"font-size: medium; color: rgb(187, 35, 14); font-weight: bold;\"><br></span></div>\r\n        <div>\r\n            <span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium; color: rgb(187, 35, 14); font-weight: bold;\"></span>\r\n        </div>\r\n        <div><a href=\"https://img.shoplineapp.com/media/image_clips/60d180414e10a300149f0027/original.jpg?1624342593\" style=\"font-size: medium;\"><br></a></div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><a href=\"https://img.shoplineapp.com/media/image_clips/67ecc9522c4d47000ad83321/original.JPG?1743571282\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></p>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 09:50:31'),
(65, 50, '芋見奶茶哈尼生乳捲', '獻給奶茶控&芋頭迷的極致味蕾饗宴！綿密芋泥融入絲滑奶茶餡，帶給您無與倫比的滿足感。', 450, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div>\r\n                <h2>\r\n                    <div style=\"color: rgb(85, 85, 85); font-size: large;\">\r\n                        <div>\r\n                            <span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村的哈尼生乳</span><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">捲</span>\r\n                        </div>\r\n                        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">就是俗稱</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">『</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">生乳捲</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">』</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">改良的升級版</span></span></div>\r\n                    </div>\r\n                    <div style=\"color: rgb(85, 85, 85); font-size: 14px;\">\r\n                        <div><span style=\"color: rgb(250, 92, 139); font-weight: 700; font-size: medium;\">因為以蜂蜜為蛋糕主要原料</span></div>\r\n                        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">因此命名為『</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">哈尼生乳捲』</span></span></div>\r\n                        <div><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\"><br></span></div>\r\n                        <div><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></div>\r\n                    </div>\r\n                </h2>\r\n                <div>\r\n                    <ol>\r\n                        <li style=\"color: rgb(85, 85, 85);\">\r\n                            <span style=\"font-size: medium;\">採用北海道十勝乳源與法國奶油等高級食材，高密度濃縮特調奶餡，質地清爽，奶香鮮純豐厚，呈現不摻水的絲滑濃郁口感<br></span><img src=\"https://img.shoplineapp.com/media/image_clips/60da8410a1fe0c002387bb31/original.jpg?1624933391\" data-src=\"https://img.shoplineapp.com/media/image_clips/60da8410a1fe0c002387bb31/original.jpg?1624933391\" class=\" sl-lazyloaded\">\r\n                        </li>\r\n                        <li>\r\n                            <span style=\"font-size: medium;\">選用花蓮舞鶴有機認證茶園的小葉種蜜香紅茶粉，濃郁熟果，蜜糖茶香，甘醇芬芳</span><br><img src=\"https://img.shoplineapp.com/media/image_clips/67c6598c999844000cac5ea6/original.jpg?1741052300\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/67c6598c999844000cac5ea6/original.jpg?1741052300\" class=\" sl-lazyloaded\">\r\n                        </li>\r\n                        <li>\r\n                            <span style=\"font-size: medium;\">嚴選大甲特有的紫色檳榔花紋心芋，以先進水療SPA技術細緻清洗、切割，再手工翻炒呈現綿密香醇的極致風味<br></span><img src=\"https://img.shoplineapp.com/media/image_clips/67c178dd7fd782000a0ff974/original.jpg?1740732637\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/67c178dd7fd782000a0ff974/original.jpg?1740732637\" class=\" sl-lazyloaded\"><br>\r\n                        </li>\r\n                    </ol>\r\n                </div>\r\n            </div>\r\n            <div>\r\n                <div style=\"color: rgb(250, 92, 139);\">\r\n                    <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                </div>\r\n                <div>\r\n                    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n                    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n                    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n                </div>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium; color: rgb(250, 92, 139); font-weight: bold;\">蛋糕尺寸規格</span><br><span style=\"font-size: medium;\">18 x 7.5cm(長×寬)</span><span style=\"font-size: medium;\">；一條6片</span><span style=\"font-size: medium;\"><br></span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n                <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n                <div>\r\n                    <span style=\"font-size: medium; font-weight: bold; color: rgb(187, 35, 14);\">★</span><span style=\"font-size: medium;\"><span style=\"font-weight: bold; color: rgb(187, 35, 14);\">週一無法到貨，請選擇週二到週五到貨</span><br></span><span style=\"font-size: medium;\">★彌月優惠請洽客服 0800 063188 會有專人為您服務<br></span><span style=\"font-size: medium;\">★如需製作彌月卡，請於訂購完成後與客服聯繫</span><span style=\"font-weight: bold; color: rgb(0, 0, 0); font-size: medium;\"><br></span>\r\n                </div>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><br></span><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。</span><span style=\"font-size: medium;\"><br></span></p>\r\n            </div>\r\n            <div><a href=\"https://img.shoplineapp.com/media/image_clips/67bd8c99ecaca3000aa9ab01/original.JPG?1740475544\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a></div>\r\n        </div>\r\n        <div><br></div>\r\n        <div><br></div>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 06:16:40'),
(66, 50, '哈尼生乳捲', '以日本進口鮮奶油與法國進口鮮奶油混合黃金比例，調和出鮮奶油奶味十足，卻不膩口獨特風味。添加台灣道地小農蜂蜜和放牧蛋，蛋糕體Q彈卻不軟爛，每口都是香濃的蜂蜜奶香。\r\n✦2021蘋果日報 母親節蛋糕評比【亞軍】\r\n評：蜂蜜味優雅香甜柔和，蛋糕體軟滑細緻可口，兩者相映輝\r\n✦2020蘋果日報 母親節蛋糕評比【冠軍】\r\n評：外型佳，蛋糕體油香溼潤，蜂蜜香味優雅，奶油和蜂蜜的結合十分完美', 360, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div><br></div>\r\n        <div>\r\n            <div><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村的哈尼生乳捲</span></div>\r\n            <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">就是俗稱</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">『</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">生乳捲</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">』</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">改良的升級版</span></span></div>\r\n        </div>\r\n        <div>\r\n            <div><span style=\"color: rgb(250, 92, 139); font-weight: 700; font-size: medium;\">因為以蜂蜜為蛋糕主要原料</span></div>\r\n            <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">因此命名為『</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">哈尼生乳捲』</span></span></div>\r\n        </div>\r\n        <div>\r\n            <div>\r\n                <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></h2>\r\n                <div>\r\n                    <ol>\r\n                        <li><span style=\"font-size: medium;\">連續四年獲選「母親節蛋糕評比」冠軍與亞軍</span></li>\r\n                        <li><span style=\"font-size: medium;\">採用北海道十勝乳源與法國奶油等高級食材，高密度濃縮特調奶餡，質地清爽，奶香鮮純豐厚，呈現不摻水的絲滑濃郁口感<br><img src=\"https://img.shoplineapp.com/media/image_clips/60da8410a1fe0c002387bb31/original.jpg?1624933391\" data-src=\"https://img.shoplineapp.com/media/image_clips/60da8410a1fe0c002387bb31/original.jpg?1624933391\" class=\" ls-is-cached sl-lazyloaded\"></span></li>\r\n                        <li><span style=\"font-size: medium;\">高品質小農契作蜂蜜，因應時節，每季的蜂蜜滋味都不同，讓您體驗純真多樣的蜜香<br><span style=\"font-size: medium;\"><img src=\"https://img.shoplineapp.com/media/image_clips/60da846ae67e410014aba077/original.jpg?1624933482\" data-src=\"https://img.shoplineapp.com/media/image_clips/60da846ae67e410014aba077/original.jpg?1624933482\" class=\" sl-lazyloaded\"></span><br></span></li>\r\n                    </ol>\r\n                </div>\r\n            </div>\r\n            <div>\r\n                <div style=\"color: rgb(250, 92, 139);\">\r\n                    <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">蛋糕尺寸規格</span><br>18 x 7.5cm(長×寬)</span><span style=\"font-size: medium;\">；一條6片</span><span style=\"font-size: medium;\"><br></span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n            <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n            <div>\r\n                <span style=\"font-size: medium; font-weight: bold; color: rgb(187, 35, 14);\">★</span><span style=\"font-size: medium;\"><span style=\"font-weight: bold; color: rgb(187, 35, 14);\">週一無法到貨，請選擇週二到週五到貨</span><br></span><span style=\"font-size: medium;\">★彌月優惠請洽客服 0800 063188 會有專人為您服務<br></span><span style=\"font-size: medium;\">★如需製作彌月卡，請於訂購完成後與客服聯繫</span><span style=\"font-weight: bold; color: rgb(0, 0, 0); font-size: medium;\"><br></span>\r\n            </div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><br></span><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。</span><span style=\"font-size: medium;\"><br></span></p>\r\n            <div>\r\n                <a href=\"https://img.shoplineapp.com/media/image_clips/66ebc1f166cdda001ccdf50c/original.JPG?1726726641\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a><br>\r\n            </div>\r\n            <div><br></div>\r\n        </div>\r\n        <div><br></div>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 06:22:40'),
(67, 50, '搖滾草莓哈尼生乳捲', '手工熬煮草莓果醬，融入超級莓果，滿滿的維生素C。蛋糕體使用頂級西班牙Simon Coll巧克力，香醇豐厚、穩重的覆蓋住甜美空靈的內餡，完美的交織在舌尖綻放，味蕾與身心瞬間都戀愛了！\r\n\r\n✦2021蘋果日報 母親節蛋糕評比【季軍】\r\n評：草莓香甜不搶味，清新少女風味\r\n✦2020蘋果日報 母親節蛋糕評比【冠軍】\r\n評：鬆軟化口性好', 480, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <div>\r\n            <div>\r\n                <h2>\r\n                    <div style=\"color: rgb(85, 85, 85); font-size: large;\">\r\n                        <div>\r\n                            <span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村的哈尼生乳</span><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">捲</span>\r\n                        </div>\r\n                        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">就是俗稱</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">『</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">生乳捲</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">』</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">改良的升級版</span></span></div>\r\n                    </div>\r\n                    <div style=\"color: rgb(85, 85, 85); font-size: 14px;\">\r\n                        <div><span style=\"color: rgb(250, 92, 139); font-weight: 700; font-size: medium;\">因為以蜂蜜為蛋糕主要原料</span></div>\r\n                        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">因此命名為『</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">哈尼生乳捲』</span></span></div>\r\n                        <div><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\"><br></span></div>\r\n                        <div><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></div>\r\n                    </div>\r\n                </h2>\r\n                <div>\r\n                    <ol>\r\n                        <li style=\"color: rgb(85, 85, 85);\"><span style=\"font-size: medium;\">連續四年獲選「母親節蛋糕評比」冠軍與季軍</span></li>\r\n                        <li style=\"color: rgb(85, 85, 85);\">\r\n                            <span style=\"font-size: medium;\">採用北海道十勝乳源與法國奶油等高級食材，高密度濃縮特調奶餡，質地清爽，奶香鮮純豐厚，呈現不摻水的絲滑濃郁口感<br></span><img src=\"https://img.shoplineapp.com/media/image_clips/60da8410a1fe0c002387bb31/original.jpg?1624933391\" data-src=\"https://img.shoplineapp.com/media/image_clips/60da8410a1fe0c002387bb31/original.jpg?1624933391\" class=\" ls-is-cached sl-lazyloaded\">\r\n                        </li>\r\n                        <li style=\"color: rgb(85, 85, 85);\">\r\n                            <span style=\"font-size: medium;\">手工熬煮草莓果醬，融入超級莓果，不只滿滿維生素C，花青素更是大噴發</span><br><span style=\"font-size: medium;\"><img src=\"https://img.shoplineapp.com/media/image_clips/60da87c5c7d960001752f4ee/original.jpg?1624934340\" data-src=\"https://img.shoplineapp.com/media/image_clips/60da87c5c7d960001752f4ee/original.jpg?1624934340\" class=\" sl-lazyloaded\"></span>\r\n                        </li>\r\n                    </ol>\r\n                </div>\r\n            </div>\r\n            <div>\r\n                <div style=\"color: rgb(250, 92, 139);\">\r\n                    <h2><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></h2>\r\n                </div>\r\n                <div>\r\n                    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n                    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n                    <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n                </div>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium; color: rgb(250, 92, 139); font-weight: bold;\">蛋糕尺寸規格</span><br><span style=\"font-size: medium;\">18 x 7.5cm(長×寬)</span><span style=\"font-size: medium;\">；一條6片</span><span style=\"font-size: medium;\"><br></span></p>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n                <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n                <div>\r\n                    <span style=\"font-size: medium; font-weight: bold; color: rgb(187, 35, 14);\">★</span><span style=\"font-size: medium;\"><span style=\"font-weight: bold; color: rgb(187, 35, 14);\">週一無法到貨，請選擇週二到週五到貨</span><br></span><span style=\"font-size: medium;\">★彌月優惠請洽客服 0800 063188 會有專人為您服務<br></span><span style=\"font-size: medium;\">★如需製作彌月卡，請於訂購完成後與客服聯繫</span><span style=\"font-weight: bold; color: rgb(0, 0, 0); font-size: medium;\"><br></span>\r\n                </div>\r\n                <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><br></span><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。</span><span style=\"font-size: medium;\"><br></span></p>\r\n            </div>\r\n            <div>\r\n                <a href=\"https://img.shoplineapp.com/media/image_clips/66ebc1f1bd4a5b001c592ccf/original.JPG?1726726641\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a><br>\r\n            </div>\r\n        </div>\r\n        <div><br></div>\r\n        <div><br></div>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 06:22:40');
INSERT INTO `product` (`p_id`, `classid`, `p_name`, `p_intro`, `p_price`, `p_open`, `p_content`, `p_date`) VALUES
(68, 50, '貝禮詩拿鐵哈尼生乳捲', '利用黃金溫度沖泡咖啡，加上熟成12小時，將咖啡溫柔微苦滋味及奶酒濃醇香甜達到完美融合！咖啡奶凍恆溫熬煮，低溫熟成將奶凍風味完全鎖住，吃起來多一分微醺甜美韻味，也多ㄧ分成熟大人味。\r\n✦2020蘋果日報 母親節蛋糕評比【亞軍】\r\n評：外型美，結合奶酒的濃醇細緻，與滑順入口的奶霜，成功打造成人甜點味覺。\r\n✦2019蘋果日報 母親節蛋糕評比【季軍】\r\n評：香味濃郁自然，輕柔順口好吃', 480, 1, '<div class=\"ProductDetail-description accordion-item active\">\r\n    <div class=\"ProductDetail-description-title accordion-title js-accordion-title\"><span>商品描述</span></div>\r\n    <div class=\"ProductDetail-description-content accordion-content\" style=\"display: block;\">\r\n        <!-- START SHOPLINE RICH CONTENT -->\r\n\r\n\r\n        <h2>\r\n            <div style=\"color: rgb(85, 85, 85); font-size: large;\">\r\n                <div><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村的哈尼生乳捲</span></div>\r\n                <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">就是俗稱</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">『</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">生乳捲</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">』</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">改良的升級版</span></span></div>\r\n            </div>\r\n            <div style=\"color: rgb(85, 85, 85);\">\r\n                <div style=\"font-size: 14px;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700; font-size: medium;\">因為以蜂蜜為蛋糕主要原料</span></div>\r\n                <div style=\"font-size: 14px;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">因此命名為『</span><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">哈尼生乳捲』</span></span></div>\r\n                <h2 style=\"font-size: 14px;\"><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">糖村產品介紹</span></h2>\r\n                <ol>\r\n                    <li style=\"font-size: 16px; color: rgb(85, 85, 85);\"><span style=\"font-size: medium;\">連續四年獲選「母親節蛋糕評比」亞軍與季軍</span></li>\r\n                    <li style=\"font-size: 16px; color: rgb(85, 85, 85);\"><span style=\"font-size: medium;\">採用北海道十勝乳源與法國奶油等高級食材，高密度濃縮特調奶餡，質地清爽，奶香鮮純豐厚，呈現不摻水的絲滑濃郁口感<br><img src=\"https://img.shoplineapp.com/media/image_clips/60da8410a1fe0c002387bb31/original.jpg?1624933391\" style=\"font-size: 16px;\" data-src=\"https://img.shoplineapp.com/media/image_clips/60da8410a1fe0c002387bb31/original.jpg?1624933391\" class=\" ls-is-cached sl-lazyloaded\"></span></li>\r\n                    <li style=\"font-size: 16px; color: rgb(85, 85, 85);\"><span style=\"font-size: medium;\">嚴選愛爾蘭鮮乳所提煉出的高品質鮮奶油，混合愛爾蘭優質威士忌再佐以香草、可可，濃郁的迷人香氣，造就了獨一無二的香甜氣息<br><img src=\"https://img.shoplineapp.com/media/image_clips/6478098595b2ed001143a75b/original.jpg?1685588356\" alt=\"\" data-src=\"https://img.shoplineapp.com/media/image_clips/6478098595b2ed001143a75b/original.jpg?1685588356\" class=\" sl-lazyloaded\"><br></span></li>\r\n                </ol>\r\n                <div style=\"text-align: left;\"><br></div>\r\n            </div>\r\n            <div style=\"color: rgb(250, 92, 139);\"><span style=\"color: rgb(250, 92, 139); font-size: large; font-weight: bold;\">產品說明及注意事項</span></div>\r\n        </h2>\r\n        <div>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">糖村對甜點美味的堅持<br></span></span><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★注重食材的挑選！</span><br></span><span style=\"font-size: medium;\">精挑細選來自法國、歐美、日本等食材，搭配，台灣當地特產，在烘焙過程中不添加防腐劑，讓消費者品嘗到美味安心的甜點，是糖村的堅持!</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★品質維持-徹底執行，不是口號!</span><br></span><span style=\"font-size: medium;\">品質維持一向是糖村最引以為傲之處，細節的堅持就是品質的根基。</span></p>\r\n            <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"font-weight: bold;\">★精湛創新的廚藝-滿足老饕的味蕾!</span><br></span><span style=\"font-size: medium;\">為不斷給消費者提供不同的蛋糕甜點，Grace及主廚每年到歐美及日本觀摩考察數次，也透過各種管道，邀請國外知名的糕點名廚來臺灣技術指導及烘焙交流，讓廚藝不斷的精益求精與創新，順應市場潮流與季節變化，每</span><span style=\"font-size: medium;\">月都有新品推出，以滿足各方老饕味蕾。</span></p>\r\n        </div>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium; color: rgb(250, 92, 139); font-weight: bold;\">蛋糕尺寸規格</span><br><span style=\"font-size: medium;\">18 x 7.5cm(長×寬)</span><span style=\"font-size: medium;\">；一條6片</span></p>\r\n        <p class=\"MsoNormal\" style=\"margin-bottom: 7.5pt;\"><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: bold;\">效期說明</span><br></span><span style=\"font-size: medium;\">保存期限：4天內<br></span><span style=\"font-size: medium;\">有效日期：請依外盒標示為主</span><span style=\"font-size: medium;\"></span></p>\r\n        <div><span style=\"font-size: medium;\"><span style=\"color: rgb(250, 92, 139); font-weight: 700;\">更多說明</span><br></span></div>\r\n        <div><span style=\"font-weight: bold; color: rgb(187, 35, 14);\"><span style=\"font-size: medium;\">★</span><span style=\"font-size: medium;\">本產品由貝禮詩奶酒調製，每條含有10g奶酒</span></span></div>\r\n        <div>\r\n            <span style=\"font-weight: bold; color: rgb(187, 35, 14);\"><span style=\"font-size: medium;\">★</span><span style=\"font-size: medium;\">孕婦、小朋友不適合食用</span></span>\r\n            <div><span style=\"font-weight: bold; color: rgb(187, 35, 14);\"><span style=\"font-size: medium;\">★</span><span style=\"font-size: medium;\">週一無法到貨，請選擇週二到週五到貨</span></span></div>\r\n            <span style=\"font-size: medium;\">★彌月優惠請洽客服 0800 063188 會有專人為您服務<br></span><span style=\"font-size: medium;\">★如需製作彌月卡，請於訂購完成後與客服聯繫</span><span style=\"font-weight: bold; color: rgb(0, 0, 0); font-size: medium;\"><br><br></span><span style=\"color: rgb(250, 92, 139); font-size: medium; font-weight: 700;\">宅配風險說明<br></span><span style=\"font-size: medium;\">歷經多次包裝改良加強，我們細心呵護想將蛋糕完美送至您的手中，但宅配的運送過程有太多不可控制之因素，運送過程可能會因車體晃動，路面不平而有碰撞的狀況，造成商品「位移、變形，裝飾脫落、側邊微損」等，恕不在退換貨、退款範圍內，商品有嚴重受損、翻覆等情況則不在此限。請盡快與客服人員聯繫，將盡快協助處理。</span><span style=\"font-weight: bold; color: rgb(0, 0, 0); font-size: medium;\"><br></span>\r\n        </div>\r\n        <div><span style=\"font-size: medium;\"><br></span></div>\r\n        <div>\r\n            <a href=\"https://img.shoplineapp.com/media/image_clips/66ebc1f14711600022fe49be/original.JPG?1726726641\" style=\"color: rgb(250, 92, 139); font-weight: bold; font-size: medium;\">營養成分說明(點擊可查看)</a><br>\r\n        </div>\r\n        <div><br></div>\r\n        <div><br></div>\r\n\r\n\r\n\r\n    </div>\r\n</div>', '2025-05-10 06:29:08');

-- --------------------------------------------------------

--
-- 資料表結構 `product_img`
--

CREATE TABLE `product_img` (
  `img_id` int(11) NOT NULL COMMENT '圖檔編號',
  `p_id` int(10) NOT NULL COMMENT '產品編號',
  `img_file` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '圖檔名稱',
  `sort` int(2) NOT NULL COMMENT '圖片順序',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `product_img`
--

INSERT INTO `product_img` (`img_id`, `p_id`, `img_file`, `sort`, `create_date`) VALUES

(10, 12, '1201.webp', 1, '0000-00-00 00:00:00'),
(11, 12, '1202.webp', 2, '0000-00-00 00:00:00'),
(12, 12, '1203.webp', 3, '0000-00-00 00:00:00'),
(13, 12, '1204.webp', 4, '0000-00-00 00:00:00'),
(31, 16, '1601.webp', 1, '0000-00-00 00:00:00'),
(32, 16, '1602.webp', 2, '0000-00-00 00:00:00'),
(33, 16, '1603.webp', 3, '0000-00-00 00:00:00'),
(34, 16, '1604.webp', 4, '0000-00-00 00:00:00'),
(35, 16, '1605.webp', 5, '0000-00-00 00:00:00'),
(36, 16, '1606.webp', 6, '0000-00-00 00:00:00'),
(106, 31, '3101.webp', 1, '0000-00-00 00:00:00'),
(107, 31, '3102.webp', 2, '0000-00-00 00:00:00'),
(108, 31, '3103.webp', 3, '0000-00-00 00:00:00'),
(109, 31, '3104.webp', 4, '0000-00-00 00:00:00'),
(110, 31, '3105.webp', 5, '0000-00-00 00:00:00'),
(111, 31, '3106.webp', 6, '0000-00-00 00:00:00'),
(112, 31, '3107.webp', 7, '0000-00-00 00:00:00'),
(113, 31, '3108.webp', 8, '0000-00-00 00:00:00'),
(114, 31, '3109.webp', 9, '0000-00-00 00:00:00'),
(115, 31, '3110.webp', 10, '0000-00-00 00:00:00'),
(187, 41, '4101.webp', 1, '0000-00-00 00:00:00'),
(188, 41, '4102.webp', 2, '0000-00-00 00:00:00'),
(189, 41, '4103.webp', 3, '0000-00-00 00:00:00'),
(190, 41, '4104.webp', 4, '0000-00-00 00:00:00'),
(191, 41, '4105.webp', 5, '0000-00-00 00:00:00'),
(192, 41, '4106.webp', 6, '0000-00-00 00:00:00'),
(228, 48, '4801.webp', 1, '0000-00-00 00:00:00'),
(229, 48, '4802.webp', 2, '0000-00-00 00:00:00'),
(230, 48, '4803.webp', 3, '0000-00-00 00:00:00'),
(231, 48, '4804.webp', 4, '0000-00-00 00:00:00'),
(232, 48, '4805.webp', 5, '0000-00-00 00:00:00'),
(263, 56, '5601.webp', 1, '0000-00-00 00:00:00'),
(264, 56, '5602.webp', 2, '0000-00-00 00:00:00'),
(265, 56, '5603.webp', 3, '0000-00-00 00:00:00'),
(266, 56, '5604.webp', 4, '0000-00-00 00:00:00'),
(267, 57, '5701.webp', 1, '0000-00-00 00:00:00'),
(268, 57, '5702.webp', 2, '0000-00-00 00:00:00'),
(269, 57, '5703.webp', 3, '0000-00-00 00:00:00'),
(270, 58, '5801.webp', 1, '0000-00-00 00:00:00'),
(271, 58, '5802.webp', 2, '0000-00-00 00:00:00'),
(272, 58, '5803.webp', 3, '0000-00-00 00:00:00'),
(273, 59, '5901.webp', 1, '0000-00-00 00:00:00'),
(274, 59, '5902.webp', 2, '0000-00-00 00:00:00'),
(275, 59, '5903.webp', 3, '0000-00-00 00:00:00'),
(276, 60, '6001.webp', 1, '0000-00-00 00:00:00'),
(277, 60, '6002.webp', 2, '0000-00-00 00:00:00'),
(278, 60, '6003.webp', 3, '0000-00-00 00:00:00'),
(279, 60, '6004.webp', 4, '0000-00-00 00:00:00'),
(280, 60, '6005.webp', 5, '0000-00-00 00:00:00'),
(281, 61, '6101.webp', 1, '0000-00-00 00:00:00'),
(282, 61, '6102.webp', 2, '0000-00-00 00:00:00'),
(283, 61, '6103.webp', 3, '0000-00-00 00:00:00'),
(284, 61, '6104.webp', 4, '0000-00-00 00:00:00'),
(285, 62, '6201.webp', 1, '0000-00-00 00:00:00'),
(286, 62, '6202.webp', 2, '0000-00-00 00:00:00'),
(287, 62, '6203.webp', 3, '0000-00-00 00:00:00'),
(288, 63, '6301.webp', 1, '0000-00-00 00:00:00'),
(289, 63, '6302.webp', 2, '0000-00-00 00:00:00'),
(290, 63, '6303.webp', 3, '0000-00-00 00:00:00'),
(291, 64, '6401.webp', 1, '0000-00-00 00:00:00'),
(292, 64, '6402.webp', 2, '0000-00-00 00:00:00'),
(293, 64, '6403.webp', 3, '0000-00-00 00:00:00'),
(294, 64, '6404.webp', 4, '0000-00-00 00:00:00'),
(295, 65, '6501.webp', 1, '0000-00-00 00:00:00'),
(296, 65, '6502.webp', 2, '0000-00-00 00:00:00'),
(297, 65, '6503.webp', 3, '0000-00-00 00:00:00'),
(298, 65, '6504.webp', 4, '0000-00-00 00:00:00'),
(299, 66, '6601.webp', 1, '0000-00-00 00:00:00'),
(300, 66, '6602.webp', 2, '0000-00-00 00:00:00'),
(301, 66, '6603.webp', 3, '0000-00-00 00:00:00'),
(302, 66, '6604.webp', 4, '0000-00-00 00:00:00'),
(303, 66, '6605.webp', 5, '0000-00-00 00:00:00'),
(304, 67, '6701.webp', 1, '0000-00-00 00:00:00'),
(305, 67, '6702.webp', 2, '0000-00-00 00:00:00'),
(306, 67, '6703.webp', 3, '0000-00-00 00:00:00'),
(307, 67, '6704.webp', 4, '0000-00-00 00:00:00'),
(308, 67, '6705.webp', 5, '0000-00-00 00:00:00'),
(309, 68, '6801.webp', 1, '0000-00-00 00:00:00'),
(310, 68, '6802.webp', 2, '0000-00-00 00:00:00'),
(311, 68, '6803.webp', 3, '0000-00-00 00:00:00'),
(312, 68, '6804.webp', 4, '0000-00-00 00:00:00'),
(313, 68, '6805.webp', 5, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `pyclass`
--

CREATE TABLE `pyclass` (
  `classid` int(3) NOT NULL COMMENT '產品類別',
  `level` int(2) NOT NULL COMMENT '所在層級',
  `fonticon` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '字型圖示',
  `cname` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '類別名稱',
  `sort` int(3) NOT NULL COMMENT '列表排序',
  `uplink` int(3) NOT NULL COMMENT '上層連結',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '建立時間與更新時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `pyclass`
--

INSERT INTO `pyclass` (`classid`, `level`, `fonticon`, `cname`, `sort`, `uplink`, `create_date`) VALUES
(4, 1, 'fa-box', '伴手禮盒', 4, 0, '2025-05-08 12:46:17'),
(5, 1, 'fa-cubes', '牛軋糖', 5, 0, '2025-05-08 12:50:06'),
(6, 1, 'fa-birthday-cake', '生日蛋糕', 6, 0, '2025-05-08 12:58:11'),
(7, 1, 'fa-dot-circle', '生乳捲', 7, 0, '2025-05-08 13:04:31'),
(8, 1, 'fa-cookie', '餅乾', 8, 0, '2025-05-08 13:05:47'),
(41, 2, 'fa-ice-cream', '一般送禮', 1, 4, '2025-05-08 13:25:57'),
(42, 2, 'fa-ice-cream', '節日禮盒', 2, 4, '2025-05-08 13:25:57'),
(43, 2, 'fa-ice-cream', '精選禮盒', 3, 4, '2025-05-08 13:25:57'),
(44, 2, 'fa-ice-cream', '牛軋糖&糖果', 1, 5, '2025-05-10 05:21:52'),
(45, 2, 'fa-ice-cream', '牛軋餅&鳳梨酥', 2, 5, '2025-05-10 06:52:12'),
(46, 2, 'fa-ice-cream', '門市限定', 1, 6, '2025-05-10 05:23:13'),
(47, 2, 'fa-ice-cream', '宅配', 2, 6, '2025-05-10 09:16:39'),
(48, 2, 'fa-ice-cream', '喜餅禮盒', 1, 8, '2025-05-10 05:26:00'),
(49, 2, 'fa-ice-cream', '喜糖禮盒', 2, 8, '2025-05-10 05:26:00'),
(50, 2, 'fa-ice-cream', '哈尼生乳捲', 1, 7, '2025-05-10 05:27:40'),


-- --------------------------------------------------------

--
-- 資料表結構 `town`
--

CREATE TABLE `town` (
  `townNo` bigint(20) NOT NULL COMMENT '鄕鎮市編號',
  `Name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '鄕鎮市名稱',
  `Post` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '郵遞區號',
  `State` smallint(6) NOT NULL COMMENT '狀態',
  `AutoNo` int(10) NOT NULL COMMENT '上層城市編號連結'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `town`
--

INSERT INTO `town` (`townNo`, `Name`, `Post`, `State`, `AutoNo`) VALUES
(1, '中正區', '100', 0, 1),
(2, '大同區', '103', 0, 1),
(3, '中山區', '104', 0, 1),
(4, '松山區', '105', 0, 1),
(5, '大安區', '106', 0, 1),
(6, '萬華區', '108', 0, 1),
(7, '信義區', '110', 0, 1),
(8, '士林區', '111', 0, 1),
(9, '北投區', '112', 0, 1),
(10, '內湖區', '114', 0, 1),
(11, '南港區', '115', 0, 1),
(12, '文山區', '116', 0, 1),
(13, '仁愛區', '200', 0, 2),
(14, '信義區', '201', 0, 2),
(15, '中正區', '202', 0, 2),
(16, '中山區', '203', 0, 2),
(17, '安樂區', '204', 0, 2),
(18, '暖暖區', '205', 0, 2),
(19, '七堵區', '206', 0, 2),
(20, '萬里區', '207', 0, 3),
(21, '金山區', '208', 0, 3),
(22, '板橋區', '220', 0, 3),
(23, '汐止區', '221', 0, 3),
(24, '深坑區', '222', 0, 3),
(25, '石碇區', '223', 0, 3),
(26, '瑞芳區', '224', 0, 3),
(27, '平溪區', '226', 0, 3),
(28, '雙溪區', '227', 0, 3),
(29, '貢寮區', '228', 0, 3),
(30, '新店區', '231', 0, 3),
(31, '坪林區', '232', 0, 3),
(32, '烏來區', '233', 0, 3),
(33, '永和區', '234', 0, 3),
(34, '中和區', '235', 0, 3),
(35, '土城區', '236', 0, 3),
(36, '三峽區', '237', 0, 3),
(37, '樹林區', '238', 0, 3),
(38, '鶯歌區', '239', 0, 3),
(39, '三重區', '241', 0, 3),
(40, '新莊區', '242', 0, 3),
(41, '泰山區', '243', 0, 3),
(42, '林口區', '244', 0, 3),
(43, '蘆洲區', '247', 0, 3),
(44, '五股區', '248', 0, 3),
(45, '八里區', '249', 0, 3),
(46, '淡水區', '251', 0, 3),
(47, '三芝區', '252', 0, 3),
(48, '石門區', '253', 0, 3),
(49, '宜蘭市', '260', 0, 4),
(50, '頭城鎮', '261', 0, 4),
(51, '礁溪鄉', '262', 0, 4),
(52, '壯圍鄉', '263', 0, 4),
(53, '員山鄉', '264', 0, 4),
(54, '羅東鎮', '265', 0, 4),
(55, '三星鄉', '266', 0, 4),
(56, '大同鄉', '267', 0, 4),
(57, '五結鄉', '268', 0, 4),
(58, '冬山鄉', '269', 0, 4),
(59, '蘇澳鎮', '270', 0, 4),
(60, '南澳鄉', '272', 0, 4),
(61, '釣魚台列嶼', '290', 0, 4),
(62, '新竹市(東區)', '300', 0, 5),
(63, '竹北市', '302', 0, 6),
(64, '湖口鄉', '303', 0, 6),
(65, '新豐鄉', '304', 0, 6),
(66, '新埔鎮', '305', 0, 6),
(67, '關西鎮', '306', 0, 6),
(68, '芎林鄉', '307', 0, 6),
(69, '寶山鄉', '308', 0, 6),
(70, '竹東鎮', '310', 0, 6),
(71, '五峰鄉', '311', 0, 6),
(72, '橫山鄉', '312', 0, 6),
(73, '尖石鄉', '313', 0, 6),
(74, '北埔鄉', '314', 0, 6),
(75, '峨眉鄉', '315', 0, 6),
(76, '中壢區', '320', 0, 7),
(77, '平鎮區', '324', 0, 7),
(78, '龍潭區', '325', 0, 7),
(79, '楊梅區', '326', 0, 7),
(80, '新屋區', '327', 0, 7),
(81, '觀音區', '328', 0, 7),
(82, '桃園區', '330', 0, 7),
(83, '龜山區', '333', 0, 7),
(84, '八德區', '334', 0, 7),
(85, '大溪區', '335', 0, 7),
(86, '復興區', '336', 0, 7),
(87, '大園區', '337', 0, 7),
(88, '蘆竹區', '338', 0, 7),
(89, '竹南鎮', '350', 0, 8),
(90, '頭份市', '351', 0, 8),
(91, '三灣鄉', '352', 0, 8),
(92, '南庄鄉', '353', 0, 8),
(93, '獅潭鄉', '354', 0, 8),
(94, '後龍鎮', '356', 0, 8),
(95, '通霄鎮', '357', 0, 8),
(96, '苑裡鎮', '358', 0, 8),
(97, '苗栗市', '360', 0, 8),
(98, '造橋鄉', '361', 0, 8),
(99, '頭屋鄉', '362', 0, 8),
(100, '公館鄉', '363', 0, 8),
(101, '大湖鄉', '364', 0, 8),
(102, '泰安鄉', '365', 0, 8),
(103, '銅鑼鄉', '366', 0, 8),
(104, '三義鄉', '367', 0, 8),
(105, '西湖鄉', '368', 0, 8),
(106, '卓蘭鎮', '369', 0, 8),
(107, '中區', '400', 0, 9),
(108, '東區', '401', 0, 9),
(109, '南區', '402', 0, 9),
(110, '西區', '403', 0, 9),
(111, '北區', '404', 0, 9),
(112, '北屯區', '406', 0, 9),
(113, '西屯區', '407', 0, 9),
(114, '南屯區', '408', 0, 9),
(115, '太平區', '411', 0, 9),
(116, '大里區', '412', 0, 9),
(117, '霧峰區', '413', 0, 9),
(118, '烏日區', '414', 0, 9),
(119, '豐原區', '420', 0, 9),
(120, '后里區', '421', 0, 9),
(121, '石岡區', '422', 0, 9),
(122, '東勢區', '423', 0, 9),
(123, '和平區', '424', 0, 9),
(124, '新社區', '426', 0, 9),
(125, '潭子區', '427', 0, 9),
(126, '大雅區', '428', 0, 9),
(127, '神岡區', '429', 0, 9),
(128, '大肚區', '432', 0, 9),
(129, '沙鹿區', '433', 0, 9),
(130, '龍井區', '434', 0, 9),
(131, '梧棲區', '435', 0, 9),
(132, '清水區', '436', 0, 9),
(133, '大甲區', '437', 0, 9),
(134, '外埔區', '438', 0, 9),
(135, '大安區', '439', 0, 9),
(136, '彰化市', '500', 0, 10),
(137, '芬園鄉', '502', 0, 10),
(138, '花壇鄉', '503', 0, 10),
(139, '秀水鄉', '504', 0, 10),
(140, '鹿港鎮', '505', 0, 10),
(141, '福興鄉', '506', 0, 10),
(142, '線西鄉', '507', 0, 10),
(143, '和美鎮', '508', 0, 10),
(144, '伸港鄉', '509', 0, 10),
(145, '員林市', '510', 0, 10),
(146, '社頭鄉', '511', 0, 10),
(147, '永靖鄉', '512', 0, 10),
(148, '埔心鄉', '513', 0, 10),
(149, '溪湖鎮', '514', 0, 10),
(150, '大村鄉', '515', 0, 10),
(151, '埔鹽鄉', '516', 0, 10),
(152, '田中鎮', '520', 0, 10),
(153, '北斗鎮', '521', 0, 10),
(154, '田尾鄉', '522', 0, 10),
(155, '埤頭鄉', '523', 0, 10),
(156, '溪州鄉', '524', 0, 10),
(157, '竹塘鄉', '525', 0, 10),
(158, '二林鎮', '526', 0, 10),
(159, '大城鄉', '527', 0, 10),
(160, '芳苑鄉', '528', 0, 10),
(161, '二水鄉', '530', 0, 10),
(162, '南投市', '540', 0, 11),
(163, '中寮鄉', '541', 0, 11),
(164, '草屯鎮', '542', 0, 11),
(165, '國姓鄉', '544', 0, 11),
(166, '埔里鎮', '545', 0, 11),
(167, '仁愛鄉', '546', 0, 11),
(168, '名間鄉', '551', 0, 11),
(169, '集集鎮', '552', 0, 11),
(170, '水里鄉', '553', 0, 11),
(171, '魚池鄉', '555', 0, 11),
(172, '信義鄉', '556', 0, 11),
(173, '竹山鎮', '557', 0, 11),
(174, '鹿谷鄉', '558', 0, 11),
(175, '斗南鎮', '630', 0, 12),
(176, '大埤鄉', '631', 0, 12),
(177, '虎尾鎮', '632', 0, 12),
(178, '土庫鎮', '633', 0, 12),
(179, '褒忠鄉', '634', 0, 12),
(180, '東勢鄉', '635', 0, 12),
(181, '臺西鄉', '636', 0, 12),
(182, '崙背鄉', '637', 0, 12),
(183, '麥寮鄉', '638', 0, 12),
(184, '斗六市', '640', 0, 12),
(185, '林內鄉', '643', 0, 12),
(186, '古坑鄉', '646', 0, 12),
(187, '莿桐鄉', '647', 0, 12),
(188, '西螺鎮', '648', 0, 12),
(189, '二崙鄉', '649', 0, 12),
(190, '北港鎮', '651', 0, 12),
(191, '水林鄉', '652', 0, 12),
(192, '口湖鄉', '653', 0, 12),
(193, '四湖鄉', '654', 0, 12),
(194, '元長鄉', '655', 0, 12),
(195, '嘉義市(東區)', '600', 0, 13),
(196, '番路鄉', '602', 0, 14),
(197, '梅山鄉', '603', 0, 14),
(198, '竹崎鄉', '604', 0, 14),
(199, '阿里山鄉', '605', 0, 14),
(200, '中埔鄉', '606', 0, 14),
(201, '大埔鄉', '607', 0, 14),
(202, '水上鄉', '608', 0, 14),
(203, '鹿草鄉', '611', 0, 14),
(204, '太保市', '612', 0, 14),
(205, '朴子市', '613', 0, 14),
(206, '東石鄉', '614', 0, 14),
(207, '六腳鄉', '615', 0, 14),
(208, '新港鄉', '616', 0, 14),
(209, '民雄鄉', '621', 0, 14),
(210, '大林鎮', '622', 0, 14),
(211, '溪口鄉', '623', 0, 14),
(212, '義竹鄉', '624', 0, 14),
(213, '布袋鎮', '625', 0, 14),
(214, '中西區', '700', 0, 15),
(215, '東區', '701', 0, 15),
(216, '南區', '702', 0, 15),
(217, '北區', '704', 0, 15),
(218, '安平區', '708', 0, 15),
(219, '安南區', '709', 0, 15),
(220, '永康區', '710', 0, 15),
(221, '歸仁區', '711', 0, 15),
(222, '新化區', '712', 0, 15),
(223, '左鎮區', '713', 0, 15),
(224, '玉井區', '714', 0, 15),
(225, '楠西區', '715', 0, 15),
(226, '南化區', '716', 0, 15),
(227, '仁德區', '717', 0, 15),
(228, '關廟區', '718', 0, 15),
(229, '龍崎區', '719', 0, 15),
(230, '官田區', '720', 0, 15),
(231, '麻豆區', '721', 0, 15),
(232, '佳里區', '722', 0, 15),
(233, '西港區', '723', 0, 15),
(234, '七股區', '724', 0, 15),
(235, '將軍區', '725', 0, 15),
(236, '學甲區', '726', 0, 15),
(237, '北門區', '727', 0, 15),
(238, '新營區', '730', 0, 15),
(239, '後壁區', '731', 0, 15),
(240, '白河區', '732', 0, 15),
(241, '東山區', '733', 0, 15),
(242, '六甲區', '734', 0, 15),
(243, '下營區', '735', 0, 15),
(244, '柳營區', '736', 0, 15),
(245, '鹽水區', '737', 0, 15),
(246, '善化區', '741', 0, 15),
(247, '大內區', '742', 0, 15),
(248, '山上區', '743', 0, 15),
(249, '新市區', '744', 0, 15),
(250, '安定區', '745', 0, 15),
(251, '新興區', '800', 0, 16),
(252, '前金區', '801', 0, 16),
(253, '苓雅區', '802', 0, 16),
(254, '鹽埕區', '803', 0, 16),
(255, '鼓山區', '804', 0, 16),
(256, '旗津區', '805', 0, 16),
(257, '前鎮區', '806', 0, 16),
(258, '三民區', '807', 0, 16),
(259, '楠梓區', '811', 0, 16),
(260, '小港區', '812', 0, 16),
(261, '左營區', '813', 0, 16),
(262, '仁武區', '814', 0, 16),
(263, '大社區', '815', 0, 16),
(264, '岡山區', '820', 0, 16),
(265, '路竹區', '821', 0, 16),
(266, '阿蓮區', '822', 0, 16),
(267, '田寮區', '823', 0, 16),
(268, '燕巢區', '824', 0, 16),
(269, '橋頭區', '825', 0, 16),
(270, '梓官區', '826', 0, 16),
(271, '彌陀區', '827', 0, 16),
(272, '永安區', '828', 0, 16),
(273, '湖內區', '829', 0, 16),
(274, '鳳山區', '830', 0, 16),
(275, '大寮區', '831', 0, 16),
(276, '林園區', '832', 0, 16),
(277, '鳥松區', '833', 0, 16),
(278, '大樹區', '840', 0, 16),
(279, '旗山區', '842', 0, 16),
(280, '美濃區', '843', 0, 16),
(281, '六龜區', '844', 0, 16),
(282, '內門區', '845', 0, 16),
(283, '杉林區', '846', 0, 16),
(284, '甲仙區', '847', 0, 16),
(285, '桃源區', '848', 0, 16),
(286, '那瑪夏區', '849', 0, 16),
(287, '茂林區', '851', 0, 16),
(288, '茄萣區', '852', 0, 16),
(289, '東沙', '817', 0, 17),
(290, '南沙', '819', 0, 17),
(291, '馬公市', '880', 0, 18),
(292, '西嶼鄉', '881', 0, 18),
(293, '望安鄉', '882', 0, 18),
(294, '七美鄉', '883', 0, 18),
(295, '白沙鄉', '884', 0, 18),
(296, '湖西鄉', '885', 0, 18),
(297, '屏東市', '900', 0, 19),
(298, '三地門鄉', '901', 0, 19),
(299, '霧臺鄉', '902', 0, 19),
(300, '瑪家鄉', '903', 0, 19),
(301, '九如鄉', '904', 0, 19),
(302, '里港鄉', '905', 0, 19),
(303, '高樹鄉', '906', 0, 19),
(304, '鹽埔鄉', '907', 0, 19),
(305, '長治鄉', '908', 0, 19),
(306, '麟洛鄉', '909', 0, 19),
(307, '竹田鄉', '911', 0, 19),
(308, '內埔鄉', '912', 0, 19),
(309, '萬丹鄉', '913', 0, 19),
(310, '潮州鎮', '920', 0, 19),
(311, '泰武鄉', '921', 0, 19),
(312, '來義鄉', '922', 0, 19),
(313, '萬巒鄉', '923', 0, 19),
(314, '崁頂鄉', '924', 0, 19),
(315, '新埤鄉', '925', 0, 19),
(316, '南州鄉', '926', 0, 19),
(317, '林邊鄉', '927', 0, 19),
(318, '東港鄉', '928', 0, 19),
(319, '琉球鄉', '929', 0, 19),
(320, '佳冬鄉', '931', 0, 19),
(321, '新園鄉', '932', 0, 19),
(322, '枋寮鄉', '940', 0, 19),
(323, '枋山鄉', '941', 0, 19),
(324, '春日鄉', '942', 0, 19),
(325, '獅子鄉', '943', 0, 19),
(326, '車城鄉', '944', 0, 19),
(327, '牡丹鄉', '945', 0, 19),
(328, '恆春鎮', '946', 0, 19),
(329, '滿州鄉', '947', 0, 19),
(330, '臺東市', '950', 0, 20),
(331, '綠島鄉', '951', 0, 20),
(332, '蘭嶼鄉', '952', 0, 20),
(333, '延平鄉', '953', 0, 20),
(334, '卑南鄉', '954', 0, 20),
(335, '鹿野鄉', '955', 0, 20),
(336, '關山鎮', '956', 0, 20),
(337, '海端鄉', '957', 0, 20),
(338, '池上鄉', '958', 0, 20),
(339, '東河鄉', '959', 0, 20),
(340, '成功鎮', '961', 0, 20),
(341, '長濱鄉', '962', 0, 20),
(342, '太麻里鄉', '963', 0, 20),
(343, '金峰鄉', '964', 0, 20),
(344, '大武鄉', '965', 0, 20),
(345, '達仁鄉', '966', 0, 20),
(346, '花蓮市', '970', 0, 21),
(347, '新城鄉', '971', 0, 21),
(348, '秀林鄉', '972', 0, 21),
(349, '吉安鄉', '973', 0, 21),
(350, '壽豐鄉', '974', 0, 21),
(351, '鳳林鎮', '975', 0, 21),
(352, '光復鄉', '976', 0, 21),
(353, '豐濱鄉', '977', 0, 21),
(354, '瑞穗鄉', '978', 0, 21),
(355, '萬榮鄉', '979', 0, 21),
(356, '玉里鎮', '981', 0, 21),
(357, '卓溪鄉', '982', 0, 21),
(358, '富里鄉', '983', 0, 21),
(359, '金沙鎮', '890', 0, 22),
(360, '金湖鎮', '891', 0, 22),
(361, '金寧鄉', '892', 0, 22),
(362, '金城鎮', '893', 0, 22),
(363, '烈嶼鄉', '894', 0, 22),
(364, '烏坵鄉', '896', 0, 22),
(365, '南竿鄉', '209', 0, 23),
(366, '北竿鄉', '210', 0, 23),
(367, '莒光鄉', '211', 0, 23),
(368, '東引鄉', '212', 0, 23),
(371, '新竹市(北區)', '300', 0, 5),
(372, '新竹市(香山區)', '300', 0, 5),
(373, '嘉義市(西區)', '600', 0, 13);

-- --------------------------------------------------------

--
-- 資料表結構 `uorder`
--

CREATE TABLE `uorder` (
  `orderid` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '訂單編號',
  `emailid` int(10) NOT NULL COMMENT '會員編號',
  `addressid` int(10) NOT NULL COMMENT '收件人編號',
  `howpay` tinyint(4) NOT NULL DEFAULT '1' COMMENT '如何付款',
  `paystatus` int(5) DEFAULT NULL COMMENT '付款狀態',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '訂單處理狀態',
  `remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '備註',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訂單時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `uorder`
--

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `addbook`
--
ALTER TABLE `addbook`
  ADD PRIMARY KEY (`addressid`);

--
-- 資料表索引 `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`caro_id`);

--
-- 資料表索引 `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartid`);

--
-- 資料表索引 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`AutoNo`);

--
-- 資料表索引 `hot`
--
ALTER TABLE `hot`
  ADD PRIMARY KEY (`h_id`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`emailid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- 資料表索引 `multiselect`
--
ALTER TABLE `multiselect`
  ADD PRIMARY KEY (`msid`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- 資料表索引 `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`img_id`);

--
-- 資料表索引 `pyclass`
--
ALTER TABLE `pyclass`
  ADD PRIMARY KEY (`classid`);

--
-- 資料表索引 `town`
--
ALTER TABLE `town`
  ADD PRIMARY KEY (`townNo`);

--
-- 資料表索引 `uorder`
--
ALTER TABLE `uorder`
  ADD PRIMARY KEY (`orderid`);

--
-- 在傾印的資料表使用自動增長(AUTO_INCREMENT)
--

--
-- 使用資料表自動增長(AUTO_INCREMENT) `addbook`
--
ALTER TABLE `addbook`
  MODIFY `addressid` int(10) NOT NULL AUTO_INCREMENT COMMENT '地址ID', AUTO_INCREMENT=7;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `carousel`
--
ALTER TABLE `carousel`
  MODIFY `caro_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '輪播編號', AUTO_INCREMENT=6;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `cart`
--
ALTER TABLE `cart`
  MODIFY `cartid` int(10) NOT NULL AUTO_INCREMENT COMMENT '購物車編號', AUTO_INCREMENT=118;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `city`
--
ALTER TABLE `city`
  MODIFY `AutoNo` int(10) NOT NULL AUTO_INCREMENT COMMENT '城市編號', AUTO_INCREMENT=24;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `hot`
--
ALTER TABLE `hot`
  MODIFY `h_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '熱銷商品流水號', AUTO_INCREMENT=4;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `member`
--
ALTER TABLE `member`
  MODIFY `emailid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'email流水號', AUTO_INCREMENT=2;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `multiselect`
--
ALTER TABLE `multiselect`
  MODIFY `msid` int(5) NOT NULL AUTO_INCREMENT COMMENT '多功能選擇ID', AUTO_INCREMENT=39;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '產品編號', AUTO_INCREMENT=69;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `product_img`
--
ALTER TABLE `product_img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '圖檔編號', AUTO_INCREMENT=314;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `pyclass`
--
ALTER TABLE `pyclass`
  MODIFY `classid` int(3) NOT NULL AUTO_INCREMENT COMMENT '產品類別', AUTO_INCREMENT=118;

--
-- 使用資料表自動增長(AUTO_INCREMENT) `town`
--
ALTER TABLE `town`
  MODIFY `townNo` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '鄕鎮市編號', AUTO_INCREMENT=374;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
