class Bank
	attr_accessor :name
	attr_accessor :customers
	attr_accessor :customersmoney

	def initialize(name)
		@name=name
		puts "#{@name} was just created."
		@customers=[]
		@customersmoney=[]
	end

	def open_account(newcustomer)
		@customers.push(newcustomer)
		@customersmoney.push(0)
		puts "#{newcustomer.name}, thanks for opening an account at #{@name}!"
	end

	def deposit(customer, amount)
		indexCustomer=@customers.index(customer)
		if indexCustomer
			if customer.money<amount
				puts "Deposit amount #{amount} is greater than #{customer.name} has (#customer.money})!"
			else
				@customersmoney[indexCustomer]+=amount
				customer.money-=amount
				puts "#{customer.name} deposited #{amount} to #{@name}. #{customer.name} has #{customer.money}. #{@customers[indexCustomer].name} acccount has #{@customersmoney[indexCustomer]}."
			end
		else
			puts "#{customer.name} is not a member of the bank!"
		end
	end

	def withdraw(customer, amount)
		indexCustomer=@customers.index(customer)
		if indexCustomer
			if amount>@customersmoney[indexCustomer]
				puts "Withdrawal amount #{amount} is greater than #{customer.name}s balance of @customersmoney[indexCustomer]!"
			else
				@customersmoney[indexCustomer]-=amount
				customer.money+=amount
				puts "#{customer.name} withdrew #{amount} to #{@name}. #{customer.name} has #{customer.money}. #{@customers[indexCustomer].name} account has #{@customersmoney[indexCustomer]}."
			end
		else
			puts "#{customer.name} is not a member of #{name}!"
		end
	end

	def transfer(customer, instanceBank, amount)
		indexCustomer=@customers.index(customer)
		indexOtherBankCustomer=instanceBank.customers.index(customer)
		if indexCustomer && indexOtherBankCustomer
			if amount>@customersmoney[indexCustomer]
				puts "Withdrawal amount #{amount} is greater than #{customer.name}s balance of @customersmoney[indexCustomer]!"
			else
				@customersmoney[indexCustomer]-=amount
				instanceBank.customersmoney[indexOtherBankCustomer]+=amount;
				puts "#{customer.name} transfered #{amount} from the #{@name} to the #{instanceBank.name} account. The #{@name} account has #{@customersmoney[indexCustomer]} and the #{instanceBank.name} account has #{instanceBank.customersmoney[indexOtherBankCustomer]}."
			end
		else
			puts "#{customer.name} is not a member of #{@name} and/or #{instanceBank.name}!"
		end
	end

end

class Person
	attr_accessor :name
	attr_accessor :money

	def initialize(name, money)
		@name=name
		@money=money
		puts "Hi, #{name}. You have #{money}!"
	end
end

# Creating accounts
chase = Bank.new("JP Morgan Chase") #JP Morgan Chase bank was just created.
wells_fargo = Bank.new("Wells Fargo") #Wells Fargo bank was just created.
me = Person.new("Shehzan", 500) #Hi, Shehzan. You have $500!
friend1 = Person.new("John", 1000) #Hi, John. You have $1000!
#delete block
test1=Person.new("what",2002)
#delete block
chase.open_account(me) #Shehzan, thanks for opening an account at JP Morgan Chase!
chase.open_account(friend1) #John, thanks for opening an account at JP Morgan Chase!
wells_fargo.open_account(me) #Shehzan, thanks for opening an account at Wells Fargo!
wells_fargo.open_account(friend1) #John, thanks for opening an account at Wells Fargo!

# Withdrawing and Depositing
chase.deposit(me, 200) #Shehzan deposited $200 to JP Morgan Chase. Shehzan has $300. Shehzan's acccount has $200.
chase.deposit(friend1, 300) #John deposited $300 to JP Morgan Chase. John has $700. John's account has $300.
chase.withdraw(me, 50) #Shehzan withdrew $50 from JP Morgan Chase. Shehzan has $350. Shehzan's account has $150.

# Transfers
chase.transfer(me, wells_fargo, 100) #Shehzan transfered $100 from the JP Morgan Chase account to the Wells Fargo account. The JP Morgan Chase account has $50 and the Wells Fargo account has $100.

# # Extra Credit level 1: Validate
# chase.deposit(me, 5000) #Shehzan does not have enough cash to deposit $5000.
# chase.withdraw(me, 5000) #Shehzan does not have enough money in the account to withdraw $5000.

# # Extra Credit level 2: Count totals
# puts chase.total_cash_in_bank #JP Morgan has $350 in the bank.
# puts wells_fargo.total_cash_in_bank #Wells Fargo has $100 in the bank.

# #Extra Credit level 5: Credit Cards
# #For this open-ended problem, you should create your own test cases and add it to the bottom of your solution
