defmodule Dictionary do

  def word_list do
    Path.expand("../assets/word.txt", __DIR__) |> File.read!() |> String.split("\n")
  end

  def random_word  do
    word_list()
    |> Enum.random()
  end
end




