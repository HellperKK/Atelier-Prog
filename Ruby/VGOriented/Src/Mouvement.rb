class MouvementRelatif
	def initialize (distance_x, pas_x, distance_y, pas_y, point, wait=true)
		@distance_x = distance_x
		@pas_x = pas_x
		@distance_y = distance_y
		@pas_y = pas_y
		@point = point
		@parcouru_x = 0
		@parcouru_y = 0
		if wait
			$input.desactivate
		end
	end
	def update
		if @distance_x != @parcouru_x
			@point.set_x_relative(@pas_x)
			@parcouru_x += @pas_x
		end
		if @distance_y != @parcouru_y
			@point.set_y_relative(@pas_y)
			@parcouru_y += @pas_y
		end
		#~ sleep(0.016)
		sleep(0.05)
	end
	def fini?
		((@distance_x == @parcouru_x) && (@distance_y == @parcouru_y))
	end
end