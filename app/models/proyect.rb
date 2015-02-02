class Proyect < ActiveRecord::Base
	
	def self.iron_find(where_clause)
			where(where_clause)
	end

	def self.clean_old
		from = Time.now.midnight - 1.days
		to = Time.now.midnight
		where(updated_at: from..to).each do |proyect|
			proyect.destroy
		end
	end

	def self.last_created_proyects(n)
		limit(n).order("created_at")
	end

end
