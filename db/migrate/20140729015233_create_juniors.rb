class CreateJuniors < ActiveRecord::Migration
  def change
    create_table :juniors do |t|
      t.integer :member_id, null: false, default: 0
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :address
      t.string :email
      t.integer :age
      
      t.timestamps
    end
  end
end
