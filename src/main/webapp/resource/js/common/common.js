function moveHomeUrl() {
    location.href = '/index';
}

function moveLoginUrl() {
    location.href = '/login';
}

function jsonToForm(baseParam) {
    // 폼데이터 세팅
    const formData = new FormData();

    // baseParam(json) 반복문 처리(key, value)
    $.each(baseParam, function(key, value) {
        // key가 imgFileList일 경우
        if (key === "imgFileList") {
            // imgFileList = [{file:file, size:size}] => imgFileList[0] = {file:file, size:size} 형태로 변환
            $.each(value, function (subKey, subValue) {
                formData.append(key + "[" + subKey + "]", subValue);
            })
        } else {
            formData.append(key, value);
        }
    })

    return formData;
}

function postFormData(url, param, callback) {
    $.ajax({
        url: url,
        type: "POST",
        data: jsonToForm(param),            // Json형식 데이터를 Form형식으로 변환
        enctype: "multipart/form-data",     // 파라미터 타입을 세팅
        processData: false,
        contentType: false,
        cache: false,
        success: callback,
        error: function() {
            alert("실패");
        },
    })
}