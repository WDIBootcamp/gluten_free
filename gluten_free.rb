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
		@stomach = []
		@allergies = allergies
		@meal = []
		@name = name
	end

	# Create a method that allows the person to eat and add arrays of food to their stomachs
	# If a food array contains a known allergy reject the food.
	def feed (meal)
		#add the array of the food to their stomach
		@meal.each	do |ingredient| 
			if ingredient == @allergies
				begin 
					raise AllergyError.new("You cant eat that! 
						You are allergic to #{@allergies}")
				# rescue AllergyError => error
				# 	puts "You are allergic to #{error}"
				end

			else 
			@stomach << @meal
			end
		end
	end

	def food 
		puts "What would you like to eat? [1]Pizza, [2]Scallops or [3]Water?"

		# food options:
		# maybe turn these into a hash for clear purposes
		food_choice = gets.chomp
		pizza = ["cheese", "gluten", "tomatoes"]
		pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
		water = ["h", "h", "o"]

		case food_choice
		when "1" then @meal = pizza 
		when "2" then @meal = pan_seared_scallops
		when "3" then @meal = water
		end

		return @meal 
	end

end
 


# Create a Person named Chris. Chris is allergic to gluten.
# Create a Person named Beth. Beth is allergic to scallops.
# Feed them the following foods
 
# When a person attempts to eat a food they are allergic to, raise a custom exception
# For example:  AllergyError
 
# Bonus: When a person attempts to eat a food they are allergic to,
#        ... remove ALL the food from the person's stomach before raising the exception