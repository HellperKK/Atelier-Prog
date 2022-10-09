# Server http en haxe

Un petit serveur http écrit en haxe. A été testé via la cible c++. Supporte le renvois de html et d'image png, le reste étant renvoyé sur forme textuelle.


## Utilisation


```
./bin/cpp/Main.exe
```

Vous pourrez alors vous connecter à localhost:8080 pour voir les fichiers relativement à l'endroit d'où vous avez lancé le serveur.


## Compilation

```
haxe build.hxml
```

## Credit
Le json pour les types mimes vient initialement de [ce gist](https://gist.github.com/lsauer/5196979), que j'ai ensuite modifié.