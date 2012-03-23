class Member < ActiveRecord::Base
	# Callbacks
	
	#	Relationships
	belongs_to :family
	has_many :payments

	# Validations
	validates_presence_of :name
	
	
end

