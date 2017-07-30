//
// Happy, the Bank GraphQL API.
//
// This module provides `runQuery`, which runs a GraphQL query
// on the API.
//

import * as graphql from "graphql";
import * as path from "path";
import * as fs from "fs";
import * as resolver from "./resolver";

const txtSchema = fs
  .readFileSync(path.join(__dirname, "schema.graphql"))
  .toString();

export const schema = graphql.buildSchema(txtSchema);

// Run a query against the API.
// Async, returns a promise.
//
export function runQuery(
  query: string,
  variables: object = {}
): Promise<object> {
  const context = {};
  return graphql.graphql(schema, query, resolver, context, variables);
}
