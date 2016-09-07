class InputManager
	def initialize (keys, fun)
		@keys = keys
		@fun = fun
		@press_down = []
		@pressed = []
		@mouse = MouseSprite.new(Point.new)
		@active = true
	end
	def update(x, y)
		if @active
			@mouse.update(x, y)
			@pressed = @keys.select{|i| @fun.call(i)}
		end
	end
	def clear
		@press_down = []
		@pressed = []
	end
	def draw
		@mouse.draw
	end
	def validKey(x)
		@keys.include?(x)
	end
	def addPress(id)
		if self.validKey(id) && @active
			@press_down << id
		end
	end
	def hasPressDown?(key)
		@press_down.include?(key)
	end
	def hasPressed?(key)
		@pressed.include?(key)
	end
	def mouseCoords
		@mouse.data
	end
	def activate
		@active = true
	end
	def desactivate
		@active = false
	end
end