exception BadRequest

(* Gestion de commande*)
let first_blank str =
  let rec blank = function
    |x when x = String.length str -> None
    |x when str.[x] = ' ' -> Some x
    |x -> blank (x + 1)
  in blank 0
let words str = 
	let rec aux acc strb = match first_blank strb with
		|None -> strb :: acc
		|Some x -> aux ((String.sub strb 0 x) :: acc) (String.sub strb (x +1) (String.length strb - x - 1))
	in List.rev (aux [] str)
let correct_sentence str = match words str with
	|[x; y] -> ((int_of_string x), Some y)
	|[x] -> ((int_of_string x), None)
	|x -> raise BadRequest

(* Lecture de la première ligne d'un fichier*)
let open_txt name = 
	let file = open_in name 
	in let line  = input_line file
	in let _ = close_in file
	in line

(* Ajout d'un element *)
let ajoute element liste = liste @ [element]

(* Retrait d'un element *)
let retrait element  liste= 
	let rec aux = function
		|[] -> []
		|x :: ls when x = element -> ls
		|x :: ls -> x :: (aux ls)
	in aux liste

(* Filtre des elements *)
let recherche element liste = liste

let fileName = "ToDoListe.txt"

(* Ouverture d'un fichier ou création d'une liste vide si le fichier n'existe pas *)
let base = if Sys.file_exists fileName then words (open_txt fileName) else []

(* Boucle principale *)
let rec main liste = 
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
