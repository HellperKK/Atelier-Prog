def main(memoire, pointeur, arg, pointeur_code = 0)
	unless pointeur_code == arg.length
		test = arg[pointeur_code]
		case test
		when ">"
			if pointeur < 256
				main(memoire, pointeur + 1, arg, pointeur_code + 1)
			else
				main(memoire, 256, arg, pointeur_code + 1)
			end
		when "<"
			if pointeur > 0
				main(memoire, pointeur - 1, arg, pointeur_code + 1)
			else
				main(memoire, 0, arg, pointeur_code + 1)
			end
		when "+"
			memoire[pointeur] += 1
			main(memoire, pointeur, arg, pointeur_code + 1)
		when "-"
			memoire[pointeur] -= 1
			main(memoire, pointeur, arg, pointeur_code + 1)
		when "."
			print memoire[pointeur].chr
			main(memoire, pointeur, arg, pointeur_code + 1)
		when ","
			memoire[pointeur] = $stdin.gets[0].ord
			main(memoire, pointeur, arg, pointeur_code + 1)
		when "["
			if memoire[pointeur] == 0
				compteur = 1
				while compteur > 0
					pointeur_code +=1
					if arg[pointeur_code] == "["
						compteur +=1
					elsif arg[pointeur_code] == "]"
						compteur -=1
					end
				end
			end
			main(memoire, pointeur, arg, pointeur_code + 1)
		when "]"
			if memoire[pointeur] != 0
				compteur = 1
				while compteur > 0
					pointeur_code -=1
					if arg[pointeur_code] == "["
						compteur -=1
					elsif arg[pointeur_code] == "]"
						compteur +=1
					end
				end
			end
			main(memoire, pointeur, arg, pointeur_code + 1)
		else 
			main(memoire, pointeur, arg, pointeur_code + 1)
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
memoire = Array.new(256, 0)
main(memoire, 0, arg)