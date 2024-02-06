function boardWriteCheck(){
    let subject = document.getElementById("subjectInput");
    let content = document.getElementById("contentInput");

    let form = document.getElementById("boardWriteForm");

    if (subject.value === "") {
        alert("제목을 입력해주세요")
        subject.focus()
    }else if (content.value === "") {
        alert("내용을 입력해주세요")
        content.focus()
    }else {
        form.submit();
    }

}