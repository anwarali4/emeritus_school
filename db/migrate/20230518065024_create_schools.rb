class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
    	t.string :name
    	t.belongs_to :address
      t.timestamps
    end
  end
end
