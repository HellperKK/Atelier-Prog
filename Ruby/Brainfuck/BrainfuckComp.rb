def b_to_r(char, compteur)
	case char
		when ">"
			"pointeur += #{compteur}\n"
		when "<"
			"pointeur -= #{compteur}\n"
		when "+"
			"memoire[pointeur] += #{compteur}\n"
		when "-"
			"memoire[pointeur] -= #{compteur}\n" 
		when "."
			"#{compteur}.times{print memoire[pointeur].chr}\n" 
		when ","
			"#{compteur}.times{memoire[pointeur] = $stdin.gets[0].ord}\n" 
		when "["
			("while (memoire[pointeur] != 0)\n" * compteur)
		when "]"
			("end\n" * compteur)
		else 
			""
		end
end

def main(arg, pointeur = 0, char = " ", compteur = 1)
	if pointeur == arg.length
		b_to_r(char, compteur)
	elsif arg[pointeur] == char
		main(arg, pointeur + 1, char, compteur + 1)
	else
		b_to_r(char, compteur) + main(arg, pointeur + 1, arg[pointeur] , 1)
	end
end

#Circuit de départ
argv = ARGV
if argv != []
	arg = argv[0]
	if (File.extname(arg) == ".txt") && (File.file?(arg))
		begin
			arg = File.open(arg, 'r').read
		rescue
			puts "invalid file name"
			arg = "+++++++++++++++++++++++++++++++++++++++++++++++++."
		end
	end
else
	arg = "+++++++++++++++++++++++++++++++++++++++++++++++++."
end
content = "memoire = Array.new(256, 0)\n"
content += "pointeur = 0\n"
content += main(arg)
f = File.open('Output.rb','w')
f.write(content)
f.close