# ToDoList-Ocaml
A simple todo liste in ocaml

#How to use
Launch the program with this command :
> ocaml Mains.ml

then you can use these instructions to interract with the program :
* 0 -> exit
* 1 entry -> add entry to the list
* 2 entry -> remove first entry form the list
* 3 entry -> print all entrys that contain entry as a substring (not implemented yet)
* 4 -> print the list

Note : This is a work in progress as there ares two things that may change :

First -> the "3 entry" command does not work since I'm looking for a function to check if a string contains a substring and I haven't found it yet (btw I'm looking for a purely functional solution since I'm not found of Ocaml's imperative programming).

Second -> Since spaces are used as a separator it is actually impossible to use en sentence with more than one word as an entry. I will probably change that in the futur.
