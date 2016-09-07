class MenuHaut
	attr_reader :toScene
	def initialize
		@scrollers = []
		boutons = [
			ButtonSprite.new("Nouveau", ButtonData.new(:new)),
			ButtonSprite.new("Ouvrir", ButtonData.new(:open)),
			ButtonSprite.new("Sauver", ButtonData.new(:save)),
			ButtonSprite.new("Quitter", ButtonData.new(:quit)),
			]
		@scrollers << Scroller.new("Fichier", boutons)
		@toScene = nil
		@scrollers.each_with_index{|item, index| item.data.set_x(index * 96)}
	end
	def update
		@scrollers.each{|i| i.update}
	end
	def draw
		@scrollers.each{|i| i.draw}
	end
	def actions
		@scrollers.map{|i| i.actions}.flatten
	end
end