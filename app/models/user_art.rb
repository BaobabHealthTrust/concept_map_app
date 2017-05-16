class UserArt < ActiveRecord::Base
	establish_connection :art
	self.table_name = 'obs'
end