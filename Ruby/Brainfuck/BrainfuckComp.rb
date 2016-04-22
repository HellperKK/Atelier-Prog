def main(arg, pointeur = 0, char = " ", compteur = 1)
	if pointeur > arg.length
		""
	elsif arg[pointeur] == char
		main(arg, pointeur + 1, char, compteur + 1)
	else
		case char
		when ">"
			"pointeur += #{compteur}\n" + main(arg, pointeur + 1, arg[pointeur] , 1)
		when "<"
			"pointeur -= #{compteur}\n" + main(arg, pointeur + 1, arg[pointeur] , 1)
		when "+"
			"memoire[pointeur] += #{compteur}\n" + main(arg, pointeur + 1, arg[pointeur] , 1)
		when "-"
			"memoire[pointeur] -= #{compteur}\n" + main(arg, pointeur + 1, arg[pointeur] , 1)
		when "."
			"#{compteur}.times{print memoire[pointeur].chr}\n" + main(arg, pointeur + 1, arg[pointeur] , 1)
		when ","
			"#{compteur}.times{memoire[pointeur] = $stdin.gets[0].ord}\n" + main(arg, pointeur + 1, arg[pointeur] , 1)
		when "["
			("while (memoire[pointeur] != 0)\n" * compteur) + main(arg, pointeur + 1, arg[pointeur] , 1)
		when "]"
			("end\n" * compteur) + main(arg, pointeur + 1, arg[pointeur] , 1)
		else 
			main(arg, pointeur + 1, arg[pointeur] , 1)
		end
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