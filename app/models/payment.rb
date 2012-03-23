class Payment < ActiveRecord::Base

	#	Relationships
	belongs_to :member
	
	# Methods
	def update_member_balance(amount)
		mem = self.member
		fam = mem.family
		
		mem.bills_paid += amount
		mem.balance += amount
		mem.save
		
		fam_size = fam.members.length
		fam.members.each do |m|
			m.balance -= amount/fam_size
			m.save
		end
		
	end
	
end
