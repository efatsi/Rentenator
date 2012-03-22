class Member < ActiveRecord::Base
	# Callbacks
	before_save :adjust_family_size

	#	Relationships
	belongs_to :family

	
	def adjust_family_size
		self.family.size += 1
	end
	
end

