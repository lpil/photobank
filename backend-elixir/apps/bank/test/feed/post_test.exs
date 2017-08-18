defmodule Bank.Feed.PostTest do
  use Bank.DataCase
  alias Bank.Feed.Post
  doctest Post, import: true

  @valid_attrs %{text: "some text"}

  test "valid changes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "invalid changes" do
    changeset = Post.changeset(%Post{}, %{})
    refute changeset.valid?
    assert errors_on(changeset) == %{text: ["can't be blank"]}
  end
end
