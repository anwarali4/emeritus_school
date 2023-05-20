class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
    	t.belongs_to :course
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :status
      t.timestamps
    end
  end
end
