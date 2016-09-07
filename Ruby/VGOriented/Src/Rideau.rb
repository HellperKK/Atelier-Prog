class Rideau < StaticSprite
	attr_reader :data
	def initialize (img, data=Point.new, z=0)
		super(img)
		@data = data
		@z = z
		@mouvement = nil
	end
	def update
		if @mouvement != nil
			@mouvement.update
			if @mouvement.fini?
				@mouvement = nil
				$input.activate
			end
		end
	end
	def moveVertical(pixel_y, pas_y)
		if @movement == nil
			@mouvement = MouvementRelatif.new(0, 0, pixel_y, pas_y, @data)
		end
	end
	def isDown
		data.y == 0
	end
	def isUp
		data.y == -400
	end
end