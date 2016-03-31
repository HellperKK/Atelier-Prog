require 'gosu'
class ModI
	attr_reader :x
	attr_reader :y
	def initialize(x,y)
		@x = x
		@y = y
	end
end
class Curseur < ModI
	attr_reader :x
	attr_reader :y
	def initialize (x, y)
		super(x, y)
	end
	def update(x, y)
		@x = x
		@y = y
	end
end
class Spri < Gosu::Image
	attr_reader :modi
	def initialize (window, img, modi)
		super(window, img, true)
		@modi = modi
	end
	def update(x, y)
		@modi.update(x, y)
	end
	def draw
		super(@modi.x, @modi.y,0)
	end
	def contient (contenu)
		milieu_x = contenu.modi.x + (contenu.width/2)
		milieu_y = contenu.modi.y + (contenu.height/2)
		#(milieu_x > @modi.x and milieu_x < (@modi.x + self.width) and milieu_y > @modi.y and milieu_y < (@modi.y + self.height))
		(milieu_x.between?(@modi.x, (@modi.x + self.width))) && milieu_y.between?(@modi.y, (@modi.y + self.height))
	end
end
class GameWindow < Gosu::Window
	def initialize
		super(320, 240, false)
		self.caption = "Shifumi"
		@font = Gosu::Font.new(self, Gosu::default_font_name, 18)
		kurseur = Curseur.new(160, 120)
		@curseur = Spri.new(self, "Picture/Pointeur1.png", kurseur)
		@compteur = 0
		@message = "#{@compteur}"
		@erreurs = [["Picture/Pierre.png", 16, 110],["Picture/Papier.png", 114, 110],["Picture/Ciseaux.png", 213, 110]].map{|i| Spri.new(self, i[0], ModI.new(i[1], i[2]))}
		$Input = []
	end
	def update
		@curseur.update(self.mouse_x, self.mouse_y)
		@erreurs.each_with_index do |item, index|
			if (item.contient(@curseur)) && ($input.include?(Gosu::MsLeft))
				choix_ennemi = rand(0..2)
				if choix_ennemi == index
					@message = "Egalite #{@compteur}"
				elsif (choix_ennemi == (index + 1)) || ((choix_ennemi + 3 ) == (index + 1))
					@message = "Perdu #{@compteur}"
				else
					@compteur += 1
					@message = "Gagne #{@compteur}"
				end
			end
		end
		$input = []
	end
	def button_down(id)
		$input << id
	end
	def draw
		@erreurs.each{|i| i.draw}
		@font.draw(@message, 120, 25, 0)
		@curseur.draw
	end
end
window = GameWindow.new
window.show