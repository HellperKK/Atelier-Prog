let to_char x = if x then "X" else "."
let show_tab tableau = 
	let tableaubis = Array.map (function x -> String.concat "" (Array.map to_char x)) tableau
	in List.iter print_endline tableaubis
let tableau_base = Array.make 20 (Array.make 20 false)
let _ = show_tab tableau_base