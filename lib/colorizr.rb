
class String
	 @@color = ["red", "green", "yellow", "blue", "pink", "light-blue", "white", "light-grey", "black"] #class varaible @@color returns an array of all the colors
	 @@color_hash = Hash[red: "\e[31m", green: "\e[32m", yellow: "\e[33m", blue: "\e[34m", pink: "\e[35m", light_blue: "\e[94m", white: "\e[97m", light_grey: "\e[37m", black: "\e[30m"]
	 # @@color_hash returns an Hash with color and their color code
	
	def self.colors  #class method returns colors
		@@color
	end 

	def self.sample_colors 
		color_code = "\e[0m" 
		@@color_hash.each do |color, code| #enter into each loop to print particular color 
			puts "This is #{code}#{color}.#{color_code}"  #prints the text in the same color
		end
		String.create_colors  #calling create_colors method 
	end 


	def self.create_colors
		@@color_hash.each do |color, code|
			self.send(:define_method, "#{color}") do #creates an each color method
				"#{code}#{self}\e[0m"   #prints the string in calling method color
			end
		end
	end
	
end 

