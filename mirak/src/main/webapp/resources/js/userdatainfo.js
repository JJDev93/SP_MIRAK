function confirmUpdateApiMember() {
   if (confirm("회원정보를 수정하시겠습니까?")) {
      alert("회원 수정 되었습니다.");
      return true;
   } else {
      return false;
   }
}

function confirmUpdateMember() {
   var gender = $('input[name=mem_gender]:checked').val();
   if (confirm("회원정보를 수정하시겠습니까?")) {
      $.ajax({
         url : "/memupdate",
         type : "POST",
         dataType : "JSON",
         data : {
            "mem_id" : $("#mem_id").val(),
            "rawPw" : $("#rawPw").val(),
            "mem_pw" : $("#mem_pw").val(),
            "mem_name" : $("#mem_name").val(),
            "mem_age" : $("#mem_age").val(),
            "mem_gender" : gender,
            "mem_phone" : $("#mem_phone").val(),
            "mem_zipcode" : $("#address_input_1").val(),
            "mem_add1" : $("#address_input_2").val(),
            "mem_add2" : $("#address_input_3").val()
         },
         success : function(data) {
            if (data == "0") {
               alert("비밀번호가 틀렸습니다.");
               document.getElementById('rawPw').value = '';
               document.getElementById('rawPw').focus();
            } else if (data == "1") {
               alert("회원 수정 되었습니다.");
               location.href = "/mypage";
            }
         }
      });
      return true;
   } else {
      return false;
   }
}

function confirmUpdatePw() {
   if (confirm("비밀번호를 수정하시겠습니까?")) {
      $.ajax({
         url : "/updatePw",
         type : "POST",
         dataType : "JSON",
         data : {
            "mem_id" : $("#mem_id").val(),
            "mem_pw" : $("#mem_pw").val(),
            "befo_pw" : $("#befo_pw").val(),
            "new_pw" : $("#new_pw").val()
         },
         success : function(data) {
            if (data == "0") {
               alert("기존 비밀번호가 틀렸습니다.");
               document.getElementById('befo_pw').value = '';
               document.getElementById('befo_pw').focus();
            } else if (data == "1") {
               alert("비밀번호가 수정 되었습니다.");
               location.href = "/mypage";
            }
         }
      });
      return true;
   } else {
      return false;
   }
}

//회원탈퇴
function confirmDeleteMem() {
   if (pw_1.value == "") {
      alert("비밀번호를 입력해주세요");
   } else {
      $.ajax({
         url : "/memdelete",
         type : "POST",
         dataType : "JSON",
         data : {
            "mem_id" : $("#mem_id").val(),
            "mem_pw" : $("#mem_pw").val(),
            "rawPw" : $("#pw_1").val()
         },
         success : function(data) {
            if (data == "0") {
               alert("비밀번호가 틀렸습니다.");
               document.getElementById('pw_1').value = '';
            }else if (data == "2") {
               alert("3개월 이내 결제내역이 있습니다. 이후에 탈퇴를 진행해 주세요.");
            }else if (data == "1") {
               alert("회원탈퇴 되었습니다.");
            }
         }
      });
   }
}