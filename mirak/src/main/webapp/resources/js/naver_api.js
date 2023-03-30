$("#naverIdLogin").click(function () {
  var naverLogin = new naver.LoginWithNaverId({
    clientId: "W_XBZ8KSSrZT5ts3cW9K",
    callbackUrl: "http://localhost:8080/naverResult",
    isPopup: false,
    callbackHandle: true,
  });
  naverLogin.init();
  naverLogin.getLoginStatus(function (status) {
    if (status != null) {
      var userInfo = {
        mem_id: naverLogin.user.getEmail(),
        mem_gender: naverLogin.user.getGender() == "F" ? 2 : 1,
        mem_pw: naverLogin.user.getId(),
        mem_name: naverLogin.user.getName(),
      };

      $.ajax({
        url: "/naverResult",
        method: "POST",
        data: userInfo,
        dataType: "json",
        success: function (data) {
          if (data == "jsonView") {
            window.location.href = "/join";
          } else if (data == "success") {
            window.location.href = "/";
          } else {
            alert("Error occurred.");
          }
        },
        error: function (jqXHR, textStatus, errorThrown) {
          console.log(textStatus, errorThrown);
        },
      });
    }
  });
});