class Payment < ActiveRecord::Base

	#	Relationships
	belongs_to :member
	
	# Validations
	validates_presence_of :amount, :name
	
	# Methods
	def update_member_balance(amount, member)
		mem = member
		fam = mem.family
		
		mem.bills_paid += amount
		mem.save
		
		fam_size = fam.members.length
		fam.members.each do |m|
			m.balance -= amount/fam_size
			m.balance += amount if m == mem
			m.save
		end
		
	end
	
end
