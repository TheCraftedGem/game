defmodule TextClient.Player do
  alias TextClient.State

  #won, lost, good, bad, already, init
  def play(%State{tally: %{game_state: :won}}) do
    exit_with_message("You've Won Homie!")
  end

  def play(%State{tally: %{game_state: :lost}}) do
    exit_with_message("You Lost Homie!")
  end

  def play(game = %State{tally: %{game_state: :good_guess}}) do
    continue_with_message(game, "Good Guess!")
  end

  def play(game = %State{tally: %{game_state: :bad_guess}}) do
    continue_with_message(game, "Sorry Bad Guess")
  end

  def play(game = %State{tally: %{game_state: :already_used}}) do
    continue_with_message(game, "You've Already Used That Letter, Try A Different One")
  end

  def play(game) do
    continue(game)
  end

  def display(game) do
    game
  end

  def prompt(game) do
    game
  end

  def make_move(game) do
    game
  end

  def continue(game) do
    game
    |> display()
    |> prompt()
    |> make_move()
    |> play()
  end



  def continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end


  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end



end
