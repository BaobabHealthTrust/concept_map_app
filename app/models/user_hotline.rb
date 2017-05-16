class UserHotline < ActiveRecord::Base
	establish_connection :hotline
	self.table_name = 'obs'
end