########
##Cette première classe est là pour déterminer le comportement des différentes tables, gérées par héritage
##Instancier depuis cette classe n'a donc pas de sens
########
class StaticDatabase
	def initialize
		@name = self.class.name
		@chemin = "Database/Tables/#{@name}.csv"
		unless File.file?(@chemin)
			self.makeFile
		end
		content = File.open(@chemin, "r"){|i| i.read}.split("\n").map{|i| i.strip.split(";")}
		@datas = DataFile.new(content)
		@dicoList = []
		if @datas.match(self.shape.keys)
			@dicoList = @datas.exportDico
		else
			File.open(@chemin.sub("Tables", "Backup"), "w"){|i| i.write(@datas.exportFile)}
			self.makeFile
		end
		self.convert
	end
	def makeFile
		a = DataFile.new([self.shape.keys])
		File.open(@chemin, "w"){|i| i.write(a.exportFile)}
	end
	def convert
		self.shape.each do |key, value|
			@dicoList.each{|i| i[key] =  i[key].method(value).call}
		end
	end
	def takeAll
		@dicoList
	end
	def takeAt(int)
		@dicoList[int]
	end
	def to_s
		@dicoList.to_s
	end
	def shape
		return {}
	end
end

###Bases de données qui en découlent
class Resolution < StaticDatabase
	def shape
		return {
		"longueur" => :to_i,
		"hauteur" => :to_i
		}
	end
end
class Cartes < StaticDatabase
	def shape
		return {
		"id" => :to_i,
		"nom" => :to_s,
		"prix" => :to_i,
		"effet" => :to_sym
		}
	end
end
