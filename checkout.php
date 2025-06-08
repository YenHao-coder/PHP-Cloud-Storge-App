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
        .table td,
        .table th {
            padding: 0.75em;
            vertical-align: top;
            border-bottom: none;
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>

<body>
    <section id="header">
        <!-- 引入導覽列 -->
        <?php require_once("navbar.php") ?>
        <!-- 引入 sidebar 分類導覽 -->
        <?php require_once("sidebar_tabs.php") ?>
    </section>
    <section id="content">
        <div class="container-2">

            <!-- 引入結帳模組 -->
            <?php require_once("checkout_content.php") ?>
            
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

    <!-- Modal -->
    <?php
    // 取得所有收件人資料
    $SQLstring = sprintf("SELECT *, city.Name AS ctName, town.Name AS toName FROM addbook,city,town WHERE emailid='%d' AND addbook.myzip = town.Post AND town.AutoNo = city.AutoNo", $_SESSION['emailid']);
    $addbook_rs = $link->query($SQLstring);
    ?>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">收件人資訊</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="">
                        <div class="row">
                            <div class="col">
                                <input type="text" id="cname" name="cname" class="form-control" placeholder="收件人名字">
                            </div>
                            <div class="col">
                                <input type="text" id="mobile" name="mobile" class="form-control" placeholder="收件人電話">
                            </div>
                            <div class="col">
                                <select name="myCity" id="myCity" class="form-control">
                                    <option value="">請選擇市區</option>
                                    <?php $city = "SELECT * FROM `city` WHERE State = 0";
                                    $city_rs = $link->query($city);
                                    while ($city_rows = $city_rs->fetch()) {
                                    ?>
                                        <option value="<?php echo $city_rows['AutoNo']; ?>"><?php echo $city_rows['Name']; ?></option><?php } ?>
                                </select>

                            </div>
                            <div class="col">
                                <select name="myTown" id="myTown" class="form-control">
                                    <option value="">請選擇地區</option>
                                </select>
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col">
                                <input type="hidden" name="myZip" id="myZip" value="">
                                <label for="adress" id="add_label" name="add_label">郵遞區號:</label>
                                <input type="text" name="address" id="address" class="form-control">
                            </div>
                        </div>
                        <div class="row mt-4 justify-content-center">
                            <div class="col-auto"><button type="button" class="color-pink-button" id="recipient" name="recipient">新增收件人</button></div>
                        </div>
                    </form>
                    <hr>
                    <table class="table">
                        <thead class="table-danger">
                            <tr>
                                <th scopr="col">#</th>
                                <th scopr="col">收件人姓名</th>
                                <th scopr="col">電話</th>
                                <th scopr="col">地址</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php while ($data = $addbook_rs->fetch()) { ?>
                                <tr>
                                    <th scope="row"><input type="radio" name="gridRadios" id="gridRadios[]" value="<?php echo $data['addressid']; ?>" <?php echo ($data['setdefault']) ? 'checked' : ''; ?>></th>
                                    <td><?php echo $data['cname']; ?></td>
                                    <td><?php echo $data['mobile']; ?></td>
                                    <td><?php echo $data['myzip'] . $data['ctName'] . $data['toName'] . $data['address']; ?></td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="color-button" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div id="loading" name="loading" style="display:none;position:fixed;width:100%;height:100%;top:0;left:0;background-color:rgba(255, 255, 255, .5);z-index:9999;"><i class="fas fa-spinner fa-spin fa-5x fa-fw" style="position:absolute;top:50%;left:50%;"></i></div>
    <script type="text/javascript">
        /**
         * 系統進行結帳處理
         * 更換收件人處理程序
         * 新增收件人程式
         * 取得縣市代碼後查詢鄉鎮市名稱
         * 將鄉鎮市的名稱從後台資料庫取回
         */
        $(function() {
            $('#btn04').click(function() {
                let msg = "系統將進行結帳處理，請確認產品金額與收件人是否正確!";
                if (!confirm(msg)) return false;
                $('#loading').show();
                let addressid = $('input[name=gridRadios]:checked').val();
                $.ajax({
                    url: 'addorder.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        addressid: addressid,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.href = 'index.php';
                        } else {
                            alert('Database response error:' + data.m);
                        }
                    },
                    error: function(data) {
                        alert('ajax request error');
                    }
                });
            });
            $('input[name=gridRadios]').change(function() {
                let addressid = $(this).val();
                $.ajax({
                    url: 'changeaddr.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        addressid: addressid,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert("Database response error:" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("ajax request error");
                    }
                });
            });
            $('#recipient').click(function() {
                let validate = 0;
                msg = "";
                let cname = $('#cname').val();
                let mobile = $('#mobile').val();
                let myZip = $('#myZip').val();
                let address = $('#address').val();
                if (cname == "") {
                    msg = msg + "收件人不得為空白! ;\n";
                    validate = 1;
                }
                if (mobile == "") {
                    msg = msg + "電話不得為空白! ;\n";
                    validate = 1;
                }
                let checkphone = /^[0]{1}[9]{1}[0-9]{8}$/;
                if (checkphone.test(mobile) == false) {
                    msg = msg + "電話格式有誤! ;\n";
                    validate = 1;
                }
                if (myZip == '') {
                    msg = msg + "郵遞區號不得為空白! ;\n";
                    validate = 1;
                }
                if (address == '') {
                    msg = msg + "地址不得為空白! ;\n";
                    validate = 1;
                }
                if (validate) {
                    alert(msg);
                    return false;
                }
                $.ajax({
                    url: 'addbook.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        cname: cname,
                        mobile: mobile,
                        myZip: myZip,
                        address: address,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            alert(data.m);
                            window.location.reload();
                        } else {
                            alert('Database response error:' + data.m);
                        }
                    },
                    error: function(data) {
                        alert('目前無法連接到後台資料庫');
                    }
                });
            });
            $('#myCity').change(function() {
                var CNo = $('#myCity').val();
                $('#myZip').val("");
                $('#add_label').html('郵遞區號:');
                if (CNo == "") {
                    return false;
                }
                $.ajax({
                    url: 'Town_ajax.php',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        CNo: CNo,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $('#myTown').html(data.m);
                            $('#myZip').val("");
                        } else {
                            alert("Database response error:" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連接到後台資料庫");
                    }
                });
            });
            $('#myTown').change(function() {
                var AutoNo = $('#myTown').val();
                if (AutoNo == "") {
                    $('#myZip').val("");
                    $('#add_label').html("");
                    return false;
                }
                $.ajax({
                    url: 'Zip_ajax.php',
                    type: 'get',
                    dataType: 'json',
                    data: {
                        AutoNo: AutoNo,
                    },
                    success: function(data) {
                        if (data.c == true) {
                            $('#myZip').val(data.Post);
                            $('#add_label').html('郵遞區號' + data.Post + data.Cityname + data.Name);
                        } else {
                            alert("Database response error:" + data.m);
                        }
                    },
                    error: function(data) {
                        alert("系統目前無法連接到後台資料庫");
                    }
                });
            });
        })
    </script>
</body>

</html>