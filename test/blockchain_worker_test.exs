defmodule BlockchainWorkerTest do
  use ExUnit.Case
  doctest BlockchainWorker

  test "greets the world" do
    assert BlockchainWorker.hello() == :world
  end
end
