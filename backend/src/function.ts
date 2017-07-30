import * as happy from "./happy";

//
// The API runs as a Cloud Function on the Google Cloud Platform.
// Here's the entrypoint for said function. :)
//
export function handler(req: any, res: any) {
  const body = req.body || {};
  const query = body.query || "";
  const variables = body.variables || {};
  happy.runQuery(query, variables).then((result: any) => {
    const status = result.error ? 422 : 200;
    res.status(status).json(result);
  });
}
