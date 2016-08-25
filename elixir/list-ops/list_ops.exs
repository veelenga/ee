defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: count(l, 0)
  def count([], n), do: n
  def count([_ | t], n), do: count(t, n + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse(l, [])
  def reverse([], rev), do: rev
  def reverse([h | t], rev), do: reverse(t, [h | rev])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: l |> map(f, []) |> reverse
  def map([], _f, rez), do: rez
  def map([h | t], f, rez), do: map(t, f, [f.(h) | rez])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: l |> filter(f, []) |> reverse
  def filter([], _f, rez), do: rez
  def filter([h | t], f, rez), do: filter(t, f, (if f.(h), do: [h | rez], else: rez))

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([h | t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, []), do: a
  def append([], b), do: b
  def append([head | tail], l), do: [head | append(tail, l)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([h | t]), do: append(h, concat(t))
end
