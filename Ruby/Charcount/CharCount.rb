def charCountInit(x)
	x = x.chars.sort
	a = charCountRec(x)
	a.each{|i| puts "Le caractere #{i[0]} est present #{i[1]} fois"}
end
def charCountRec(x)
	if x == []
		[]
	else
		char = x[0]
		compteur = 0
		while x[compteur] == char
			compteur += 1
		end
		[[char, compteur]] + charCountRec(x[compteur..-1])
	end
end
#charCountInit("portez ce vieux whisky au juge blond qui fume")
def charCountFun(str)
	hash = Hash.new(0)
	str.each_char{|i| hash[i] += 1}
	hash.each{|key, value| puts "Le caractere #{key} apparait #{value} fois"}
end
charCountFun("portez ce vieux whisky au juge blond qui fume")