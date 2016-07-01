require 'rspec'
require_relative '../calculator'

describe Calculator do
	before { @calculator = Calculator.new ('RSPec calculator')}

	it "should add 2 numbers correctly" do
		expect(@calculator.add(56, 8)).to eq 64
	end

	#using other matchers to test the .add method - note this happens be to correct as both 3+3 and 3-3 are even
	it "should sum two odd numbers and become even" do
		expect(@calculator.add(3, 3)).to be_even
		expect(@calculator.add(3, 3)).not_to be_odd #another way - same result
	end

	it "should subtract 2 numbers correctly" do
		expect(@calculator.subtract(56, 8)).to eq 48
	end

	it "shoud divide 2 numbers correctly" do
		expect(@calculator.divide(56, 8)).to eq 7
	end

end

# note there is no class here.
# everything is inside the describe method
# describe Calculator - here describe is the method, Calculator is the class (in the other file) we're testing
# but instead of Calculator we could pass any string into the method name