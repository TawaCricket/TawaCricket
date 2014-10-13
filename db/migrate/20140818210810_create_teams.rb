class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :coach
      t.integer :age_group
      t.boolean :female_only
      t.integer :season_id, default: -1

      t.timestamps
    end
  end
end
