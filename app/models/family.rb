class Family < ActiveRecord::Base

	#	Relationships
	has_many :members, :dependent => :destroy 
end
