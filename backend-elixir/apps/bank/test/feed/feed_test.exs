defmodule Bank.FeedTest do
  use Bank.DataCase

  alias Bank.Feed
  alias Bank.Feed.Post
  doctest Feed, import: true

  @valid_attrs %{text: "some text"}

  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Feed.create_post()
    post
  end

  describe "list_posts/0" do
    test "returns all posts" do
      post = post_fixture()
      assert Feed.list_posts() == [post]
    end
  end

  describe "create_post/1" do
    test "valid data creates a post" do
      assert {:ok, %Post{} = post} = Feed.create_post(@valid_attrs)
      assert post.text == "some text"
    end

    test "invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feed.create_post(%{})
    end
  end
end
