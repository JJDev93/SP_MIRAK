function checkAddressInput() {
    var zipcode = $("#address_input_1").val();
    if (zipcode == "") {
        alert("우편번호를 입력해주세요.");
        return false;
    }
    return true;
}

function checkAgeInput() {
    var ageInput = document.getElementById("age");
    var age = ageInput.value;
    if (age <= 0) {
        alert("나이를 입력해주세요");
        ageInput.focus();
        return false;
    }
    return true;
}