const happy = require("./happy");

//
// The API runs as a Cloud Function on the Google Cloud Platform.
// Here's the entrypoint for said function. :)
//
function handler(req, res) {
  const body = req.body || {};
  const query = body.query || "";
  const variables = body.variables || {};
  const respond = result => {
    const status = result.error ? 422 : 200;
    res.status(status).json(result);
  };
  happy.runQuery(query, variables).then(respond);
}

module.exports = {
  handler
};
