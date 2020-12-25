defmodule Crypto do

  @doc "Calculate hash of block"
  def hash(%{} = block) do
    data = "#{block.data}#{block.timestamp}#{block.prev_hash}#{block.nonce}"
    data
    |> sha256
  end

  # Calculate SHA256 for a binary string
  defp sha256(binary) do
    :crypto.hash(:sha256, binary) |> Base.encode16
  end

end
