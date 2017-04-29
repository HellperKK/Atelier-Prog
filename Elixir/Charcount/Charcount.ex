defmodule Charcount do
	def string_counter(string) do
		string_counter(string, %{})
	end
	
	defp string_counter("", acc) do
		acc
	end
	defp string_counter(string, acc) do
		char = String.at(string, 0)
		new_string = String.slice(string, 1, String.length(string) - 1)
		value = Map.get(acc, char, 0) + 1
		new_acc = if Map.has_key?(acc, char) do
			%{acc | char => value}
		else
			Map.put(acc, char, value)
		end
		string_counter(new_string, new_acc)
	end
end

Charcount.string_counter("Portez ce vieux wisky au juge blond qui fume") |> 
	Enum.map_join("\n", (fn {a, b} -> "le charactere "<> a <> " est present " <> Integer.to_string(b) <> " fois" end)) |> 
	IO.puts