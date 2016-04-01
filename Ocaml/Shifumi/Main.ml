exception BadNumber

let rec correct_choice () = let _ = print_endline "What is your choice ?"
	in try
		match int_of_string (read_line()) with
		|x when x >= 0 && x <= 2 -> x
		|x -> raise BadNumber
		
	with
		|Failure "int_of_string" -> let _ = print_endline "You must give an integer." in correct_choice ()
		|BadNumber -> let _ = print_endline "You must give a number between 0 and 2." in correct_choice ()
		
let rec continue () = let _ = print_endline "Continue ?"
	in match read_line() with
		|"yes"|"y" -> true
		|"no"|"n" -> false
		|x -> let _ = print_endline "You must answer with yes or no." in continue ()
		
let show_result results = let premier = string_of_int (fst results)
	in let second = string_of_int (snd results)
	in "Won : " ^ premier ^ "\nLost : " ^ second

let rec main compteur = 
	let _ = print_endline (show_result compteur) 
	in let enemi_choice = Random.int 3
	in let player_choice =  correct_choice ()
	in match (enemi_choice, player_choice) with
		|(x, y) when x = y -> let _ = print_endline "Equality." 
			in if continue () then main compteur
		|(x, y) when (x = (y + 1)) ||  ((x + 3) = (y + 1)) -> let _ = print_endline "You lose." 
			in if continue () then main (fst compteur, snd compteur + 1)
		|_ -> let _ = print_endline "You win." 
			in if continue () then main (fst compteur + 1, snd compteur)
			
let partie = main (0, 0)