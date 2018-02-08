defmodule Shifumi do
  def start() do
    start({0, 0})
  end
  defp start({player_score, ia_score}) do
    IO.puts("Joueur : " <> Integer.to_string(player_score))
    IO.puts("IA : " <> Integer.to_string(ia_score))
    choice = player_choice()
    enemy = Enum.random(0..2)
    cond do
      choice == enemy ->
        IO.puts("Egalite")
        start({player_score, ia_score})

      (choice > enemy or choice + 2 == enemy) ->
        IO.puts("Gagne")
        start({player_score + 1, ia_score})

      true ->
        IO.puts("Perdu")
        start({player_score, ia_score + 1})
    end
  end

  defp player_choice() do
    choice = "Quel est votre choix ?" |> IO.gets |> String.trim
    case choice do
      "0" -> 0
      "1" -> 1
      "2" -> 2
      _ ->
        IO.puts("Il faut rentrer 0, 1 ou 2")
        player_choice()
    end
  end
end

Shifumi.start()
