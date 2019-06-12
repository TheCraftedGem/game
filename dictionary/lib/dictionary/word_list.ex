defmodule Dictionary.WordList do

  def word_list() do
    Path.expand("../../assets/word.txt", __DIR__)
    |> File.read!()
    |> String.split("\n")
  end

  def random_word(words)  do
    Enum.random(words)
  end
end
