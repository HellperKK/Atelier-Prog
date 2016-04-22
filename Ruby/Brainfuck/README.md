# Brainfuck en ruby
Deux interpreteur brainfuck en ruby un utilisant une boucle Itérative (BrainfuckIt.rb) et un autre une boucle Recursive (BrainfuckRec.rb). À cause de la limite du stack de recursion je recommande d'utiliser la version iterative pour les codes longs.

BrainfuckComp.rb est quand à lui un compilateur brainfuck vers ruby, avec une légère optimisation.

#Utilisation
Utiliser la commande :
> [ruby] Le_programme_Brainfuck_de_mon_choix.rb ["Le code brainfuck à interpréter"|"Le nom du fichier .txt contenant le code"]

Si seulement le nom du programme est donné, la chaine "+++++++++++++++++++++++++++++++++++++++++++++++++." (affiche "1") sera interpretée/compilée.
Puis, si l'option de complation a été choisie :
> [ruby] Output.rb