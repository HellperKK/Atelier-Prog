class Tileset < Gosu::Image
	def initialize(z=0)
		@imgs =Gosu::Image.load_tiles("Assets/Tiles/Default.png", 32, 32)
		@z = z
	end
	def update
		
	end
	def draw(x, y, z, id)
		@imgs[id].draw(x, y, z)
	end
	def get_at(id)
		@imgs[id]
	end
end