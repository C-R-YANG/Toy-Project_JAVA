function moveHomeUrl() {
    location.href = '/index';
}

function moveLoginUrl() {
    location.href = '/login';
}

function jsonToForm(baseParam) {
    const formData = new FormData();

    $.each(baseParam, function(key, value) {
        if (key === "imgFileList") {
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
        data: jsonToForm(param),
        enctype: "multipart/form-data",
        processData: false,
        contentType: false,
        cache: false,
        success: callback,
        error: function() {
            alert("실패");
        },
    })
}