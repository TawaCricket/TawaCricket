class CreateSeniors < ActiveRecord::Migration
  def change
    create_table :seniors do |t|
      t.integer :member_id, null: false, default: 0
      t.string :position
      t.integer :team_id, default: -1
      t.integer :grade
      t.timestamps
    end
  end
end
