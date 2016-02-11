#########################################
##Fonctions
#########################################
def regroupe_par(liste, taille)
	if liste.length < taille
		[liste]
	else
		taillebis = taille - 1
		[liste[0..taillebis]] + regroupe_par(liste[taille..-1], taille)
	end
end
def creerDirectory(i)
    parent = File.dirname(i)
    unless File.exist?(i)
        if File.exist?(parent)
            Dir.mkdir(i)
        else
            creerDirectory(parent)
            creerDirectory(i)
        end
    end
end
def chercheBalise(texte, balise)
	debut = "<#{balise}>"
	fin = "</#{balise}>"
	taille = debut.length
	debut = texte.index(debut)
	fin = texte.index(fin)
	if debut != nil && fin != nil
		debut = debut + taille
		fin = fin - 1
		texte[debut..fin]
	else
		""
	end
end
#########################################
##Classes
#########################################
class Article
	attr_reader :date, :adresse_finale, :titre, :content
	def initialize(adresse)
		@adresse = adresse
		@adresse_finale = adresse.sub("Input", "Output").sub(".txt", ".html")
		texte = File.open(adresse, "r").read
		@titre = chercheBalise(texte, "title")
		@date = chercheBalise(texte, "date")
		@author = chercheBalise(texte, "author")
		@keywords =  chercheBalise(texte, "kwords")
		@desc = chercheBalise(texte, "desc")
		@sujet = chercheBalise(texte, "sujet").split(", ")
		@content = chercheBalise(texte, "content").strip
		date_conv
	end
	def date_conv
		temps = @date.split("/").map{|i|i.to_i}
		@date = Time.new(temps[2], temps[1], temps[0])
	end
	def to_html
		resultat = "<html>\n<head>\n<title>#{@titre}</title>\n<link rel=\"stylesheet\" href=\"Style.css\">\n"
		resultat += "<meta name=\"description\" content=\"#{@desc}\">\n"
		resultat += "<meta name=\"keywords\" content=\"#{@keywords}\">\n"
		resultat += "<meta name=\"author\" content=\"#{@author}\">\n"
		resultat += "<meta name=\"date\" content=\"#{@date}\">\n"
		resultat += "</head>\n<body>\n"
		resultat += "<a href=\"index2.html\" class=\"retour\">Page principale</a>\n"
		resultat += "<div id=\"entete\">\n"
		resultat += "<h1>#{@titre}</h1>\n"
		resultat += "<p>#{@desc}</p>\n"
		resultat += "</div>\n"
		resultat += "<div id=\"corps\">\n#{@content}\n</div>\n"
		resultat += "</body>\n</html>\n"
		resultat
	end
	def to_s
		"titre=#{@titre}
auteur=#{@author}
date=#{@date}
kwords=#{@keywords}
desc=#{@desc}
content=#{@content}"
	end
end
class AritcilePlus
	def initialize(liste, index, index_max)
		@liste = liste
		@index = index
		@index_max = index_max
	end
	def to_html
		resultat = "<html>\n<head>\n<title>Kustom's Kromatiks</title>\n<link rel=\"stylesheet\" href=\"Style.css\">\n"
		resultat += "</head>\n<body>\n"
		resultat += precSuiv 
		resultat += "<div id=\"corps\">\n<h1>Kustom's Kromatiks</h1>\n</div>\n"
		@liste.each do |i|
			resultat += "<div id=\"corps\">\n<h1>#{i.titre}</h1>\n"
			resultat += "<p>#{i.content[0..359]}...</p>\n"
			resultat += "<a href=\"#{i.adresse_finale.sub("Output/", "")}\">cliquer ici pour lire la suite</a>\n"
			resultat += "</div>\n"
		end
		resultat += precSuiv
		resultat += "</body>\n</html>\n"
		resultat
	end
	def precSuiv
		resultat = ""
		unless (@index == 0)
			@index -= 1
			resultat += "<a href=\"#{trouveCheminBis}\" class=\"retour\">precedent</a>\n"
			@index += 1
		end
		unless (@index == @index_max)
			@index += 1
			resultat += "<a href=\"#{trouveCheminBis}\" class=\"retour\">suivant</a>\n"
			@index -= 1
		end
		resultat
	end
	def trouveChemin
		if @index == 0
			"Output/index2.html"
		else
			"Output/index2_#{@index}.html"
		end
	end
	def trouveCheminBis
		if @index == 0
			"index2.html"
		else
			"index2_#{@index}.html"
		end
	end
	def to_s
		"je suis la page #{@index} sur #{@index_max}"
	end
end