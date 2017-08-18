defmodule Bank.Feed.Post do
  @moduledoc """
  A Post is an item of user submitted content that can be
  presented on other users' feeds. It contains text and an
  optional image.

  """
  use Ecto.Schema
  import Ecto.Changeset

  @required_params ~w(text)a

  schema "posts" do
    field :text, :string
    timestamps()
  end

  @doc false
  def changeset(%__MODULE__{} = post, attrs) do
    post
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
