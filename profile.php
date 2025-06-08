<!-- 將資料庫連線程式載入 -->
<?php require_once('Connections/conn_db.php'); ?>
<!-- 如果SESSION沒有啟動，則啟動SESSION功能，這是跨網頁變數存取 -->
<?php (!isset($_SESSION)) ? session_start() : ""; ?>
<?php require_once("php_lib.php") ?>
<?php
//驗證是否帳號登入
if (!isset($_SESSION['login'])) {
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
        .input-group>.form-control {
            width: 100%;
        }

        span.error-tips,
        span.error-tips::before {
            font-family: "Font Awesome 5 Free";
            color: red;
            font-weight: 900;
            content: '\f06a';
        }

        span.valid-tips,
        span.valid-tips::before {
            color: greenyellow;
            font-family: "Font Awesome 5 Free";
            font-weight: 900;
            content: '\f00c';
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

    <section id="content">
        <div class="container-2">                     
            <!-- 會員註冊頁面 -->
            <?php require_once("profile_content.php") ?>                    
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
    <script type="text/javascript" src="./commlib.js"></script>
    <script type="text/javascript" src="./jquery.validate.js"></script>
    <script src="https://unpkg.com/vue@3"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript">
        /**
         * 取得會員emailid
         * 會員資料更新陣列
         * 存認證碼變數
         * 資料讀取模式或是編輯模式
         * 密碼更改存舊密碼變數
         * 密碼更改存舊密碼變數1
         * 密碼更改存舊密碼變數2
         * 使用第三方AJAX的API，取得使用者資料
         */
        const Vue3 = Vue.createApp({
            data() {
                return {
                    emailid: <?php echo $_SESSION['emailid'] ?>,
                    member: [],
                    captcha: '',
                    readonly: true,
                    PWOld: '',
                    PWNew1: '',
                    PWNew2: '',
                }
            },
            methods: {
                async savePW() {
                    //修改後密碼存至後台資料庫
                    let valid = $('#changePW').valid();
                    if (valid) {
                        await axios.get('reqchangePW.php', {
                                params: {
                                    emailid: this.member.emailid,
                                    PWNew1: MD5(this.PWNew1),
                                }
                            })
                            .then((res) => {
                                let data = res.data;
                                if (data.c == true) {
                                    $('#changePW').validate().resetForm();
                                    this.PWOld = '';
                                    this.PWNew1 = '';
                                    this.PWNew2 = '';
                                    $('#mClose').click();
                                    alert(data.m);
                                }
                            })
                            .catch(function(error) {
                                alert(error);
                            });
                    }
                },
                async saveMember() {
                    // 呼叫資料驗證函數
                    let valid = $('#reg').valid();
                    if (valid) {
                        let imgfile = $('#uploadname').val();
                        if (imgfile != '') {
                            this.member.imgname = imgfile;
                        }
                        await axios.get('reqMember.php', {
                                params: {
                                    birthday: this.member.birthday,
                                    cname: this.member.cname,
                                    emailid: this.member.emailid,
                                    imgname: this.member.imgname,
                                    tssn: this.member.tssn,
                                }
                            })
                            .then((res) => {
                                let data = res.data;
                                if (data.c == true) {
                                    alert(data.m);
                                    location.reload();
                                }
                            })
                            .catch(function(error) {
                                alert(error);
                            });
                    }
                },
                editMember() {
                    this.readonly = false;
                },
                getMemberInfo() {
                    axios.get('memberinfo.php', {
                            params: {
                                emailid: this.emailid,
                            }
                        })
                        .then((res) => {
                            let data = res.data;
                            if (data.c == true) {
                                this.member = data.d[0];
                            } else {
                                alert(data.m);
                            }
                        })
                        .catch(function(error) {
                            alert("系統目前無法連接到後台資料庫");
                        });
                },
                /** 
                 * 取得認證碼
                 * can 為 canvas 的 ID 名稱
                 * 150寬, 50高, blue背景
                 * white顏色, 28px大小, 5長度
                 */
                getCaptcha() {
                    this.captcha = captchaCode("can", 150, 50, "blue", "white", "28px", 5);
                },
            },
            mounted() {
                this.getCaptcha();
                this.getMemberInfo();
            }
        });
        Vue3.mount('#modify');
        /**
         * 自訂身分證格式驗證
         * 驗證 form #reg 表單
         */
        function getCaptcha() {
            var inputTxt = document.getElementById('captcha');
            inputTxt.value = captchaCode("can", 150, 50, "#00f270", "white", "28px", 7);
        }

        $(function() {
            jQuery.validator.addMethod("tssn", function(value, element, param) {
                var tssn = /^[a-zA-Z]{1}[1-2]{1}[0-9]{8}$/;
                return this.optional(element) || (tssn.test(value));
            });
            //驗證form #reg表單
            $('#reg').validate({
                onfocusout: false,
                rules: {
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
                    recaptcha: {
                        required: true,
                        equalTo: '#captcha',
                    },
                },
                messages: {
                    cname: {
                        required: "使用者名稱不得為空白!!",
                    },
                    tssn: {
                        required: '使用者身分證不得為空白!!',
                        tssn: '身分證ID格式有誤',
                    },
                    birthday: {
                        required: '生日不得為空白!!',
                    },
                    recaptcha: {
                        required: '驗證碼不得為空白!!',
                        equalTo: '驗證碼需相同!!',
                    },
                },
            });
            // 驗證changePW變更密碼表單
            $('#changePW').validate({
                rules: {
                    PWOld: {
                        required: true,
                        remote: 'checkPW.php?emailid=<?php echo $_SESSION['emailid']; ?>',
                    },
                    PWNew1: {
                        required: true,
                        maxlength: 20,
                        minlength: 8,
                    },
                    PWNew2: {
                        required: true,
                        equalTo: '#PWNew1',
                    },
                },
                messages: {
                    PWOld: {
                        required: '會員密碼不得空白!!',
                        remote: '原始密碼有錯誤，需重新輸入',
                    },
                    PWNew1: {
                        required: '密碼不得為空白!!',
                        maxlength: '密碼最大長度為20位(8-20為英文字母與數字組合)',
                        minlength: '密碼最小長度為8位(8-20為英文字母與數字組合)',
                    },
                    PWNew2: {
                        required: '確認密碼不得為空白!!',
                        equalTo: '兩次輸入的密碼必須一致',
                    },
                },
            });
        })


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
    </script>
</body>

</html>