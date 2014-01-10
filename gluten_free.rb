require 'pry'
#Title: Gluten Free
 
#Prerequisites:
#- Ruby
#    - Exceptions
#    - Hashes & Arrays
#    - Objects & Classes
 
#Objectives:
#- Work with exceptions, classes, class variables, conditions
 
"======================================================================"
 
class AllergyError < ArgumentError
	# attr_reader :object

	# def initialize(object)
	# 	@object = object
	# end

end

class Person

	# A person will have a name, a stomach and allergies
	# attr_accesor allows these items to be both written and read
	attr_accessor :name, :allergies
	def initialize (name, allergies)
		#try to initialize all your instance veriables in the initialize
		@stomach = []
		@allergies = allergies
		@meal = []
		@name = name
	end

	# Create a method that allows the person to eat and add arrays of food to their stomachs
	# If a food array contains a known allergy reject the food.
	def feed (meal)
		# add the array of the food to their stomach
		# @meal.each	do |ingredient| 
		# begin 
		# 	if ingredient == @allergies
		# 		raise AllergyError.new("You cant eat that! You are allergic to #{@allergies}")
		# 		@stomach = []
		# 	else
		# 	@stomach << ingredient
		# 	end
		# rescue AllergyError => error
		# 		puts error
		# end

		# end

		begin
			if @meal.include?(@allergies)
				@stomach = []
				raise AllergyError.new("You cant eat that! You are allergic to #{@allergies}")
		 	else
		 		@stomach << @meal
		 	end
		rescue AllergyError => error
			puts error
		end
	end

	def eat 
		puts "What would you like to eat? [1]Pizza, [2]Scallops or [3]Water?"

		food_choice = gets.chomp

		# food options:
		# maybe turn these into a hash for clearer purposes
		pizza = ["cheese", "gluten", "tomatoes"]
		pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
		water = ["h", "h", "o"]

		case food_choice
		when "1" then @meal = pizza 
		when "2" then @meal = pan_seared_scallops
		when "3" then @meal = water
		end

		feed(@meal)
		# return @meal
	end

	def start
		puts "What is your name?"
		@name = gets.chomp
		puts "Are you allergic to: [1] gluten, [2] scallops, or [3] hydrogen?"
		allergy_choice = gets.chomp

		case allergy_choice
		when "1" then @allergies = "gluten"
		when "2" then @allergies = "scallops"
		when "3" then @allergies = "hydrogen"
		end

		eat()

		puts "Do you want to see what is in your stomach?"
		see_stomach = gets.chomp

		case see_stomach
		when "yes" then p @stomach
		when "no" then puts "Ok!"
		end

		puts " Do you want to eat again?"
		eat_again = gets.chomp

		case eat_again
		when "yes" then eat()
		when "no" then puts "Good Bye then."
		end

	end

end

new_person = Person.new(@name, @allergies)
new_person.start()


# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods
 
# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
 
# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception


