defmodule ProofOfWork do
  
    @spec compute(Block.t() | Block.t(), integer) :: Block.t()
    def compute(%Block{} = b, target) do
      {hash, nonce} = proof_of_work(b, target)
      %{b | hash: hash, nonce: nonce}
    end
  
    # verify that a givens hash satisfy the blockchain
    # proof-of-work
  
    @spec verify(String.t() | String.t(), integer) :: boolean
  
    def verify(hash, target) do
      {n, _} = Integer.parse(hash, 16)
      n < target
    end
  
    @spec proof_of_work(Block.t(), integer, integer) :: {String.t(), integer}
    defp proof_of_work(%Block{} = block, target, nonce \\ 0) do
      b = %{block | nonce: nonce}
      hash = Crypto.hash(b)
  
      case verify(hash, target) do
        true -> {hash, nonce}
        _ -> proof_of_work(block, target, nonce + 1)
      end
    end
  end