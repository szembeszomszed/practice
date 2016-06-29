=begin

PUTTING THINGS TO CONSOLE AND GETTING INPUT
	
puts "What is your name?"
name = gets.chomp
puts "Hello #{name}!"
puts "Now please enter a string!"
input = gets.chomp
puts "Your input has #{input.size} characters."
	
=end




=begin 

OPEN A FILE AND WRITE IT

f = File.open('testnote.txt', 'w')
f.puts "Most tesztelem a dolgokat."
f.close

=end


=begin
	
OPEN A FILE - UGY LATSZIK, A RESCUE EXCEPTIONHOZ KELL A BEGIN A KOD ELEJERE.
	

begin
	File.foreach('testnote.txt') do |line|
		puts line
		p line
		p line.chomp #chops off newline character
		p line.split #creates array of words in line
	end

rescue Exception => e
	puts e.message
	puts "Itt valami nem zsir"
end

=end



=begin -----ARRAY METHODS-----
	
my_array = [12, 34, 54, 5, 67, 543, 1, 578]

puts "array with each"
my_array.each { |element| puts element}

new_array = my_array.select { |num| num % 2 == 0}
			.reject {|num| num > 100}
puts "array with select and reject"
puts new_array

multiplied_array = my_array.map {|num| num * 2}
					.sort!
puts "array with map and sort"
puts multiplied_array

puts "shift"
puts my_array.shift
puts "remaining elements"
my_array.each { |element| puts element}

puts "pop"
puts my_array.pop
puts "remaining elements"
my_array.each { |element| puts element}

puts "sample two elements"
p my_array.sample(2)

=end






=begin -----RANGES-----

my_range = 10..100
puts "my_range.max"
puts my_range.max

puts "my_range === 51.5"
puts my_range === 51.5

puts "my_range == 51.5"
puts my_range == 51.5

puts "my_range.include? 40"
puts my_range.include? 40

age = 25

case age
	when 0..14 then puts "free"
	when 15...25 then puts "student discount"
	when 25..65 then puts "full price"
	else puts "free"
end

array_from_range = my_range.to_a
puts "array from range"
array_from_range.each {|element| print element}

=end





=begin -----HASHES-----


my_hash = {
	name: "Mate",
	age: 32,
	residence: "Budapest"
}

puts "my_hash.length"
puts my_hash.length

puts "my_hash[:name]"
puts my_hash[:name]

my_hash[:team] = "Ujpest"

puts "hash with new key and value"
my_hash.each_pair { |key, value| puts "key: #{key}, value: #{value}"}


word_frequency = Hash.new(0) # 0 is just an example - it is a default value here

puts "sentence = 'Sanyi marcsi Marcsi pali Marcsi Pali'"
sentence = "Sanyi marcsi Marcsi pali Marcsi Pali"

sentence.split.each do |word|
	word_frequency[word.downcase] += 1
end

puts "a hash created by using the words of a sentence as keys and their number of occurence as values"
p word_frequency


#hash as argument to a method

def adjust_colors (props = {foreground: "red", background: "white"})
	puts "Foreground: #{props[:foreground]}" if props[:foreground]
	puts "Background: #{props[:background]}" if props[:background]
end

puts "with default parameters"
adjust_colors

#all three below are valid, second looks to be the clearest way to pass the hash as argument to a method
puts "with new arguments in three different ways"
adjust_colors({:foreground => "green"})
adjust_colors background: "yellow"
adjust_colors :background => "magenta"

#DON'T CONFUSE HASHES WITH BLOCKS - THIS CAN HAPPEN WHEN HASH IS PASSED AS ARGUMENT TO A METHOD

#E.G. PUTS IS A METHOD THAT EXPECTS AN ARGUMENT - BUT BLOCK CAN'T BE AN ARGUMENT!

#this works in two steps
a_hash = {one: 1}
puts a_hash

#but doesn't work in one step, you'll get a syntax error with
#puts { one: 1}

#BECAUSE RUBY GETS CONFUSED AND THINKS { } IS A BLOCK (WHICH IS NOT ACCEPTED AS ARGUMENT)

#as a workaround you can use parens
puts ({one: 1})

#or you can drop the { } altogether
puts one: 1

=end


=begin -----CLASSES-----

class Person
	def initialize(name, age) # "CONSTRUCTOR"
		@name = name
		@age = age
	end

	def name # GETTER METHOD WHICH ENABLES US TO ACCESS THE INSTANCE VARIABLES OUTSIDE OF THE CLASS
		@name
	end

	def name= (new_name) # SETTER METHOD WHICH ENABLES US TO WRITE THE INSTANCE VARIABLES
		@name = new_name
	end

	def get_info
		@additional_info = "interesting"
		"Name: #{@name}, age: #{@age}, additional info: #{@additional_info}"
	end
end

person1 = Person.new("Karcsi", 27)
puts "person1.instance_variables"
p person1.instance_variables
puts "person1.get_info"
puts person1.get_info
puts "person1.instance_variables after calling get_info"
p person1.instance_variables

# DEFINE GETTER/SETTER METHOD

class Ember
	def initialize(name, age) # "CONSTRUCTOR"
		@name = name
		@age = age
	end

	def name # GETTER METHOD WHICH ENABLES US TO ACCESS THE INSTANCE VARIABLES OUTSIDE OF THE CLASS
		@name
	end

	def name= (new_name) # SETTER METHOD WHICH ENABLES US TO WRITE THE INSTANCE VARIABLES
		@name = new_name
	end
end

