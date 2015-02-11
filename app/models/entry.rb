class Entry < ActiveRecord::Base
	belongs_to :proyect
	
	validates_associated :proyect
	validates :hours, numericality: true
	validates :minutes, numericality: true



end
