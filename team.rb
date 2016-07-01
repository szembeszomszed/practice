class Team
	include Enumerable

	attr_accessor :name, :players

	def initialize (name) # construct the team itself
		@name = name
		@players = [] # create an empty array when constructing the Team instance
	end

	def add_players (*player) # splat - we don't yet know how many arguments we'll pass
		@players += player # add player arguments to @players array
	end

	def to_s # print some information about the team
		"#{@name} team: #{@players.join(", ")}"
	end

	def each # this method has to be defined for getting Enumerable's functionalities
		@players.each { |player| yield player } # loop through players array and yield each element to a block
	end
end