defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    input
    |> get_results
    |> calculate_stats
    |> print_results
  end

  defp get_results(input) do
    input
    |> Enum.map(&String.split(&1, ";"))
    |> Enum.filter(&valid?/1)
    |> Enum.flat_map(fn [team1, team2, result] ->
      case result do
        "win" -> [{team1, :win}, {team2, :loss}]
        "loss" -> [{team1, :loss}, {team2, :win}]
        "draw" -> [{team1, :draw}, {team2, :draw}]
      end
    end)
    |> Enum.group_by(fn {team, _} -> team end, fn {_, result} -> result end)
  end

  defp valid?([_, _, result]) when result in ["win", "loss", "draw"], do: true
  defp valid?(_), do: false

  defp calculate_stats(score) do
    score
    |> Enum.map(fn {team, matches} ->
      stats = %{
        played: Enum.count(matches),
        win: Enum.count(matches, &(&1 == :win)),
        draw: Enum.count(matches, &(&1 == :draw)),
        loss: Enum.count(matches, &(&1 == :loss)),
        points: calculate_points(matches)
      }

      {team, stats}
    end)
    |> Enum.into(%{})
  end

  defp calculate_points(matches) do
    Enum.reduce(matches, 0, fn
      :win, points -> points + 3
      :draw, points -> points + 1
      :loss, points -> points
    end)
  end

  defp print_results(stats) do
    teams = Map.keys(stats)
    teams = Enum.sort_by(teams, fn name -> stats[name][:points] * -1 end)
    headers = ~w(Team MP W D L P)

    rows =
      Enum.map(teams, fn team ->
        result = stats[team]
        [team, result.played, result.win, result.draw, result.loss, result.points]
      end)

    [headers | rows]
    |> Enum.map(fn row ->
      row
      |> Enum.with_index()
      |> Enum.map(fn {row, index} ->
        case index do
          0 -> String.pad_trailing(row, 30, " ")
          _ -> String.pad_leading(to_string(row), 2, " ")
        end
      end)
      |> Enum.join(" | ")
    end)
    |> Enum.join("\n")
  end
end
