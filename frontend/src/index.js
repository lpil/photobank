require("./Stylesheets.elm");
const Elm = require("./Main.elm");

const flags = {
  // TODO: Make this configurable between environments
  backendEndpoint: "localhost:4000"
};

const app = Elm.Main.embed(document.getElementById("js-app"), flags);
