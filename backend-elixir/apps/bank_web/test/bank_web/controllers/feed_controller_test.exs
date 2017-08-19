defmodule BankWeb.FeedControllerTest do
  use BankWeb.ConnCase
  alias Bank.Feed

  @create_attrs %{text: "some text"}

  def fixture(:post) do
    {:ok, post} = Feed.create_post(@create_attrs)
    post
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    setup [:create_post]

    test "lists all posts", ctx do
      conn = get(ctx.conn, "/v1/feed")
      assert json_response(conn, 200)["feed"] == %{
        "items" => [
          %{
            "id" => ctx.post.id,
            "type" => "post",
            "text" => ctx.post.text,
          }
        ]
      }
    end
  end

  defp create_post(_) do
    post = fixture(:post)
    {:ok, post: post}
  end
end
