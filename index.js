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
