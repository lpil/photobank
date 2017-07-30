import * as fs from "fs";
import * as test from "tape";
import * as happy from "../src/happy";

test("frontend/getInitialPosts.graphql", async t => {
  t.plan(1);
  const query = fs
    .readFileSync("../frontend/queries/getInitialPosts.graphql")
    .toString();
  const result = await happy.runQuery(query);

  t.deepEqual(result, {
    data: {
      posts: [
        {
          id: 1,
          text: "Hello, world!",
          image: null,
          author: { id: 1, avatar: "one.png", name: "Jane" }
        },
        {
          id: 2,
          text: "Uh, world, are you there?",
          image: null,
          author: { id: 1, avatar: "one.png", name: "Jane" }
        },
        {
          id: 3,
          text: "oops, sorry, I was on the phone",
          image: null,
          author: { id: 2, avatar: "two.png", name: "World" }
        }
      ]
    }
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
