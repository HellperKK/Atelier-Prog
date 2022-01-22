# Calculatrice en js

Une calculatrice en js basée sur le tokenizer moojs et le parser nearley. L'expression est directement évauée au parsing sans passer par un AST et les règles d'opérateurs ont donc été écrites por inclure directement les priorités.


## Utilisation

Placer l'espression dans le champ à gauche puis lancer l'évaluation pour voir le résultat à droite.


## Compilation

La compilation du fichier grammar.ne nécessite le compilateur nearleyc (eg `npm install -g nearley c`). Faire ensuite `narleyc -o grammar.js grammar.ne`