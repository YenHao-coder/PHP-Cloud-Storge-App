//跳出確認訊息對話框
function btn_confirmLink(message, url) {
  if (message == "" || url == "") {
    return false;
  }
  if (confirm(message)) {
    window.location = url;
  }
  return false;
}
// 將產品p_id加入購物車
function addcart(p_id) {
  let qty = $("#qty").val();
  if (qty <= 0) {
    alert("產品數量不得為0或為負數，請修改數量!");
    return false;
  }
  if (qty == undefined) {
    qty = 1;
  } else if (qty >= 15) {
    alert("由於採購限制，產品數量金限制在15以下!");
    return false;
  }

  // 利用jquery $.ajax函數呼叫後台的addcart.php
  $.ajax({
    url: "addcart.php",
    type: "get",
    dataType: "json",
    data: {
      p_id: p_id,
      qty: qty,
    },
    success: function (data) {
      if (data.c == true) {
        alert(data.m);
        window.location.reload();
      } else {
        alert(data.m);
      }
    },
    error: function (data) {
      alert("系統目前無法連接到後台資料庫。");
    },
  });
}

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

