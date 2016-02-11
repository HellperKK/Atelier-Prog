# encoding: UTF-8
require "Yaml"
class Liste
	def initialize (contenu)
		@contenu = contenu
	end
	def show (args)
		details = look_at(args, 0, 0).to_i
		taille = 25 * details
		if @contenu == []
			puts "The list is empty"
		elsif @contenu.length <= taille	
			puts "this page doesn't exist"
		else
			puts "page number #{details}"
			page = @contenu[taille..(taille+24)]
			page.each_index do |i|
				puts "#{i + taille} #{page[i]}"
			end
		end
	end
	def add(args)
		tache = look_at(args, 0, "")
		if tache == ""
			puts "There is nothig to add"
		else
			objet = Tache.new(tache)
			@contenu << objet
		end
	end
	def edit(args)
		page = look_at(args, 0, 0).to_i
		tache = look_at(args, 1, 0).to_i
		modif = look_at(args, 2, 0)
		element = page * 25 + tache
		@contenu[element].tache = modif
	end
	def remove(args)
		page = look_at(args, 0, 0).to_i
		tache = look_at(args, 1, 0).to_i
		element = page * 25 + tache
		@contenu.delete_at(element)
	end
	def remake(args)
		page = look_at(args, 0, 0).to_i
		tache = look_at(args, 1, 0).to_i
		element = page * 25 + tache
		@contenu[element].statut = 0
	end
	def finish(args)
		page = look_at(args, 0, 0).to_i
		tache = look_at(args, 1, 0).to_i
		element = page * 25 + tache
		@contenu[element].statut = 1
	end
	def abandon(args)
		page = look_at(args, 0, 0).to_i
		tache = look_at(args, 1, 0).to_i
		element = page * 25 + tache
		@contenu[element].statut = 2
	end
	def clear(args)
		@contenu = []
	end
	def cust_sort(args)
		@contenu.sort!{|x, y| x.statut <=> y.statut}
	end
	def help
		txt = File.open("Help.txt", "w")
		txtbis = txt.read
		puts txtbis
		txt.close
	end
	def to_s
		@contenu.to_s
	end

end
class Tache
	attr_accessor :tache
	attr_accessor :statut
=begin
	Pour les differents status
	0 = Commencé
	1 = Terminé
	2 = Abandonné
=end
	def initialize (tache)
		@tache = tache
		@statut = 0
	end
	def statuttxt
		case @statut
		when 0 then "S"
		when 1 then "F"
		else "A"
		end
	end
	def to_s
		statuttxt + " -> " + @tache
	end
end
##################################################
##Parseurs
##################################################
def chercheFonc(tab)
	fonction = tab[0]
	arguments = tab[1..-1]
	case fonction
	#fonctions generales
	when "show" then $liste.show(arguments)
	when "add" then $liste.add(arguments)
	when "edit" then $liste.edit(arguments)
	when "remove" then $liste.remove(arguments)
	#when "clear" then $liste.clear(arguments)
	when "sort" then $liste.cust_sort(arguments)
	when "remake" then $liste.remake(arguments)
	when "finish" then $liste.finish(arguments)
	when "abandon" then $liste.abandon(arguments)
	when "help" then $liste.help
	#fonction erreur
	else  puts "Unknown instruction"
	end
end
def look_at(array, indice, save)
	if indice <= (array.length-1)
		array[indice]
	else
		save
	end
end
def parseur(line)
	line = line.strip
	point = 0
	if line == ""
		return []
	elsif (not line.include?(" "))
		return [line]
	else
		if line[point] == '"'
			point += 1 
			while line[point] != '"'
				point += 1
			end
		else
			point += 1 
			while line[point] != " "
				point += 1
			end
			point -= 1
		end
		#puts "[#{line}]"
		[line[0..point]] + parseur(line[(point+1)..-1])
	end
end
def save
	f = File.open("Liste.txt", "w")
	f.write(YAML::dump($liste))
	f.close
end
##################################################
##Code Principal
##################################################
unless File.file?("Liste.txt")
	f = File.open("Liste.txt", "w")
	f.write(YAML::dump(Liste.new([])))
	f.close
end
f = File.open("Liste.txt","r")
content = f.read
f.close
$liste = YAML::load(content)
while true
	inpute = gets.chomp
	if inpute.split(" ")[0] == "quit"
		break
	else
		ligne = parseur(inpute)
		chercheFonc(ligne)
	end
	save
end
f = File.open("Liste.txt", "w")
f.write(YAML::dump($liste))
f.close