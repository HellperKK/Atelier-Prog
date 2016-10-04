class CelluleB < Point
	attr_reader :passable
	def initialize(x=0, y=0)
		super(x, y)
		@passable = true
	end
	def update(bool)
		if bool
			self.swap
		end
	end
	def swap
		@passable = ! @passable
	end
end
class CelluleSprite
	@@tiles = Gosu::Image.load_tiles("Assets/Tiles/Default.png", 32, 32)
	attr_reader :data
	#~ def initialize(tileset)
	def initialize
		@data = CelluleB.new
		#~ bool = @data.passable ? 0 : 1
		#~ @tile = tileset.get_at(bool).clone
	end
	#~ def update(tileset)
	def update
		#~ bool = @data.passable ? 0 : 1
		#~ @tile = tileset.get_at(bool).clone
		@data.update(self.clicked_on?)
	end
	def draw
		bool = @data.passable ? 0 : 1
		@@tiles[bool].draw(@data.x, @data.y, 0)
	end
end