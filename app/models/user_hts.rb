class UserHts < ActiveRecord::Base
	establish_connection :hts
	self.table_name = 'obs'
end