// !! FORM
const form = document.getElementById("form");
// !! ID
const id = document.getElementById("inputId");
const idError = document.getElementById("idError");
const idOk = document.getElementById("idOk");
// !! NAME
const name = document.getElementById("inputName");
const nameError = document.getElementById("nameError");
// !! PASSWORD
const password1 = document.getElementById("inputPassword");
const password2 = document.getElementById("inputPasswordConfirm");
const passwordError1 = document.getElementById("passwordError1");
const passwordError2 = document.getElementById("passwordError2");

// !! GENDER
const genderMale = document.getElementById("genderMale");
const genderFemale = document.getElementById("genderFemale");
const genderError = document.getElementById("genderError");

// !! EMAIL
const email1 = document.getElementById("inputEmail");
const email2 = document.getElementById("inputEmailDomain");
const email3 = document.getElementById("email3");
const emailError = document.getElementById("emailError");

let verifiedId = null;

function checkWrite() {
    const idValue = id.value;
    const idCheck = idValue === verifiedId;
    const nameCheck = checkName();
    const emailCheck = checkEmail();
    const passwordCheck = checkPassword();
    const genderCheck = genderMale.checked || genderFemale.checked;

    if (idValue === "") {
        idError.innerHTML = "아이디를 입력 해주세요";
    } else if (idValue !== verifiedId) {
        idError.innerHTML = "중복확인을 해주세요";
        idOk.innerHTML = "";
    }

    if (genderCheck === false) {
        genderError.innerHTML = "성별을 선택해주세요";
    } else {
        genderError.innerHTML = "";
    }

    if (nameCheck && emailCheck && passwordCheck && idCheck) {
        form.submit();
    }
}

function checkName() {
    const nameRegex = /^[가-힣]{2,4}$/;
    if (name.value === "") {
        nameError.innerHTML = "이름을 입력하세요";
        return false;
    } else if (!nameRegex.test(name.value)) {
        nameError.innerHTML = "이름을 제대로 입력하세요";
        return false;
    } else {
        nameError.innerHTML = "";
        return true;
    }
}

function resetId() {
    idError.innerHTML = "";
    idOk.innerHTML = "";
    verifiedId = null;
}
function checkId() {
    const idRegex = /^[a-zA-Z0-9]{4,12}$/;

    idError.innerHTML = "";
    idOk.innerHTML = "";

    if (id.value === "") {
        idError.innerHTML = "아이디를 입력하세요";
    } else if (!idRegex.test(id.value)) {
        idError.innerHTML = "아이디 형식이 올바르지 않습니다";
    } else {
        fetch('isExistId.jsp?id=' + id.value)
            .then(response => response.json())
            .then(data => {
                if (data.isExist) {
                    idError.innerHTML = "이미 사용중인 아이디입니다.";
                } else {
                    idOk.innerHTML = "사용가능한 아이디입니다.";
                    verifiedId = id.value;
                }
            });
    }
}


function checkPassword() {
    const passwordRegex = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;

    if (password1.value === "") {
        passwordError1.innerHTML = "비밀번호를 입력하세요";
        passwordError2.innerHTML = "";
        password2.value = "";
        return false;
    } else if (password1.value.length < 8 || password1.value.length > 16) {
        passwordError1.innerHTML = "비밀번호는 8자 이상 16자 이하로 입력하세요";
        return false;
    } else if (!passwordRegex.test(password1.value)) {
        passwordError2.innerHTML = "비밀번호 형식이 올바르지 않습니다";
        return false;
    } else {
        passwordError1.innerHTML = "";
    }

    if (password2.value !== "" && (password1.value !== password2.value)) {
        passwordError2.innerHTML = "비밀번호가 다릅니다";
        return false;
    } else {
        passwordError2.innerHTML = "";
        return true;
    }
}

function checkEmail() {
    if (email3.value !== "") {
        email2.value = email3.value;
    }

    const emailError = document.getElementById("emailError");
    const email1Regex = /^[a-zA-Z0-9._-]$/;
    const email2Regex = /^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

    if (email1.value === "" || email2.value === "") {
        emailError.innerHTML = "이메일을 입력하세요";
        return false;
    } else if (!email1Regex.test(email1.value) && !email2Regex.test(email2.value)) {
        emailError.innerHTML = "이메일 형식이 올바르지 않습니다";
        email2.focus();
        return false;
    } else {
        emailError.innerHTML = "";
        return true;
    }
}

function resetEmail() {
    email3.value = "";
}

function resetForm() {
    form.reset();
    nameError.innerHTML = "";
    idError.innerHTML = "";
    idOk.innerHTML = "";
    passwordError1.innerHTML = "";
    passwordError2.innerHTML = "";
    genderError.innerHTML = "";
    emailError.innerHTML = "";
}

function searchPost() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
        }
    }).open();
}

function checkUpdate() {
    const nameCheck = checkName();
    const emailCheck = checkEmail();
    const passwordCheck = checkPassword();

    if (nameCheck && emailCheck && passwordCheck) {
        form.submit();
    }
}