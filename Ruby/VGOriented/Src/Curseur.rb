class MouseSprite < StaticSprite
	attr_reader :data
	def initialize (data, z=0)
		super("Cursor", data)
	end
	def update(x, y)
		@data.set_x(x).set_y(y)
	end
end