

function fn_idCheck() {
	
	  const emailInput = document.getElementById("id");
	  const email = emailInput.value.trim();
	  const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
		
	
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
            
           
      	 if (!emailRegex.test(email)) {
  		    alert("이메일 형식이 올바르지 않습니다.");
  		    emailInput.focus();
  		    return false;
  		  }

        
          if(data == 1) {
                alert("이미 사용중인 이메일입니다.");
            } else if (data == 0) {
                $("#idCheck").attr("value", "Y");
                alert("사용 가능한 이메일입니다.")
            }
            return true;
        }
    });
}
 