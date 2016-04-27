class AdminUser < ActiveRecord::Base

	# To configure a diff table name
	# self.table_name = "admin_users"
	# Tells this class that it has a different table name
	has_and_belongs_to_many :pages
	has_many :section_edits
end
