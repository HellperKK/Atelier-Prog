exception NotEnough
exception NoSymbol
exception WrongSymbol

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
	
let slice liste a b =
	let rec aux acc i = 
		if i > b then acc
		else aux ((List.nth liste i) :: acc) (i + 1)
	in List.rev (aux [] a)
	
let calculate liste = 
	let func = List.nth liste 2
	in let premier = int_of_string (List.nth liste 0)
	in let second = int_of_string (List.nth liste 1)
	in match func with
		|"+" -> premier + second
		|"-" -> premier - second
		|"*" -> premier * second
		|"/" -> premier / second
		|x -> raise WrongSymbol
		
let firstSymbol liste = 
	let rec aux = function
		|x when x = List.length liste ->  raise NoSymbol
		|x when String.contains "+-*/" (List.nth liste x).[0] -> x
		|x -> aux (x + 1)
	in aux 0
	
let rec npi str = match words str with
	|x when List.length x < 3 -> raise NotEnough
	|x when List.length x = 3 -> calculate x
	|x -> let id = firstSymbol x
	in let centre = slice x (id - 2) id
	in let calcul =  string_of_int (npi (String.concat " " centre))
	in let newtab = (slice x 0 (id - 3)) @ (calcul :: (slice x (id + 1) (List.length x - 1)))
	in let newstr = String.concat " " newtab
	in npi (newstr)
	
let operation = if Array.length Sys.argv > 1 then Array.get Sys.argv 1 else "1 1 +"
let test = 
	try 
		print_int (npi operation)
	with
		|NotEnough -> print_endline "One or more arguments are missing"
		|NoSymbol -> print_endline "A operator is missing"
		|WrongSymbol -> print_endline "Wrong operator"
		|Failure "int_of_string" -> print_endline "Tried to convert string into int and failed"