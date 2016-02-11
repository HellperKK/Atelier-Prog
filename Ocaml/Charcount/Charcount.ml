let spilt_char str =
	let rec aux acc = function
		|x when x = String.length str -> acc
		|x -> aux ((str.[x] :: acc )) (x + 1)
	in List.rev (aux [] 0)
let slice liste a b =
	let rec aux acc i = 
		if i > b then acc
		else aux ((List.nth liste i) :: acc) (i + 1)
	in List.rev (aux [] a)
let until_different liste element =
	let rec aux = function
		|x when x = List.length liste || (List.nth liste x) <> element -> x
		|x -> aux (x + 1)
	in aux 1
let calculate str = 
	let rec aux acc liste = match until_different liste (List.nth liste 0) with
		|x when x = List.length liste ->  acc @ [(List.nth liste 0, x)]
		|x -> aux ((List.nth liste 0, x) :: acc) (slice liste x (List.length liste - 1))
	in List.rev (aux [] (List.sort compare (spilt_char str)))
let to_s paire =
	let premier = String.make 1 (fst paire)
	in let second = string_of_int (snd paire)
	in second ^ " fois " ^ premier
let phrase = if Array.length Sys.argv > 1 then Array.get Sys.argv 1 else "portez ce vieux winky au juge blond qui fume"
let calcul = calculate phrase
let _ = print_endline ("La phrase suivante : '" ^ phrase ^ "' contient")
let _ = List.iter (function x -> print_endline (to_s x)) calcul