class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.timestamps
    end
  end
end
