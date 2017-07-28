const Elm = require("./Main.elm");
const flags = {};
const app = Elm.Main.embed(document.getElementById("js-app"), flags);
