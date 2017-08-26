type response = {
  status: int,
  payload: string
};

let get_status = {payload: "ok", status: 200};

let post_echo body => {payload: body, status: 200};

let get_user id => {payload: id, status: 404};

let not_found = {payload: "not found", status: 404};

let respond method path body =>
  switch (method, path) {
  | ("GET", [|"status"|]) => get_status
  | ("POST", [|"echo"|]) => post_echo body
  | ("GET", [|"users", id|]) => get_user id
  | _ => not_found
  };
