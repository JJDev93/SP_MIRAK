function apiDelete() {
		const element = document.getElementById('mail_check_input_box_warn');
		// 인증번호 입력란에서 값을 가져옴
		var authCode = document.getElementById("mail_check_input").value;

		// 인증번호가 비어 있으면 경고창을 띄우고 함수를 종료
		if (authCode.trim() === '') {
			alert("인증번호를 입력해주세요.");
			return;
		} else if (element.classList.contains('correct')) {
			// 탈퇴 API 호출
			$.ajax({
				url : "/apidelete",
				type : "POST",
				data : {
					"mem_id" : $("#mem_id").val(),
					"mem_pw" : $("#mem_pw").val()
				},
				success : function(data) {
					if (data == "0") {
						alert("회원탈퇴 실패하였습니다.");
					} else if (data == "1") {
						alert("회원탈퇴 되었습니다.");
						location.href = "/";
					}
				}

			});
		}
	}