let visualise x = if x then "X" else "."
let liste_make i element =
	let rec aux acc = function
		|x when x = i -> acc
		|x -> aux (element :: acc) (x + 1)
	in aux [] 0
let test = List.map (function x -> Random.bool()) (liste_make 20 false)
let _ = List.iter (function x -> print_endline (string_of_bool x)) test