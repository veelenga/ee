defmodule Wordy do
  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t) :: integer
  def answer(question) do
    Regex.scan(~r/What is (.*)\?/, question, capture: :all_but_first)
    |> List.flatten |> hd
    |> String.split(" ", trim: true)
    |> Enum.map_join(" ", &convert/1)
    |> Code.eval_string |> elem(0)
  end

  def convert(token) do
    cond do
      token =~ ~r/\d/ -> String.to_integer(token)
      token == "plus" -> "+"
      token == "minus" -> "-"
      token == "multiplied" -> "*"
      token == "divided" -> "/"
      token == "by" -> ""
      true -> raise ArgumentError
    end
  end
end
