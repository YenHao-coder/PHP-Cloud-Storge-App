//使用jquery將img插入body中
$(function () {
  $("body").append(
    "<img id='goTopButton' style='display: none; z-index:5; cursor:pointer;' title='回到頂端'/>"
  );
  var img = "bntop01.png", //宣告變數設定圖檔名稱
    location = 0.8, //按鈕出現在螢幕的高度
    right = 18, //距離右邊px值
    opacity = 0.5, //預設透明度
    speed = 800, // 返回TOP捲動速度
    $button = $("#goTopButton"), //定義Jquery呼叫圖片ID
    $body = $(document), //定義Jquery網頁
    $win = $(window); //定義jquery瀏覽器chrome
  $button.attr("src", img); //將圖設定到goTopButton的src

  //建立當網頁捲動時，呼叫自訂函數
  window.goTopMove = function () {
    //從網頁取得與頂端距離的數值，約為75-165 px之間
    var scrollH = $body.scrollTop(),
      winH = $win.height(), //從瀏覽器取得高度
      css = {
        top: winH * location + "px",
        position: "fixed",
        right: right,
        opacity: opacity,
      }; //將參數設定CSS。

    // 如果捲動與網頁頂端超過20px時，則顯示圖片，否則隱藏圖片。
    if (scrollH > 20) {
      $button.css(css);
      $button.fadeIn("slow");
    } else {
      $button.fadeOut("slow");
      css = { transform: "none", transition: "none" };
      $button.css(css);
    }
  };

  //設定瀏覽器監聽兩個動作，分別為scroll與resize
  $win.on({
    scroll: function () {
      goTopMove();
    },
    resize: function () {
      goTopMove();
    },
  });

  //設定瀏覽器監聽圖片三個動作，分別為1滑鼠滑過去2滑鼠滑出去與3按下動作
  $button.on({
    mouseover: function () {
      $button.css("opacity", 1);
    },
    mouseout: function () {
      $button.css("opacity", opacity);
    },
    click: function () {
      //點擊圖示返回TOP時，加上旋轉特效
      css = {
        transform: "rotate(720deg)",
        transition: "transform 1s ease 0s",
      };
      $button.css(css);
      $("html, body").animate({ scrollTop: 0 }, speed);
    },
  });
});
