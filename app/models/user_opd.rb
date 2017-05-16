class UserOpd < ActiveRecord::Base
	establish_connection :opd
	self.table_name = 'obs'
end