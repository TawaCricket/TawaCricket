class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.integer :member_id, null: false, default: 0
      t.string :position
      t.timestamps
    end
  end
end
