(* Fonctions de lecture de fichier *)
let read_line_test chanel =
	try
		Some (input_line chanel)
	with
		|End_of_file -> None
let read_file_tab chanel = 
	let rec aux acc = match  read_line_test chanel with
		|None -> acc
		|Some x -> aux (x :: acc)
	in List.rev (aux [])

let execute chaine = 
	let rec aux indexb memoireb pointeurb =
	if indexb = (String.length chaine)
	then ()
	else	match chaine.[indexb] with
			| '>' -> if pointeurb < 256 
				then aux (indexb + 1) memoireb (pointeurb + 1)
				else aux (indexb + 1) memoireb pointeurb
			| '<' -> if pointeurb > 0 
				then aux (indexb + 1) memoireb (pointeurb - 1)
				else aux (indexb + 1) memoireb pointeurb
			| _ -> aux (indexb + 1) memoireb pointeurb
	in aux  0 [0; 0; 0] 0

let phrase = 
	if Array.length Sys.argv > 1 
	then Array.get Sys.argv 1 
	else "+++++++++++++++++++++++++++++++++++++++++++++++++."

let contenu = 
	if Sys.file_exists phrase
	then String.concat " " (read_file_tab (open_in phrase))
	else phrase

let _ = String.iter execute contenu