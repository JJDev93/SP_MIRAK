 function fn_idCheck() {
    $.ajax({
        url : "/idCheck",
        type : "POST",
        dataType :"JSON",
        data : {"id" : $("#id").val()},
        success : function (data) {
        	
            if(id.value == ""){
            	alert("이메일을 입력해주세요")
            	return false;
            }
        	
            if(data == 1) {
                alert("이미 사용중인 이메일입니다.");
            } else if (data == 0) {
                $("#idCheck").attr("value", "Y");
                alert("사용 가능한 이메일입니다.")
            };

        }

    })
}
 