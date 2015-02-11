class AddLogo < ActiveRecord::Migration

	def self.up
		add_attachment :proyects, :logo
	end

	def self.down
		remove_attachment :proyects, :logo
	end

end
