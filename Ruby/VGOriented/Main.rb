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
require_relative 'Src/MenuHaut'
require "Yaml"
=begin
YAML::dump(objet) -> Pour seraliser
YAML::load(str) -> Pour déserialiser
=end
class GameWindow < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = "JeuCartesVerehn"
		@font = Gosu::Font.new(18)
		keys = [Gosu::KbUp, Gosu::KbDown, Gosu::KbLeft, Gosu::KbRight, Gosu::KbSpace, Gosu::MsLeft]
		$input = InputManager.new(keys, lambda{|i| button_down?(i)})
		@scene = SceneTitle.new
		@menu = MenuHaut.new
	end
	def button_down(id)
		$input.addPress(id)
	end
	def update
		$input.update(self.mouse_x, self.mouse_y)
		@scene.update
		@menu.update
		@menu.actions.each{|i| self.method(i).call}
		if @scene.toScene != nil
			@scene = @scene.toScene
		end
		$input.clear
	end
	def draw
		@scene.draw
		@menu.draw
		$input.draw
	end
	def new
		
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