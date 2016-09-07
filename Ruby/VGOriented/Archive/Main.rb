require 'gosu'
require_relative 'Src/MainWindow'
require_relative 'Src/AlertWindow'
require_relative 'Src/Input'
require_relative 'Src/Sprite'
require_relative 'Src/Rideau'
require_relative 'Src/Mouvement'
require_relative 'Src/Bouton'
require_relative 'Src/Curseur'
require_relative 'Src/DatabaseManager'
require_relative 'Src/DataManager'
require_relative 'Src/Scenes'
require "Yaml"
class MainProcess
	def initialize
		@keep = true
		@window = MainWindow.new
	end
	def run
		while @keep
			begin
				@window.show
				Signal.trap(3221225786)
			rescue Exception => e
				@window.alert
				@keep = true
			end
		end
	end
end
test = MainProcess.new.run