class Proyect < ActiveRecord::Base
	has_attached_file :logo, styles: {:medium => "300x300>", :thumb => "100x100>"}
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	has_many :entries
	validates :name, presence: true, uniqueness: true, length: { maximum: 30 }

	validates :name, uniqueness: true, length: { maximum: 30 }
	validates_presence_of :name, :description




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

	def entries_in_month(month, year)
		first_of_month = Date.new(year, month, 1)
		last_of_month = Date.new(year, month, -1)

		entries.where(created_at: first_of_month..last_of_month)
	end

	def calculate_time_string(entries_for_month)
		sum = 0
		entries_for_month.each do |entry|
			sum += entry.minutes
			sum += (entry.hours*60)
		end
		hours = sum/60
		mins = sum%60
		"It took #{hours} hours and #{mins} minutes"
	end

	def proyect_params
		params.require(:proyect).permit(:name, :description, :logo)
	end

end
