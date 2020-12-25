defmodule BlockchainWorker do
  @moduledoc """
  Documentation for `BlockchainWorker`.
  """

  @doc """
  Worker of Blockchain.

  ## Examples

      iex> BlockchainWorker.hello()
      :world

  """

  def main(args \\ []) do
    :timer.sleep(:infinity)
  end

  def newchain(blockchain, message) do
    chain = Blockchain.new(message)
    chain
  end

  def addblock(blockchain, message) do
    chain = Blockchain.insert(blockchain, message)
    chain
  end

  def hello do
    :world
  end
end
