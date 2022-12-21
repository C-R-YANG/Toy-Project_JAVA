function moveHomeUrl() {
    location.href = '/index';
}

function moveLoginUrl() {
    location.href = '/login';
}

function jsonToForm(baseParam) {
    const formData = new FormData();

    $.each(baseParam, function(key, value) {
        if (key && value) {
            formData.append(key, value);
        }
    })
}