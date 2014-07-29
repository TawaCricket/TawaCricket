class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :junior_id, null: false, default: 0
      t.timestamps
    end
  end
end
