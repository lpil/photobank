defmodule BankWeb.PostControllerTest do
  use BankWeb.ConnCase
  alias Bank.Feed

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "POST create" do
    @create_params %{
      "post" => %{
        "text" => "Hello, Sailor!",
      },
    }

    test "creates a post when valid", ctx do
      conn = post(ctx.conn, "/v1/posts", @create_params)
      assert [post] = Feed.list_posts()
      assert json_response(conn, 201)["post"] == %{
        "id" => post.id,
        "type" => "post",
        "text" => "Hello, Sailor!",
      }
    end

    test "returns a error when invalid", ctx do
      params = put_in(@create_params["post"]["text"], nil)
      conn = post(ctx.conn, "/v1/posts", params)
      assert [] = Feed.list_posts()
      assert json_response(conn, 422) == %{
        "errors" => %{"text" => ["can't be blank"]},
      }
    end
  end
end
