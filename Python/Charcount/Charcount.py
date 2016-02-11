def charCount (string):
        liste = []
        string = list(string)
        while string != [] :
                char = string[0]
                taille = string.count(char)
                while char in string :
                        string.remove(char)
                liste.append((char, taille))
        for i in liste :
                print("Le caractère " + i[0] + " apparait " + str(i[1]) + " fois")
charCount("Portez ce vieux whisky au juge blond qui fume")
        
