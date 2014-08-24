# Car is a class for creating cars. A new Car object does not require any arguments.

class Car
	def initialize
		@fuel = 10
		@distance = 0
		puts "the initialize method is running automatically."	
	end

	def get_info
		"I'm a car! I've driven #{@distance} miles and have #{@fuel} gallons of gas left."		
	end

# drive allows the car to be driven as long as it has gas.
	def drive(miles_driven)
		testfuel = @fuel - (miles_driven/20.0)
		if testfuel > 0
			@distance += miles_driven
			@fuel = testfuel
			puts "You drove #{miles_driven} miles and have #{@fuel} gallons of gas left."
		else
			drivable_distance = @fuel * 20.0
			@distance += drivable_distance
			@fuel -= (drivable_distance/20)
			puts "You drove #{drivable_distance} miles before you ran out of gas. You have #{@fuel} gallons of gas left."
		end
	end

# fuel_up refills the car's gas tank.
	def fuel_up
		fuel_needed = 10 - @fuel
		cost = fuel_needed * 3.5
		puts "You need #{fuel_needed} gallons to fill up your tank. That'll be #{cost} dollars."
		@fuel += fuel_needed
	end
 end
car_a = Car.new
car_b = Car.new
car_a.get_info
car_b.get_info
car_a.drive(10)
car_b.drive(500)
car_a.get_info
car_b.get_info
car_a.fuel_up
car_b.fuel_up
