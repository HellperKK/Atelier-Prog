# Brainfuck en ruby
Deux interpreteur brainfuck en ruby un utilisant une boucle It�rative (BrainfuckIt.rb) et un autre une boucle Recursive (BrainfuckRec.rb). � cause de la limite du stack de recursion je recommande d'utiliser la version iterative pour les codes longs.

BrainfuckComp.rb est quand � lui un compilateur brainfuck vers ruby, avec une l�g�re optimisation.

# Utilisation
Utiliser la commande :
> [ruby] Le_programme_Brainfuck_de_mon_choix.rb ["Le code brainfuck � interpr�ter"|"Le nom du fichier .txt contenant le code"]

Si seulement le nom du programme est donn�, la chaine "+++++++++++++++++++++++++++++++++++++++++++++++++." (affiche "1") sera interpret�e/compil�e.
Puis, si l'option de complation a �t� choisie :
> [ruby] Output.rb