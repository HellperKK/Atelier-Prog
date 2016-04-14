def parseur(line)
	line = line.strip
	point = 0
	if line == ""
		return []
	elsif (not line.include?(" "))
		return [line]
	else
		if line[point] == "("
			point += 1 
			compteur = -1
			while compteur != 0
				if line[point] == ")"
					compteur += 1
				elsif line[point] == "("
					compteur -= 1
				end
				point += 1
			end
			point -= 1
		else
			point += 1 
			while line[point] != " "
				point += 1
			end
			point -= 1
		end
		[line[0..point]] + parseur(line[(point+1)..-1])
	end
end
def calculate(tab)
	func = tab[1]
	premier = tab[0].to_i
	second = tab[2].to_i
	case func
		when "+" then premier + second
		when "-" then premier - second
		when "*" then premier * second
		when "/" then premier / second
		else 0
	end
end
def reducer(tab, funcs)
	if (not (tab.any?{|x| funcs.include?(x)}))
		tab
	else
		compteur = 0
		while (not funcs.include?(tab[compteur]))
			compteur += 1
		end
		tab[(compteur - 1)..(compteur + 1)] = calculate(tab[(compteur - 1)..(compteur + 1)])
		reducer(tab, funcs)
	end
end
def main(str)
	tab = parseur(str)
	tab.each_index do |i|
		if tab[i][0] == "("
			tab[i] = main(tab[i][1..-2])
		end
	end
	if tab.length == 3
		calculate(tab)
	elsif tab.length > 3
		tab = reducer(tab, ["*", "/"])
		tab = reducer(tab, ["+", "-"])
		tab[0]
	else
		0
	end
end
expression = ARGV
if expression != []
	puts main(expression[0])
else
	puts main("1 + 3 * (2 + 5 * (4 - 2)) / 5")	
end