class Family < ActiveRecord::Base
	# Callbacks
	before_save :adjust_family_size

	#	Relationships
	has_many :members
	
	def adjust_family_size
		self.size = self.members.length
	end
	
	
end
