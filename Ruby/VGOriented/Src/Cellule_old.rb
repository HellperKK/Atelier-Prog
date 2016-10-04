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

class CelluleSprite < StaticSprite
	attr_accessor	:data
	def initialize (img, data=CelluleB.new, z=0)
		super("Assets/Pictures/#{img}.png")
		@data = data
		@z = z
	end
	def update
		@data.update(self.clicked_on?)
	end
	def draw
		sprite = @data.passable ? 0 : 1
		$tiles[sprite].draw(@data.x, @data.y, 0)
	end
	def contientPixel(x, y)
		x.between?(@data.x, @data.x + self.width) && y.between?(@data.y, @data.y + self.height)
	end
	def contientPoint(point)
		point.x.between?(@data.x, @data.x + self.width) && point.y.between?(@data.y, @data.y + self.height)
	end
	def clicked_on?
		$input.hasPressDown?(Gosu::MsLeft) && self.contientPoint($input.mouseCoords)
	end
	def mouse_over?
		self.contientPoint($input.mouseCoords)
	end
end