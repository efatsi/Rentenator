class Member
	
	def initialize(name)
		@name = name
		@bills_paid = 0
		@balance = 0
	end
	
	attr_accessor :name, :bills_paid, :balance
		
	def pay_member(getter, amount)
		giver = self
		giver.balance += amount
		getter.balance -= amount
		"#{self.name} is paying #{getter.name} $#{amount}."
	end		
		
	def pay_bill(amount, family)
		self.balance += amount
		family.each { |m| m.balance -= amount/family.length }
	end	

end

