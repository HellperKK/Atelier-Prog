class Map
	def initialize (width, heigth, position)
		@data = position
		#~ @tileset = Tileset.new
		#~ @map = Array.new(heigth){Array.new(width){CelluleSprite.new(@tileset)}}
		@map = Array.new(heigth){Array.new(width){CelluleSprite.new(@tileset)}}
		@map.each_with_index do |item, index| 
			item.each_with_index do |itembis, indexbis| 
				itembis.data.set_x(indexbis * 32 + @data.x).set_y(index * 32 + @data.y)
			end
		end
	end
	def update
		#~ @map.each{|i| i.each{|y| y.update(@tileset)}}
		@map.each{|i| i.each{|y| y.update(@tileset)}}
	end
	def draw
		@map.each{|i| i.each{|y| y.draw}}
	end
end