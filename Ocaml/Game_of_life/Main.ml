(*
let to_char x = if x then "X" else "."
let show_tab tableau = 
	let tableaubis = Array.map (function x -> String.concat "" (Array.map to_char x)) tableau
	in List.iter print_endline tableaubis
*)
let visualise x = if x then "X" else "."
let liste_make i element =
	let rec aux acc = function
		|x when x = i -> acc
		|x -> aux (element :: acc) (x + 1)
	in List.rev (aux [] 0)
let test = liste_make 20 false
(*
let tableau_base = Array.make 20 (Array.make 20 false)
let _ = show_tab tableau_base
*)