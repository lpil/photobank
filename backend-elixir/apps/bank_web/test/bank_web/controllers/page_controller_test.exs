defmodule BankWeb.PageControllerTest do
  use BankWeb.ConnCase

  describe "GET /" do
    test "serves the homepage", ctx do
      conn = get(ctx.conn, "/")
      assert html_response(conn, 200)
    end
  end
end
