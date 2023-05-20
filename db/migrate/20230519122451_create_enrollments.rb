class CreateEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :enrollments do |t|
    	t.belongs_to :batch
    	t.belongs_to :student
    	t.integer :status, default: 0
      t.timestamps
    end
  end
end
