class ButtonData < Point
	attr_reader :x
	attr_reader :y
	attr_reader :effet
	def initialize (effet, x=0, y=0)
		super(x, y)
		@effet = effet
	end
	def update(bool)
		bool ? @effet : nil
	end
end

class ButtonSprite < StaticSprite
	def update
		@data.update(self.clicked_on?)
	end
end