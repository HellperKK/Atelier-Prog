class SceneTitle
	attr_reader :toScene
	def initialize
		@fond = StaticSprite.new("Title")
		@toScene = nil
	end
	def update
	end
	def draw
		@fond.draw
	end
end