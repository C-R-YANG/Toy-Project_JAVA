const container   = document.querySelector(".container"),
      left_panel  = document.querySelector(".left_panel"),
      right_panel = document.querySelector(".right_panel");
      signin_form = document.querySelector(".forms_container > .signin_signup:first-child");
      signup_form = document.querySelector(".forms_container > .signin_signup:last-child");



function sign_up_mode() {
  container.classList.add("sign_up_mode");

  right_panel.classList.add("z_display"); 
  right_panel.classList.remove("z_none"); 

  left_panel.classList.add("z_none"); 
  left_panel.classList.remove("z_display");   

  signin_form.classList.add("z_none")
  signin_form.classList.remove("z_display")

  signup_form.classList.add("z_display");   
  signup_form.classList.remove("z_none");  
}

function sign_in_mode() {
  container.classList.remove("sign_up_mode");

  right_panel.classList.add("z_none"); 
  right_panel.classList.remove("z_display"); 

  left_panel.classList.add("z_display"); 
  left_panel.classList.remove("z_none"); 

  signin_form.classList.add("z_display")
  signin_form.classList.remove("z_none")

  signup_form.classList.add("z_none");   
  signup_form.classList.remove("z_display");   
}
