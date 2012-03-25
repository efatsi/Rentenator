load 'member.rb'
			

class Family
	
	def initialize(members)
		@family = members
		@size = members.length
	end
	
	attr_accessor :family
	attr_reader :size
	
	def show_balances
		@family.each do |m|
			p "#{m.name} has a balance of " + (m.balance < 0 ? "-" : "") + "$#{m.balance.abs}"
		end
	end	
	
	def negatives
		negs = @family.map{ |m| m if m.balance < 0 }.compact
 		negs.sort! {|a,b| a.balance <=> b.balance}
	end
	
	def positives
		pos = @family.map{ |m| m if m.balance > 0 }.compact
		# sort members with biggest balances first
 		pos.sort! {|a,b| b.balance <=> a.balance}
	end	

	def zeros
		zeros = @family.map{ |m| m if m.balance == 0 }.compact
	end
	
	def make_check
		return "All squared away!" if zeros.length == self.size
		return "No one is in debt, but people are owed money (math error)" if negatives.length == 0
		return "No one is owed money, but people are in debt (math error)" if positives.length == 0
		giver = negatives.first
		getter = positives.first
		check_amount = giver.balance.abs
		# here is the simulated payment
		giver.pay_member(getter, check_amount)
	end
	
	def even_it_up
		return "Balances do not add up!!"  unless valid_balances?
		(1..@size).each do
			p make_check
		end
		return "All done"
	end
	
	def valid_balances?
		neg_amount = 0; pos_amount = 0;
		@family.each { |m| (m.balance >= 0 ? pos_amount += m.balance : neg_amount += m.balance) }
		return neg_amount + pos_amount == 0
	end
	

		

end
