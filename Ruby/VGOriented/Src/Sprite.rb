class Point
	attr_reader :x
	attr_reader :y
	def initialize (x=0, y=0)
		@x = x
		@y = y
	end
	def update
		
	end
	def set_x(x)
		@x = x
		return self
	end
	def set_y(y)
		@y = y
		return self
	end
	def set_x_relative(x)
		@x += x
		return self
	end
	def set_y_relative(y)
		@y += y
		return self
	end
end

class StaticSprite < Gosu::Image
	attr_accessor	:data
	def initialize (img, data=Point.new, z=0)
		super("Assets/Pictures/#{img}.png")
		@data = data
		@z = z
	end
	def update
		
	end
	def draw
		super(@data.x, @data.y, @z)
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