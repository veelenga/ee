defmodule Bob do
  def hey(input) do
    cond do
      String.ends_with?(input, "?") -> "Sure."
      String.trim(input) == "" -> "Fine. Be that way!"
      String.upcase(input) == input and Regex.match?(~r/[[:alpha:]]+/, input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
