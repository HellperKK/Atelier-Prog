def npi(string) :
        liste = string.strip(" ").split(" ")
        ##print(liste)
        if len(liste) == 3 :
                fonction = liste[2]
                if fonction == "+" :
                        return float(liste[0]) + float(liste[1])
                elif fonction == "-" :
                        return float(liste[0]) - float(liste[1])
                elif fonction == "*" :
                        return float(liste[0]) * float(liste[1])
                elif fonction == "/" :
                        return float(liste[0]) / float(liste[1])
                elif fonction == "d" :
                        return float(liste[1]) / float(liste[0])
                elif fonction == "%" :
                        return float(liste[0]) % float(liste[1])
        else :
                index_max = 0
                while string[index_max] not in "+-*/%d":
                        index_max +=1
                index_min = index_max
                compteur = 0
                while compteur < 3:
                        if string[index_min] == " " :
                                compteur += 1
                        index_min -=1
                index_max +=1
                if index_min >= 0 :
                        index_min += 2
                else :
                        index_min = 0
##                print(index_min, index_max)
##                print(string[index_min:index_max])
##                inpute = input("")
                return npi(string[0:index_min] + str(npi(string[index_min:index_max])) + string[index_max:len(string)])
print(npi("4 2 + 3 * 5 + 2 -"))
print(npi("2 5 3 4 2 + * + -"))
print(npi("10 3 /"))


        
