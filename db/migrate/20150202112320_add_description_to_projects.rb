class AddDescriptionToProjects < ActiveRecord::Migration
  def change
  	add_column :proyects, :description, :text
  end
end
