defmodule BankAccount do
  use GenServer
  import GenServer

  def handle_call(:balance, _from, balance) do
    {:reply, balance, balance}
  end

  def handle_cast({:update, amount}, balance) do
    {:noreply, balance + amount}
  end

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, pid} = start_link(__MODULE__, 0)
    pid
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account), do: stop(account)

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account), do: call(account, :balance)

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount), do: cast(account, {:update, amount})
end
