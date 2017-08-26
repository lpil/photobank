/*
   This module provides an Express JS compatible interface that can be
   used with GCP Cloud Function.
 */
type response = Js.t {. status : int, payload : string};

let js_respond method path body => {
  let response = Photobank.respond method path body;
  {"payload": response.payload, "status": response.status}
};

/*
   Rather than trying to type the Express JS objects and write everything in
   Reason I'm going to use some crude JS interop.
   Intend to fix this later when I understand the type system better.
 */
[%%bs.raw
  {|
exports.handle = function handle(req, res) {
  const method = req.method;
  const path = req.path.split("/").slice(1);
  const body = req.body;
  const result = handle(method, path, body);
  res.status(result.status).json(res.payload);
};
|}
];
