<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>보리댕댕</title>
    <style>
        /*
    #FFD88E
    #CAC670
    #90B45E
    #4DA058
    #008a5b
    #007363 */

        @font-face {
            font-family: "Material Icons";
            font-style: normal;
            font-weight: 400;
            src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
            src: local("Material Icons"), local("MaterialIcons-Regular"),
            url(https://example.com/MaterialIcons-Regular.woff2) format("woff2"),
            url(https://example.com/MaterialIcons-Regular.woff) format("woff"),
            url(https://example.com/MaterialIcons-Regular.ttf) format("truetype");
        }

        .material-icons {
            font-family: "Material Icons";
            font-weight: normal;
            font-style: normal;
            font-size: 24px; /* Preferred icon size */
            display: inline-block;
            line-height: 1;
            text-transform: none;
            letter-spacing: normal;
            word-wrap: normal;
            white-space: nowrap;
            direction: ltr; /* Support for all WebKit browsers. */
            -webkit-font-smoothing: antialiased; /* Support for Safari and Chrome. */
            text-rendering: optimizeLegibility; /* Support for Firefox. */
            -moz-osx-font-smoothing: grayscale; /* Support for IE. */
            font-feature-settings: "liga";
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "NanumBarunGothic";
        }

        .none {
            display: none;
        }

        .block {
            display: block;
        }

        .center {
            margin-left: auto;
            margin-right: auto;
        }

        .flex {
            display: flex;
        }

        .z_none {
            z-index: 0 !important;
        }

        .z_display {
            z-index: 999 !important;
        }

        /* Login */
        .container {
            position: relative;
            width: 100%;
            min-height: 100vh;
            overflow: hidden;
            background-color: #fff;
        }

        .forms_container {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        .container::before {
            content: "";
            position: absolute;
            width: 2000px;
            height: 2000px;
            top: -10%;
            right: 48%;
            background-image: linear-gradient(-45deg, #ffeecf 0%, #c0c442 100%);
            transform: translateY(-50%);
            border-radius: 50%;
            z-index: 6;
            transition: 1.8s ease-in-out;
        }

        form {
            padding: 0 5rem;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            grid-column: 1 / 2;
            grid-row: 1 / 2;
        }

        .title {
            font-size: 2.2rem;
            font-weight: bold;
            color: #444;
            margin-bottom: 10px;
        }

        .input_field {
            max-width: 380px;
            width: 100%;
            height: 55px;
            background-color: #f0f0f0;
            margin: 10px 0;
            border-radius: 50px;
            display: grid;
            grid-template-columns: 15% 85%;
            padding: 0 0.4rem;
            position: relative;
        }

        .input_field i {
            text-align: center;
            line-height: 55px;
            color: #acacac;
            font-size: 1.5rem;
        }

        .input_field input {
            background: none;
            outline: none;
            border: none;
            line-height: 1;
            font-weight: 600;
            font-size: 1.2rem;
            color: #333;
        }

        .input_field input::placeholder-shown {
            font-weight: 500;
        }

        .btn {
            width: 150px;
            height: 50px;
            margin: 20px 0;
            outline: none;
            border: none;
            border-radius: 30px;
            background-color: #ffd88e;
            color: white;
            text-decoration: none;
            text-transform: uppercase;
            font-size: 18px;
            font-weight: 600;
            box-shadow: 5px 10px 15px rgba(174, 171, 171, 0.2);
            cursor: pointer;
            transition: all 0.5s;
        }

        .btn:hover {
            background-color: #ffc65b;
        }

        .social_text {
            padding: 0.7rem 0;
        }

        .social_icon {
            width: 35px;
            height: 35px;
            font-size: 18px;
            border: 1px solid #333;
            border-radius: 50%;
            text-decoration: none;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #333;
            transition: all 0.5s;
        }

        .social_icon:hover {
            color: #007363;
            border-color: #007363;
        }

        .signin_signup {
            position: absolute;
            top: 50%;
            left: 75%;
            transform: translate(-50%, -50%);
            display: grid;
            grid-template-columns: 1fr;
            z-index: 5;
        }

        form.sign_in_form {
            z-index: 2;
        }

        form.sign_up_form {
            z-index: 1;
            opacity: 0;
        }

        .panels_container {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
        }

        .panel {
            width: 50vw;
            height: 85vh;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            z-index: 7;
        }

        .left_panel {
            padding: 3rem 17% 2rem 12%;
        }

        .right_panel {
            padding: 3rem 12% 2rem 12%;
        }

        .panel .content {
            color: #fff;
            transition: 0.9s 0.6s ease-in-out;
        }

        .panel h3 {
            font-weight: 600;
            font-size: 2rem;
            line-height: 1;
        }

        .panel p {
            margin: 30px;
        }

        .btn.transparent {
            margin: 0;
            width: 150px;
            height: 50px;
            background: none;
            border: 2px solid #fff;
            box-shadow: none;
            font-weight: 600;
            font-size: 1.2rem;
        }

        .right_panel .content {
            transform: translateX(800px);
        }

        /* Animation */

        .container.sign_up_mode::before {
            transform: translate(100%, -50%);
            right: 52%;
        }

        .container.sign_up_mode .left_panel .content {
            transform: translate(-800px);
        }

        .container.sign_up_mode .right_panel .content {
            transform: translate(0%);
        }

        .container.sign_up_mode .signin_signup {
            left: 25%;
        }

        .container.sign_up_mode form.sign_in_form {
            z-index: 1;
            opacity: 0;
        }

        .container.sign_up_mode form.sign_up_form {
            z-index: 2;
            opacity: 1;
        }
    </style>
    <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet"
    />
    <link
            href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
            rel="stylesheet"
    />
    <script
            src="https://kit.fontawesome.com/58c332dca9.js"
            crossorigin="anonymous"
    ></script>
</head>
<body>
<div class="container">
    <div class="forms_container">
        <div class="signin_signup z_display">
            <form action="/login" class="sign_in_form flex">
                <h2 class="title">Log in</h2>
                <div class="input_field">
                    <i class="fas fa-user"></i>
                    <input type="text" id="userId" name="userId" placeholder="Username" />
                </div>
                <div class="input_field">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="password" name="password" placeholder="Password" />
                </div>
                <input type="submit" class="btn solid" value="Login" />
                <p class="social_text">Or Sign in</p>
                <div class="social_media">
                    <a href="#" class="social_icon flex">
                        <i class="fab fa-google"></i>
                    </a>
                </div>
            </form>
        </div>
        <div class="signin_signup z_none">
            <form action="#" class="sign_up_form flex">
                <p class="title">Sign Up</p>
                <div class="input_field">
                    <i class="fas fa-user"></i>
                    <input type="text" placeholder="Username" />
                </div>
                <div class="input_field">
                    <i class="fas fa-envelope"></i>
                    <input type="email" placeholder="Email" />
                </div>
                <div class="input_field">
                    <i class="fas fa-lock"></i>
                    <input type="password" placeholder="Password" />
                </div>
                <input type="submit" class="btn solid" value="login" />
                <p class="social_text">Or Sign Up</p>
                <div class="social_media">
                    <a href="#" class="social_icon flex">
                        <i class="fab fa-google"></i>
                    </a>
                </div>
            </form>
        </div>
    </div>
    <div class="panels_container">
        <div class="panel left_panel flex z_display">
            <div class="content">
                <h3>New Here?</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos
                    cumque rem sapiente ducimus!
                </p>
                <button
                        class="btn transparent"
                        id="sign_up_button"
                        onclick="sign_up_mode()"
                >
                    Sign Up
                </button>
            </div>
        </div>
        <div class="panel right_panel flex z_none">
            <div class="content">
                <h3>One of us</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos
                    cumque rem sapiente ducimus!
                </p>
                <button
                        class="btn transparent"
                        id="sign_in_button"
                        onclick="sign_in_mode()"
                >
                    Sign In
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    const container = document.querySelector(".container"),
        left_panel = document.querySelector(".left_panel"),
        right_panel = document.querySelector(".right_panel");
    signin_form = document.querySelector(
        ".forms_container > .signin_signup:first-child"
    );
    signup_form = document.querySelector(
        ".forms_container > .signin_signup:last-child"
    );

    function sign_up_mode() {
        container.classList.add("sign_up_mode");

        right_panel.classList.add("z_display");
        right_panel.classList.remove("z_none");

        left_panel.classList.add("z_none");
        left_panel.classList.remove("z_display");

        signin_form.classList.add("z_none");
        signin_form.classList.remove("z_display");

        signup_form.classList.add("z_display");
        signup_form.classList.remove("z_none");
    }

    function sign_in_mode() {
        container.classList.remove("sign_up_mode");

        right_panel.classList.add("z_none");
        right_panel.classList.remove("z_display");

        left_panel.classList.add("z_display");
        left_panel.classList.remove("z_none");

        signin_form.classList.add("z_display");
        signin_form.classList.remove("z_none");

        signup_form.classList.add("z_none");
        signup_form.classList.remove("z_display");
    }
</script>
</body>
</html>
