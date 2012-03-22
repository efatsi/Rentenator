class Member < ActiveRecord::Base
	# Callbacks
	before_save :adjust_family_size

	#	Relationships
	belongs_to :family

	def adjust_family_size
		self.family.size = self.family.members.length + 1
		self.family.save
	end
	
end

