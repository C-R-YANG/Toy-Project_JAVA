const change = document.querySelector(".pw_change");

function pwNew(obj) {
  const pwNew    = obj.value,
        reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/.test(pwNew);
  
  reg ? change.style.color = "#acacac" : change.style.color = "red";
}
