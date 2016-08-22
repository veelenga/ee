defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string 
      |> String.replace(~r/([A-Z])/, " \\1")
      |> String.split(~r/[^[:alnum:]]/, trim: true)
      |> Enum.map(&(String.upcase String.first &1))
      |> Enum.join
  end
end
