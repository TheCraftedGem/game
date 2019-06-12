require IEx

defmodule Dictionary.WordList do

  @me __MODULE__

  def start_link() do
    Agent.start_link(&word_list/0, name: @me)
  end

  def word_list() do
    Path.expand("../../assets/word.txt", __DIR__)
    |> File.read!()
    |> String.split("\n")
  end

  def random_word()  do
    Agent.get(@me, &Enum.random/1)
  end
end
