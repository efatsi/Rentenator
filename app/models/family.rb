class Family < ActiveRecord::Base

	#	Relationships
	has_many :members, :dependent => :destroy 
	
	# Validations
	validates_presence_of :name
end
