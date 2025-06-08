<!-- 會員 CSS 樣式設定 -->
<style type="text/css">
    
    /* Card component */
    .mycard.mycard-container {
        max-width: 400px;
        height: 450px;
    }

    .mycard {
        background-color: #f7f7f7;
        padding: 20px 25px 30px;
        margin: 0 auto 25px;
        margin-top: 25px;
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
    }

    .profile-img-card {
        margin: 0 auto 10px auto;
        display: block;
        width: 100px;
    }

    .profile-name-card {
        font-size: 20px;
        text-align: center;
    }

    .form-signin input[type="email"],
    .form-signin input[type="password"],
    .form-signin button {
        width: 100%;
        height: 44px;
        font-size: 16px;
        display: block;
        margin-bottom: 20px;
    }

    .btn.btn-signin {
        font-weight: 700;
        background-color: rgb(104, 145, 162);
        color: #fff;
        height: 38px;
        transition: background-color 1s;
    }

    .btn.btn-signin:hover,
    .btn.btn-signin:active,
    .btn.btn-signin:focus {
        color: rgb(12, 97, 33);
    }
</style>

<!-- 會員登入HTML頁面 -->
<div class="mycard mycard-container">
    <img src="images/logo03.svg" alt="logo" id="profile-img" class="profile-img-card">
    <p id="profile-name" class="profile-name-card">電商甜點: 會員登入</p>
    <form action="" class="form-signin" id="form1" method="POST">
        <input type="email" name="inputAccount" id="inputAccount" class="form-control" placeholder="Account" required autofocus>
        <input type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="Password" required>
        <button type="submit" class="btn btn-signin mt-4">Sign in</button>
    </form>
    <div class="other mt-5 text-center"><a href="register.php">New user | </a><a href="#"> Forget the password?</a></div>
</div>