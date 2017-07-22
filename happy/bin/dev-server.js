//
// An express-graphql based HTTP server for testing the
// API in development.
//

const express = require("express");
const expressGraphql = require("express-graphql");
const happy = require("../src/happy");

const graphqlMiddleware = expressGraphql({
  schema: happy.schema,
  rootValue: happy.resolver,
  graphiql: true
});

express().use("/", graphqlMiddleware).listen(4000);
console.log("Running GraphQL API server on port 4000");
