class CreateJuniors < ActiveRecord::Migration
  def change
    create_table :juniors do |t|
      t.integer :member_id, null: false, default: 0
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :address
      t.string :email
      t.string :gender
      t.date :dob
      t.string :school
      t.integer :grade_last_season
      t.integer :current_school_year
      t.boolean :girls_only, default: false
      t.integer :team_id, default: -1
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
