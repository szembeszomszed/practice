require 'test/unit'
require_relative 'calculator'

class CalculatorTest < Test::Unit::TestCase
	def setup
		@calc = Calculator.new('test') 
	end

	def test_addition
		assert_equal 64, @calc.add(56, 8) 
	end

	def test_substraction
		assert_equal 48, @calc.subtract(56, 8) 	
												
	end

	def test_division 
		assert_equal 7, @calc.divide(56, 8) # note the COMMA!
	end

	def test_divide_by_zero
		assert_raise ZeroDivisionError do # here we specify the exception (error) we expect
			@calc.divide(1, 0)
		end
	end
end

# here we create a test instance variable out of the class defined in our code
# parameter can be anything but they need to match the value in assert_equal
# assertion (expected value) will be the first, 
# actual value will be the second in test output