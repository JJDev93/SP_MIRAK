function fn_idCheck() {
  console.log("idCheck 함수실행!!!!!!!!!!");
  const emailInput = document.getElementById("id");
  const email = emailInput.value.trim();
  const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  if (id.value == "") {
    alert("이메일을 입력해주세요");
    return false;
  }

  if (!emailRegex.test(email)) {
    alert("이메일 형식이 올바르지 않습니다.");
    emailInput.focus();
    return false;
  }

  $.ajax({
    url: "/idCheck",
    type: "POST",
    dataType: "text",
    data: {
      id: $("#id").val(),
      isApi: "normal",
    },
    success: function (data) {
      console.log(data);
      if (data == "success") {
        $("#idCheck").attr("value", "Y");
        alert("사용 가능한 이메일입니다.");
      } else {
        alert("중복된 아이디입니다.");
      }
      return true;
    },
    error: function (xhr, status, error) {
      console.log("ajax실패");
    },
  });
}
