class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.integer :junior_id
      t.integer :member_id
      t.integer :team_id, default: -2
      t.string :name
      t.integer :grade
      t.string :contact
      t.string :description
      t.string :email
      t.integer :season_id, default: -1
      t.timestamps
    end
  end
end
