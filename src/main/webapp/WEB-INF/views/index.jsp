<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Document</title>
  <style>
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
      font-family: "NanumBarunGothicLight";
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

    .z_none {
      z-index: 0 !important;
    }

    .z_display {
      z-index: 999 !important;
    }

    .btn {
      width: 150px;
      padding: 5px;
      border: none;
      border-radius: 20px;
      text-decoration: none;
      cursor: pointer;
    }

    .flex {
      display: flex;
    }

    #index {
      width: 1100px;
      height: 100%;
      margin: auto;
    }
  </style>

  <link
          href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
          rel="stylesheet"
  />
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
  />
</head>
<body>
<section id="index">
  <section id="header"></section>
  <section id="content"></section>
  <section id="footer"></section>
</section>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    importPage("header");
    importContentPage("home");
    importPage("footer");
  });

  async function fetchHtmlAsText(url) {
    return await (await fetch(url)).text();
  }

  async function importPage(target) {
    const tag = document.querySelector("#" + target),
            newScript = document.createElement("script");

    tag.innerHTML = await fetchHtmlAsText(
            "./common/" + target + "/" + target + ".html"
    );

    newScript.src = "./common/" + target + "/" + target + ".js";

    tag.appendChild(newScript);
  }

  async function importContentPage(target) {
    const content = document.querySelector("#content"),
            newScript = document.createElement("script");

    content.innerHTML = await fetchHtmlAsText(
            "./content/" + target + "/index.html"
    );

    newScript.src = "./content/" + target + "/" + target + ".js";

    content.appendChild(newScript);
  }
</script>
</body>
</html>