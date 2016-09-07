class DataFile
	def initialize(listes)
		@datas = listes
		@champs = @datas[0]
		@enregistrements = @datas[1..-1]
	end
	def match(keys)
		@champs == keys
	end
	def exportDico
		@enregistrements.map do |item|
			dico = Hash.new
			item.each_with_index{|itembis, index| dico[@champs[index]] = itembis}
			dico
		end
	end
	def exportFile
		if @datas != []
			@datas.map{|i| i.join(";")}.join("\n") 
		else
			""
		end
	end
	def to_s
		@datas.to_s
	end
end