class Family < ActiveRecord::Base

	#	Relationships
	has_many :members
	
	
	def adjust_family_size
		self.size = self.members.length + 1
		self.save
	end
	
	
end
