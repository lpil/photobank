import * as test from "tape";
import * as happy from "../src/happy";

test("Hello, world!", async t => {
  t.plan(1);
  const result = await happy.runQuery(`
  query MyQuery {
    hello
  }`);

  t.deepEqual(result, {
    data: { hello: "Hello, world!" }
  });
});

test("running no query returns an error", async t => {
  t.plan(1);
  const result = await happy.runQuery("");

  t.deepEqual(result, {
    errors: [
      {
        locations: [{ column: 1, line: 1 }],
        message:
          "Syntax Error GraphQL request (1:1) Unexpected <EOF>\n\n1: \n   ^\n",
        path: undefined
      }
    ]
  });
});