ember1 = Ember.new("Karcsi", 27) 
puts ember1 #only puts out the object ID
puts ember1.name # with this method now we can read the Class' instance variable
ember1.name = "Sanyi" # with this method we can now write the Class' instance variable
puts ember1.name

# USE ATTRIBUTE METHODS INSTEAD OF DEFINING GETTER/SETTER METHODS

class Human # without initialize we haven't really assigned any properties, 
			#any values to the human. And at that point if you use the human1 variable, 
			#you're not gonna get anything out of it because it's completely blank
	attr_accessor :name, :age # note here there is no control on the data entered e.g. as age (it can be 300 or anything)
end

human1 = Human.new 
puts "checking the name variable before actually setting it"
p human1.name
human1.name = "Jozsi"
human1.age = 32
puts "checking the variables after defining them"
puts human1.name
puts human1.age
human1.age = "harmincketto"
puts "checking the age variable after change it"
puts human1.age


# USE BOTH ATTRIBUTE METHODS AND SETTER METHODS TO HAVE CONTROL ON DATA - ALSO ADD INITIALIZE METHOD

class HomoSapiens
	attr_reader :age # note only reader is used here to ensure control on data entered
	attr_accessor :name

	def initialize(name, ageVar) # CONSTRUCTOR
		@name = name
		self.age = ageVar 	# call the age= method which is defined below - WITHOUT SELF Ruby would take age as a local variable
							# but WITH SELF Ruby will take it as a call for a method
		puts age #calls the age reader
	end

	def age=(new_age)
		@age = new_age unless new_age > 120
	end
end

homo_sapiens1 = HomoSapiens.new("Bela", 4)
puts "#{homo_sapiens1.name}'s age is #{homo_sapiens1.age}."
homo_sapiens1.age = 130
puts "check if age has been changed to an unaccepted value"
puts homo_sapiens1.age


class Csavo
	attr_reader :age # note only reader is used here to ensure control on data entered
	attr_accessor :name

	def initialize(name, ageVar) # CONSTRUCTOR
		@name = name
		self.age = ageVar 	# call the age= method which is defined below - WITHOUT SELF Ruby would take age as a local variable
							# but WITH SELF Ruby will take it as a call for a method
		puts age #calls the age reader
	end

	def age=(new_age)
		@age ||= 5 # until age is assigned, it will use 5 as default value as long as @age is nil
		@age = new_age unless new_age > 120
	end
end

csavo1 = Csavo.new("Konrad", 140)
puts "the default value should come"
puts csavo1.age #default value
csavo1.age = 42 #change age
puts "the new value should come"
puts csavo1.age
csavo1.age = 400 #trying to change age
puts "the previous accepted value should come"
puts csavo1.age


class MathFunctions # in this class we're only injecting so-called utility functions - we don't want to create actual instances of the class

	#first way to define class variable by using self
	def self.double(num) #this is here a Class method! self outside of a method refers to the class
		times_called; num * 2 #calling times_called everytime and perform the operation (these two could be in two lines, as well)
	end

	#second way to define class method by using << self
	class << self #this way it is defined on the class itself
		def times_called
			@@times_called ||= 0; @@times_called += 1
		end
	end
end

	#third way to define class method   - outside of the class
def MathFunctions.triple(num) # triple here is a class method on the MathFunction class
	times_called; num * 3
end

	#no instance created!

	puts "double"
	puts MathFunctions.double 5 # parantheses not necessary  - same as puts MathFunctions.double(5)
	puts "triple"
	puts MathFunctions.triple 3
	puts "times_called"
	puts MathFunctions.times_called


#INHERITANCE
class Dog

	def to_s 	#to_s is the standard Ruby method for converting an Object into a string. 
				#You define to_s when you want a custom string representation for your class
				#u can specify whatever u have to display user as a string you can directly specify in to_s method so that you dont need to call .to_s again
		"Karcsi"
	end

	def bark
		"barks loudly"
	end
end

class SmallDog < Dog
	def bark #overides parent behaviour - BUT ONLY THE ONE SPECIFIED. THE OTHER BEHAVIOUR REMAINS
		"barks quietly"
	end
end

dog = Dog.new # fun fact: .new is a class method
small_dog = SmallDog.new
puts "#{dog}1 #{dog.bark}" # we can call dog for both instances and it will display the string we specified in the parent class in the to_s method
puts "#{dog}2 #{small_dog.bark}"

#TO_S

class Name
  def initialize(title, first_name, middle_name, last_name)
    @title = title
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    first_name + ' ' + middle_name + ' ' + last_name
  end

  def to_s
    full_name
  end      
end

=end

# -----MODULES-----

#Modules as Namespaces

#So you shouldn't have a collision, so that's the idea of a namespace. 
#So for example, you could have a Match class, which makes sense to be part of a Sports module 
#and you could have a match class that's part of a Patterns module.

module Sports
	class Match
		attr_accessor :score
	end
end

module Patterns
	class Match
		attr_accessor :complete
	end
end

match1 = Sports::Match.new #notice the use of ::
match1.score = 45
puts "match1.score"
puts match1.score

match2 = Patterns::Match.new
match2.complete = true
puts "match2.complete"
puts match2.complete


 #Modules ax Mixins
 	#Mixin provide a way to share code among multiple classes

 module SayMyName
 	attr_accessor :name
 	def print_name
 		puts "Name: #{@name}"
 	end
 end

 class Person
 	include SayMyName #include the module's functionality inside the class
 end

 class Company
 	include SayMyName
 end


 person = Person.new 
 person.name = "Heisenberg" # Person doesn't have a .name method but the module does!
 person.print_name
 company = Company.new
 company.name = "Los Pollos Hermanos"
 company.print_name









