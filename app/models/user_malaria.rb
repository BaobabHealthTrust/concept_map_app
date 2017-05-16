class UserMalaria < ActiveRecord::Base
	establish_connection :malaria
	self.table_name = 'obs'
end