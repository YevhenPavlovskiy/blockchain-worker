defmodule Blockchain do
  alias ProofOfWork, as: PoW

  @target :math.pow(2,252)#0x1000000000000000000000000000000000000000000000000000000000000000

  @doc "Create a new blockchain with a zero block"
  def new(data) do
    [ PoW.compute(Block.zero(data),@target) ]
  end


  @doc "Insert given data as a new block in the blockchain"
  def insert(blockchain, data) when is_list(blockchain) do
    %Block{hash: prev} = hd(blockchain)

    block =
      data
      |> Block.new(prev)
      |> PoW.compute(@target) 

    [ block | blockchain ]
  end


  @doc "Validate the complete blockchain"
  def valid?(blockchain) when is_list(blockchain) do
    zero = Enum.reduce_while(blockchain, nil, fn prev, current ->
      cond do
        current == nil ->
          {:cont, prev}

        Block.valid?(current, prev) ->
          {:cont, prev}

        true ->
          {:halt, false}
      end
    end)

    if zero, do: Block.valid?(zero), else: false
  end

  def hello do
    :World
  end
end