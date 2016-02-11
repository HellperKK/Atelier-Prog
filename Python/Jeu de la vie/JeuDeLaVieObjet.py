import random
def repeatF(fonc, n):
    return [fonc() for x in range(n)]
def randBin():
    return (True, False)[random.randint(0, 1)]
def toStr(x, y=0):
    if y == len(x) :
        return ""
    else :
        return x[y] + toStr(x, y+1)
    pass
def binToLetter(x):
    if x :
        return "O"
    else :
        return "."
    pass
class  cadre :
        def __init__ (self, long, larg):
                self.aire = long * larg
                self.dec = (-(long + 1), -long, -long + 1, -1, 1, long - 1, long, long + 1)
                self.tableau = repeatF(randBin, long * larg)
                self.aff = toStr([binToLetter(x) for x in self.tableau])
        def update(self) :
             self.tableau = [anima(x)for x in range(len(self.tableau))]
        def anima(self, i) :
            cellule = self.tableau[i]
            voisins = [tableau[(i+x)%aire] for x in dec]
            compte = voisins.count(True)
            if not cellule and compte == 3 :
                return True
            elif cellule and not compte in (2, 3) :
                return False
            else :
                return cellule
        
a = cadre(80, 24)
print (a.aff)
print ("")
a.update()
print (a.aff)
