class Calculator
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def add(n1, n2)
		n1 - n2 # wrong code for testing purposes
	end

	def subtract(n1, n2)
		n1 + n2 # wrong code for testing purposes
	end

	def divide(n1, n2)
		n1 / n2
	end
end