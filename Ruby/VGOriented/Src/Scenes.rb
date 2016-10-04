class SceneVoid
	attr_reader :toScene
	def initialize
		@toScene = nil
	end
	def update
		
	end
	def draw
		
	end
end
class SceneEditor
	attr_reader :toScene
	def initialize(carte)
		@carte = carte
	end
	def update
		@carte.update
	end
	def draw
		@carte.draw
	end
end