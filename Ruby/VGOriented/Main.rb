require 'gosu'
require_relative 'Src/Input'
require_relative 'Src/Sprite'
require_relative 'Src/Rideau'
require_relative 'Src/Mouvement'
require_relative 'Src/Bouton'
require_relative 'Src/Curseur'
require_relative 'Src/Scroller'
require_relative 'Src/DatabaseManager'
require_relative 'Src/DataManager'
require_relative 'Src/Scenes'
require_relative 'Src/Tileset'
require_relative 'Src/MenuHaut'
require_relative 'Src/Cellule'
require_relative 'Src/Map'
require "Yaml"
=begin
YAML::dump(objet) -> Pour seraliser
YAML::load(str) -> Pour déserialiser
=end
class GameWindow < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = "MiniEditor"
		@font = Gosu::Font.new(18)
		@fond = StaticSprite.new("Fond")
		keys = [Gosu::KbUp, Gosu::KbDown, Gosu::KbLeft, Gosu::KbRight, Gosu::KbSpace, Gosu::MsLeft]
		$input = InputManager.new(keys, lambda{|i| button_down?(i)})
		#~ $tiles = Dir["Assets/Tiles/*.png"].map{|i| CelluleSprite.new(File.basename(i, "png"))}
		@menu = MenuHaut.new
		#~ @scenes = [
			 #~ SceneVoid.new,
			 #~ SceneEditor.new
		#~ ]
		#~ @scene = @scenes[0]
		@scene = SceneVoid.new
	end
	def button_down(id)
		$input.addPress(id)
	end
	def update
		$input.update(self.mouse_x, self.mouse_y)
		@scene.update
		@menu.update
		@menu.actions.each{|i| self.method(i).call}
		#~ if @scene.toScene != nil
			#~ @scene = @scene.toScene
		#~ end
		$input.clear
	end
	def draw
		@fond.draw
		@scene.draw
		@menu.draw
		$input.draw
	end
	def new
		carte = Map.new(17, 13, Point.new(64, 32))
		@scene = SceneEditor.new(carte)
	end
	def open
		 
	end
	def save
		
	end
	def quit
		abort
	end
	def nothing
		puts "Il se passe rien !!"
	end
end
window = GameWindow.new
window.show