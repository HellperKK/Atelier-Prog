class Scroller < StaticSprite
	def initialize(img, boutons)
		super(img)
		@boutons = boutons
		@showed_full = false
	end
	def update
		@data.update
		if (! @showed_full) && self.mouse_over?
			@showed_full = true
			@boutons.each_with_index{|item, index| item.data.set_x(@data.x).set_y(@data.y + (index + 1) * 32)}
		end
		unless self.mouse_over? || @boutons.any?{|i| i.mouse_over?}
			@showed_full = false
			@boutons.each{|item| item.data.set_y(@data.y)}
		end
	end
	def draw
		super
		if @showed_full
			@boutons.each{|item| item.draw}
		end
	end
	def actions
		@boutons.map{|i| i.update}.select{|i| i != nil}
	end
end