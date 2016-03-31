exception BadRequest

(* Ouverture d'un fichier ou création d'une liste vide si le fichier n'existe pas *)

(* Boucle principale *)
let rec main compteur = 
	try
		match correct_sentence (read_line()) with
		|(0, None) -> liste
		|(1, Some x) -> let temp = ajoute x liste in main temp
		|(2, Some x) ->  let temp = retrait x liste in main temp
		|(3, Some x) ->  let temp = recherche x liste
			in let _ = List.iter print_endline temp
			in main liste
		|(4, None) -> let _ = List.iter print_endline liste
			in main liste
		|x -> main liste
	with
		| BadRequest -> let _ = print_endline "Bad number of arguments" in main liste
		| Failure "int_of_string" -> let _ = print_endline "The first argument must be an integer" in main liste
let table = main base
let _ = if table <> base
	then let fileb = open_out fileName 
	in output_string fileb (String.concat " " table); close_out fileb
