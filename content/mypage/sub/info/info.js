const reg = "^(?=.*[A-Za-z])(?=.*d)(?=.*[@$!%*#?&])[A-Za-zd@$!%*#?&]{8,16}$";
const txt = "aaaa";

if (!reg.test(txt)) {
  alert("다시해");
  return false;
}

function pwValue(pw) {
  const pw = document.getElementById("pw").value;
  const reg = "^(?=.*[A-Za-z])(?=.*d)(?=.*[@$!%*#?&])[A-Za-zd@$!%*#?&]{8,16}$";

  if (!reg.test(pw)) {
    alert("다시해");
  }
}
