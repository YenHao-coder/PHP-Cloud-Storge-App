<?php
// 讀取後台購物車內的產品數量
$SQLstring = "SELECT * FROM cart WHERE orderid is NULL AND ip='" . $_SERVER['REMOTE_ADDR'] . "'";
$cart_rs = $link->query($SQLstring)
?>
<?php // 列出產品類別第一層
$SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER by sort";
$pyclass01 = $link->query($SQLstring);
?>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <a class="nav-link" href="index.php" title="回首頁"><i class="fas fa-home"></i></a>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" aria-expanded="false">
                        <i class="fas fa-bars"></i></a>
                    <ul class="dropdown-menu">
                        <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
                            <li class="nav-item dropend">
                                <a href="#" class="dropdown-item dropdown-toggle">
                                    <i class="fas <?php echo $pyclass01_Rows['fonticon']; ?> fa-lg fa-fw"></i><?php echo $pyclass01_Rows['cname']; ?>
                                </a>
                                <?php
                                //列出產品類別對應的第二層資料
                                $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND uplink=%d ORDER BY sort", $pyclass01_Rows['classid']);
                                $pyclass02 = $link->query($SQLstring);
                                ?>
                                <ul class="dropdown-menu">
                                    <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                                        <li><a href="drugstore.php?classid=<?php echo $pyclass02_Rows['classid']; ?>" class="dropdown-item"><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw"></em><?php echo $pyclass02_Rows['cname']; ?></a></li>
                                    <?php } ?>
                                </ul>
                            </li>
                        <?php } ?>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="#">最新活動</a></li>
                <li class="nav-item"><a class="nav-link" href="orderlist.php">查訂單</a></li>
                <li class="nav-item"><a class="nav-link" href="#">折價券</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        企業專區
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">認識企業文化</a></li>
                        <li><a class="dropdown-item" href="#">全台門市資訊</a></li>
                        <li><a class="dropdown-item" href="#">供應商報價服務</a></li>
                        <li><a class="dropdown-item" href="#">加盟專區</a></li>
                        <li><a class="dropdown-item" href="#">投資人專區</a></li>
                    </ul>
                </li>

                <?php if (isset($_SESSION['login'])) { ?>
                    <li class="nav-item px-2"><a class="nav-link" href="javascript:void(0);" onclick="btn_confirmLink('是否確定登出?','logout.php')" title="登出"><?php echo $_SESSION['cname']; ?></a></li><?php } else { ?>
                    <li class="nav-item px-2"><a class="nav-link" href="login.php" title="登入"><i class="far fa-user"></i></a></li><?php } ?>
                <?php
                if (isset($_SESSION['login'])) { ?>
                    <ul class="navbar-nav ms-suto me-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
                                <img src="uploads/<?php echo ($_SESSION['imgname'] != '') ? $_SESSION['imgname'] : 'avatar.svg'; ?>" width="40" height="40" class="rounded-circle">
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="orderlist.php">Order List</a></li>
                                <li><a class="dropdown-item" href="profile.php">Edit Profile</a></li>
                                <li><a class="dropdown-item" href="#" onclick="btn_confirmLink('是否確定登出?','logout.php');">Log Out</a></li>
                            </ul>
                        </li>
                    </ul>
                <?php } ?>
                <li class="nav-item px-2"><a class="nav-link" href="cart.php" title="購物車"><i class="fas fa-shopping-cart"></i><span class="badge text-bg-info"><?php echo ($cart_rs) ? $cart_rs->rowCount() : ""; ?></span></a></li>
                <li class="nav-item px-2"><a class="nav-link" href="#"><i class="far fa-comment" title="會員中心"></i></a></li>
                <li class="nav-item  px-2"><a class="nav-link" href="register.php" title="註冊會員"><i class="fas fa-user-plus"></i></a></li>

            </ul>

        </div>
    </div>
</nav>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <div class="collapse navbar-collapse justify-content-center">

        </div>
    </div>
</nav>
<?php
function multiList01()
{
    global $link;
    // 列出產品類別第一層
    $SQLstring = "SELECT * FROM pyclass WHERE level=1 ORDER by sort";
    $pyclass01 = $link->query($SQLstring);
?>

    <?php while ($pyclass01_Rows = $pyclass01->fetch()) { ?>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <?php echo $pyclass01_Rows['cname']; ?>
            </a>
            <ul class="dropdown-menu">
                <?php //列出產品類別對應的第二層資料
                $SQLstring = sprintf("SELECT * FROM pyclass WHERE level=2 AND uplink=%d ORDER BY sort", $pyclass01_Rows['classid']);
                $pyclass02 = $link->query($SQLstring)
                ?>
                <?php while ($pyclass02_Rows = $pyclass02->fetch()) { ?>
                    <li><a class="dropdown-item" href="drugstore.php?classid=<?php echo $pyclass02_Rows['classid']; ?>"><em class="fas <?php echo $pyclass02_Rows['fonticon']; ?> fa-fw"></em><?php echo $pyclass02_Rows['cname']; ?></a></li>
                <?php } ?>
            </ul>
        </li>
    <?php } ?>
<?php } ?>