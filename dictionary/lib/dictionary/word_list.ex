defmodule Dictionary.WordList do

  def start_link() do
    Agent.start_link(&word_list/0)
  end

  def word_list() do
    Path.expand("../../assets/word.txt", __DIR__)
    |> File.read!()
    |> String.split("\n")
  end

  def random_word(agent)  do
    Agent.get(agent, &Enum.random/1)
  end
end
