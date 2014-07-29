class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :junior_id, null: false, default: ""
      t.timestamps
    end
  end
end
