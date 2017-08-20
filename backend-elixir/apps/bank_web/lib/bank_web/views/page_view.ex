defmodule BankWeb.PageView do
  use BankWeb, :view

  static_path = Path.join(:code.priv_dir(:bank_web), "static")
  manifest_path = Path.join(static_path, "manifest.json")
  @external_resource manifest_path

  manifest = case File.read(manifest_path) do
    {:ok, json} ->
      Poison.decode!(json)

    _ ->
      if Mix.env == :prod do
        raise "manifest.json missing!"
      else
        %{}
      end
  end


  @doc """
  An asset helper that uses path from the frontend build manifest if the
  file is found in there.

  This is useful because the frontend compiler generates assets with hashed
  file names, so we can't be sure what they are without consulting the
  manifest.

  """
  for {name, location} <- manifest do
    def manifest_asset_path(unquote(name)) do
      unquote(location)
    end
  end

  def manifest_asset_path(file) do
    file
  end
end
