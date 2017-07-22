import test from "ava";
import happy from "../src/happy";

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
  const result = await happy.runQuery();

  t.deepEqual(result, {
    errors: [new TypeError("Must provide Source. Received: undefined")]
  });
});
