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
    <style type="text/css">
        .input-group>.form-control {
            width: 100%;
        }

        span.error-tips,
        span.error-tips::before {
            font-family: "Font Awesome 5 Free";
            color:red;
            font-weight: 900;
            content:'\f06a';
        }
        span.valid-tips,
        span.valid-tips::before{
            color:greenyellow;
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            content:'\f00c';
        }
    </style>
</head>

<body>
    <section id="header">
        <!-- 引入導覽列 -->
        <?php require_once("navbar.php") ?>
    </section>
    <?php
    /*表單提交資料寫入資料庫
    讀取更新的會員編號
    電話、姓名、地址寫入 addbook
    註冊完成後直接登入
    */
    if(isset($_POST['formct1']) && $_POST['formct1'] == 'reg'){
        $email = $_POST['email'];
        $pw1 = md5($_POST['pw1']);
        $cname = $_POST['cname'];
        $tssn = $_POST['tssn'];
        $birthday = $_POST['birthday'];
        $mobile = $_POST['mobile'];
        $myzip = $_POST['myZip'] == ''? null : $_POST['myZip'];
        $address = $_POST['address'] == ''? null : $_POST['address'];
        $imgname = $_POST['uploadname'] == ''? 'avatar.svg' : $_POST['uploadname'];
        $insertsql = "INSERT INTO member (email, pw1, cname, tssn, birthday, imgname) VALUES ('" .$email. "','" .$pw1. "','" .$cname. "','" .$tssn. "','" .$birthday. "','" .$imgname. "')";
        $Result = $link->query($insertsql);
        $emailid = $link->lastInsertId();
        if($Result){
            $insertsql = "INSERT INTO addbook (emailid, setdefault, cname, mobile, myzip, address) VALUES ('" .$emailid. "', '1','" .$cname. "','" .$mobile. "','" .$myzip. "','" .$address. "')";
            $Result = $link->query($insertsql);
            $_SESSION['login'] = true;
            $_SESSION['emailid'] = $emailid;
            $_SESSION['email'] = $email;
            $_SESSION['cname'] = $cname;
            $_SESSION['imgname'] = $imgname;
            echo "<script language = 'javascript'>alert('謝謝您，會員資料已註冊完成');location.href='index.php';</script>";
        }else{
            echo "<script language = 'javascript'>alert('註冊失敗');location.href='register.php';</script>";
        }
        
    }
    ?>
        <!-- 引入 sidebar 分類導覽 -->
        <?php require_once("sidebar_tabs.php") ?>
        <div class="container-2">
            <section id="content">                                
                <!-- 會員註冊頁面 -->    
                <div class="text-center color_495057">
                    <h1><span class="color_ec7a9a">會員註冊頁面</span></h1>
                    <p>請輸入相關資料，*為必須輸入欄位</p>
                </div>
                    
                <div class="row">
                    <div class="col-8 offset-2 text-left">
                        <form method="POST" name="reg" action="register.php" id="reg">
                            <div class="input-group mb-3">
                                
                                <input type="email" name="email" id="email" class="form-control" placeholder="* 請輸入email帳號" autocomplete="off">
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" name="pw1" id="pw1" class="form-control" placeholder="* 請輸入密碼">
                            </div>
                            <div class="input-group mb-3">
                                <input type="password" name="pw2" id="pw2" class="form-control" placeholder="* 請再次確認密碼">
                            </div>
                            <div class="input-group mb-3">
                                <input type="text" name="cname" id="cname" class="form-control" placeholder="* 請輸入姓名">
                            </div>
                            <div class="input-group mb-3">
                                <input type="text" name="tssn" id="tssn" class="form-control" placeholder="請輸入身分證字號">
                            </div>
                            <div class="input-group mb-3">
                                <input type="text" name="birthday" id="birthday" onfocus="(this.type = 'date')" class="form-control" placeholder="* 請選擇生日">
                            </div>
                            <div class="input-group mb-3">
                                <input type="text" name="mobile" id="mobile" class="form-control" placeholder="* 請輸入手機號碼">
                            </div>
                            <div class="input-group mb-3">
                                <select name="myCity" id="myCity" class="form-control">
                                    <option value="">請選擇市區</option>
                                    <?php
                                    $city = "SELECT * FROM city WHERE State=0";
                                    $city_rs = $link->query($city);
                                    while ($city_rows = $city_rs->fetch()) { ?>
                                        <option value="<?php echo $city_rows['AutoNo']; ?>"><?php echo $city_rows['Name']; ?></option>
                                    <?php } ?>

                                </select>
                            </div>
                            <div class="input-group mb-3">
                                <select name="myTown" id="myTown" class="form-control">
                                    <option value="">請選擇地區</option>
                                </select>
                            </div>
                            <label for="address" class="form-label" id="zipcode" name="zipcode">郵遞區號:地址</label>
                            <div class="input-group mb-3">
                                <input type="hidden" name="myZip" id="myZip" value="">
                                <input type="text" name="address" id="address" class="form-control" placeholder="請輸入後續地址: ">
                            </div>
                            <label for="fileToUpload" class="form-label">上傳相片: </label>
                            <div class="input-group mb-3">
                                <input type="file" id="fileToUpload" name="fileToUpload" class="form-control" title="請上傳相片圖示" accept="image/x-png,image/jpeg,image/gif,image/jpg">                           
                                <div id="progress-div01" class="progress" style="width:100%;display:none;">
                                    <div id="progress-bar01" class="progress-bar progress-bar-striped" role="progressbar" style="width:0%;" aria-valuenow="10" aria-valuemin="0 " aria-valuemax="100">0%</div>
                                </div>
                                <input type="hidden" name="uploadname" id="uploadname" value="" />
                                <img src="" alt="photo" id="showimg" name="showimg" style="display:none;" class="img-fluid">
                            </div>
                            <div class="input-group mb-3">
                                <p><button type="button" class="color-pink-button" id="uploadForm" name="uploadForm">開始上傳</button></p>
                            </div>
                            <div class="input-group mb-3">
                                <input type="hidden" name="captcha" id="captcha">
                                <a href="javascript:void(0)" title="按我更新認證碼" onclick="getCaptcha();">
                                    <canvas id="can"></canvas>
                                </a>
                                <input type="text" name="recaptcha" id="recaptcha" class="form-control" placeholder="請輸入認證碼">
                            </div>
                            <input type="hidden" name="formct1" id="formct1" value="reg">
                            <div class="input-group mb-3">
                                <button type="submit" class="color-pink-button">送出</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
    <script type="text/javascript" src="./commlib.js"></script>
    <script type="text/javascript" src="./jquery.validate.js"></script>
    <script type="text/javascript">
        /**
         * 自訂身分證格式驗證
         * 自訂手機格式驗證
         * 自訂郵遞區號驗證
         * 驗證 form #reg表單
         */
        jQuery.validator.addMethod("tssn", function(value, element, param){
            var tssn = /^[a-zA-Z]{1}[1-2]{1}[0-9]{8}$/;
            return this.optional(element) || (tssn.test(value));
        });
        jQuery.validator.addMethod("checkphone", function(value, element, param){
            var checkphone =/^[0]{1}[9]{1}[0-9]{8}$/;
            return this.optional(element) || (checkphone.test(value));
        });
        jQuery.validator.addMethod("checkMyTown", function(value, element, param){
            return (value !== "");
        });
        $('#reg').validate({
            rules: {
                email: {
                    required: true,
                    email: true,
                    remote: 'checkemail.php'
                },
                pw1: {
                    required: true,
                    maxlength: 20,
                    minlength: 8,
                },
                pw2: {
                    required: true,
                    equalTo: '#pw1',
                },
                cname: {
                    required: true,
                },
                tssn: {
                    required: true,
                    tssn: true,
                },
                birthday: {
                    required: true,
                },
                mobile: {
                    required: true,
                    checkphone: true,
                },
                address: {
                    required: true,
                },
                myTown: {
                    checkMyTown: true,
                },
                recaptcha: {
                    required: true,
                    equalTo: '#captcha',
                },
            },
            messages: {
                email: {
                    required: " email信箱不得為空白",
                    email: ' email信箱格式有誤',
                    remote: ' email信箱已註冊'
                },
                pw1: {
                    required: '密碼不得為空白',
                    maxlength: '密碼最大長度為20位(8-20位英文字母與數字的組合)',
                    minlength: '密碼最小長度為8位(8-20位英文字母與數字的組合)',
                },
                pw2: {
                    required: '確認密碼不得為空白',
                    equalTo: '兩次輸入的密碼必須一致！',
                },
                cname: {
                    required: '使用者名稱不得為空白',
                },
                tssn: {
                    required: '身份證ID不得為空白',
                    tssn: '身份證ID格式有誤',
                },
                birthday: {
                    required: '生日不得為空白',
                },
                mobile: {
                    required: '手機號碼不得為空白',
                    checkphone: '手機號碼格式有誤',
                },
                address: {
                    required: '地址不得為空白',
                },
                myTown: {
                    checkMyTown: '需選擇郵遞區號',
                },
                recaptcha: {
                    required: '驗證碼不得為空白！',
                    equalTo: '驗證碼需相同！',
                },
            },
        });
        /**
         *  element ID
         * 圖示上傳處理
         * 顯示上傳過程百分比
         * 上傳完成處理顯示圖片
         */
        function getId(el) {
            return document.getElementById(el);
        }
        $("#uploadForm").click(function(e) {
            var fileName = $('#fileToUpload').val();
            var idxDot = fileName.lastIndexOf(".") + 1;
            let extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
            if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == "gif") {
                $('#progress-div01').css("display", "flex");
                let file1 = getId("fileToUpload").files[0];
                let formdata = new FormData();
                formdata.append("file1", file1);
                let ajax = new XMLHttpRequest();
                ajax.upload.addEventListener("progress", progressHandler, false);
                ajax.addEventListener("load", completeHandler, false);
                ajax.addEventListener("error", errorHandler, false);
                ajax.addEventListener("abort", abortHandler, false);
                ajax.open("POST", "file_upload_parser.php");
                ajax.send(formdata);
                return false;
            } else {
                alert('目前只支援jpg, jpeg, png, gif檔案格式上傳!');
            }
        });

        function progressHandler(evnet) {
            let percent = Math.round((event.loaded / event.total) * 100);
            $("#progress-bar01").css("width", percent + "%");
            $("#progress-bar01").html(percent + "%");
        }

        function completeHandler(event) {
            let data = JSON.parse(event.target.responseText);
            if (data.success == 'true') {
                $('#uploadname').val(data.fileName);
                $('#showimg').attr({
                    'src': 'uploads/' + data.fileName,
                    'style': 'display:block;'
                });
                $('button.btn.btn-danger').attr({
                    'style': 'display:none;'
                });
            } else {
                alert(data.error);
            }
        }

        function errorHandler(event) {
            alert('Upload Failed: 上傳發生錯誤');
        }

        function abortHandler(event) {
            alert('Upload Aborted: 上傳作業取消');
        }
        /** 
         * 取得認證碼
         * can 為 canvas 的 ID 名稱
         * 150寬, 50高, blue背景
         * white文字, 28px大小, 5長度
         */
        function getCaptcha() {
            var inputTxt = document.getElementById('captcha');
            inputTxt.value = captchaCode("can", 250, 80, "#495057", "white", "32px", 7);
        }
        /**
         * 啟動認證碼功能
         * 取得縣市代碼後查詢鄉鎮市名稱
         * 將鄉鎮市的名稱從後台資料庫取回
         * 取得鄉鎮市代碼，查詢郵遞區號放入#myZip, #zipcode
         */
        $(function() {
            getCaptcha()
            $('#myCity').change(function() {
                var CNo = $('#myCity').val();
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
                            alert(data.m);
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
                            $('#zipcode').html(data.Post + data.Cityname + data.Name);
                        } else {
                            alert(data.m);
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