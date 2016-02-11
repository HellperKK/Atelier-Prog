# -*- coding: utf8 -*-
import random
##Augmente la limite de récursivité
import sys
sys.setrecursionlimit(20000)
##Définitions des globales
global decalage
global aire
##Définit la taille du tableau (longeur et largeur)
##Les mesures sont prises pour que le tableau fasse toute la taille de la console (+ 1 ligne vide pour input)
longueur = 80
largeur = 24
aire = longueur * largeur
##Définit les décalages pour les cases voisines dans l'ordre (haut-gauche, haut, haut-droite, gauche, droite, bas-gauche, bas, bas-droite)
decalage = (-(longueur + 1), -longueur, -longueur + 1, -1, 1, longueur - 1, longueur, longueur + 1)
##Fonction qui crée une liste contenant n fois le contenu d'une fonction fonc()
def repeatF(fonc, n):
    return [fonc() for x in range(n)]
##Fonction qui retourne aléatoirement soit true soit false
def randBin():
    return (True, False)[random.randint(0, 1)]
####
##Fonction la plus importante, qui détermine le statut d'une cellule en fonction de ses voisine
####
def anima(tableau, i) :
    ##Récupère la valeur de la cellule analysée
    cellule = tableau[i]
    ##Fait une liste des cases voisines
    voisins = [tableau[(i+x)%aire] for x in decalage]
    ##Compte ensuite le nombre de vivants (aka de True)
    compte = voisins.count(True)
    ##Cas où la cellule est morte et qu'elle peut naitre car ayant 3 voisins
    if not cellule and compte == 3 :
        return True
    ##Cas où la cellule est vivante et qu'elle peut mourir car n'ayant pas 2 ou 3 voisins
    elif cellule and not compte in (2, 3) :
        return False
    ##Cas où rien ne change
    else :
        return cellule
####Pour visualisation
##Convertis une liste en string
def toStr(x, y=0):
    if y == len(x) :
        return ""
    else :
        return x[y] + toStr(x, y+1)
    pass
##Change (True, False) en (O, .)
def binToLetter(x):
    if x :
        return "O"
    else :
        return "."
    pass
####Fin visualisation
####Débug
##Pour afficher le nombre de voisins
def nbrVoisins(tableau, i) :
    ##Récupère la valeur de la cellule analysée
    cellule = tableau[i]
    ##Fait une liste des cases voisines
    voisins = [tableau[(i+x)%aire] for x in decalage]
    ##Compte ensuite le nombre de vivants (aka de True)
    return str(voisins.count(True))
###Fin Débug

##Définition du tableau de départ
tableau = repeatF(randBin, aire)
##Définition de la variable d'input
inpute = ""
##boucle du jeu
while True :
    ##Remplace le tableau actuel par a phase suivante
    tableau = [anima(tableau, x)for x in range(len(tableau))]
    ##Pour l'affichage, change les valeur en caractère puis convertis le tableau en un string
    afficher = toStr([binToLetter(x) for x in tableau])
    print(afficher)
    inpute = input("")
    ##1 pour réinitialiser sans relancer le programme
    if inpute == "1" :
        tableau = repeatF(randBin, aire)
##    2 pour voir le nombres de voisins (Débug)
##    elif inpute == "2" :
##        tableau = [nbrVoisins(tableau, x)for x in range(len(tableau))]
##        afficher = toStr(tableau)
##        print(afficher)
##        inpute = input("")
    elif inpute != "" :
        break
