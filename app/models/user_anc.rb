class UserAnc < ActiveRecord::Base
	establish_connection :anc
	self.table_name = 'obs'
end