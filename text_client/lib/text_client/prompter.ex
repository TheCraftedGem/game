defmodule TextClient.Prompter do
  alias TextClient.State

  def accept_move(game = %State{}) do
    IO.gets("Your guess: ")
    |> check_input(game)
  end

  defp check_input({:error, reason}, _) do
    IO.puts("Game Ended: #{reason}")
    exit(:normal)
  end

  defp check_input(:eof, _) do
    IO.puts("You Gave Up?!?!")
    exit(:normal)
  end

  defp check_input(input, game = %State{}) do
    input = String.trim(input)
    cond do
      input =~ ~r/\A[a-z]\z/ ->
        Map.put(game, :guess, input)
      true ->
        IO.puts("Please Enter single lower case")
        accept_move(game)
      end
  end

end
