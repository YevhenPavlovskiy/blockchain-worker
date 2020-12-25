defmodule Block do
  defstruct [:data, :timestamp, :prev_hash, :hash, :nonce]


  @doc "Build a new block for given data and previous hash"
  def new(data, prev_hash) do
    %Block{
      data: data,
      prev_hash: prev_hash,
      timestamp: NaiveDateTime.utc_now,
      nonce: 0,
    }
  end


  @doc "Build the initial block of the chain"
  def zero(data) do
    %Block{
      data: data,
      prev_hash: "ZERO_HASH",
      timestamp: NaiveDateTime.utc_now,
      nonce: 0,
    }
  end

  @doc "Check if a block is valid"
  def valid?(%Block{} = block) do
    Crypto.hash(block) == block.hash
  end

  def valid?(%Block{} = block, %Block{} = prev_block) do
    (block.prev_hash == prev_block.hash) && valid?(block)
  end
end