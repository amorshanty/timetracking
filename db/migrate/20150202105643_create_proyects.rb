class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
    	t.string :name

      t.timestamps null: false
    end
  end
end
