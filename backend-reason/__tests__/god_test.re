open Jest;

open Expect;

describe
  "the universe"
  (
    fun () => {
      test "maths 1" (fun () => expect (1 + 2) |> toBe 3);
      test "maths 2" (fun () => expect (2 + 2) |> toBe 4);
      test "maths 3" (fun () => expect (2 + 2) |> toBe 4)
    }
  );
