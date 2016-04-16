def main(arg)
	memoire = Array.new(256, 0)
	pointeur = 0
	pointeur_code = 0
	while pointeur_code < arg.length
		test = arg[pointeur_code]
		case test
		when ">"
			if pointeur < 256
				pointeur += 1
			else
				pointeur = 256
			end
		when "<"
			if pointeur > 0
				pointeur -= 1
			else
				pointeur = 0
			end
		when "+"
			memoire[pointeur] += 1
		when "-"
			memoire[pointeur] -= 1
		when "."
			print memoire[pointeur].chr
		when ","
			memoire[pointeur] = $stdin.gets[0].ord
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
		end
		pointeur_code += 1
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
main(arg)