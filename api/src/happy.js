//
// Happy, the Bank GraphQL API.
//
// This module provides `runQuery`, which runs a GraphQL query
// on the API.
//

const graphql = require("graphql");
const path = require("path");
const fs = require("fs");
const resolver = require("./resolver");

const txtSchema = fs
  .readFileSync(path.join(__dirname, "schema.graphql"))
  .toString();
const schema = graphql.buildSchema(txtSchema);

// Run a query against the API.
// Async, returns a promise.
//
function runQuery(query, variables = {}) {
  const context = {};
  return graphql.graphql(schema, query, resolver, context, variables);
}

module.exports = {
  runQuery,
  resolver,
  schema
};
