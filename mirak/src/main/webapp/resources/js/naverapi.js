function naverLoginclick() {
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "zkOzac5hPC_Qw6v8eOzQ",
			callbackUrl : "http://localhost:8080/login",
			isPopup : false,
			loginButton: {color: "green", type: 1, height: 60},
			callbackHandle : false
		});
		naverLogin.init();
		
		naverLogin.getLoginStatus(function(status) {
			if (status) {
				var mem_id = naverLogin.user.getEmail();
				if (naverLogin.user.getGender() == 'F') {
					var mem_gender = 2
				} else {
					var mem_gender = 1
				}
				var mem_pw = naverLogin.user.getId();
				var mem_name = naverLogin.user.getName();
				$.ajax({
					type : 'post',
					url : 'naverSave',
					data : {
						'mem_id' : mem_id,
						'mem_gender' : mem_gender,
						'mem_pw' : mem_pw,
						'mem_name' : mem_name
					},
					dataType : "text",
					success : function(responseData) {
						if (responseData == 'loginsuccess') {
							console.log('성공');
							location.href = "/";
						} else if (responseData == 'no') {
							console.log('실패')
						}
					},
					error : function(responseData) {
						console.log('오류 발생')
					}
				})
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	}
	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
		}, 1000);
	}