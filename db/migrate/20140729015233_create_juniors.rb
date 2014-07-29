class CreateJuniors < ActiveRecord::Migration
  def change
    create_table :juniors do |t|
      t.string :member_id, null: false, default: ""
      t.timestamps
    end
  end
end
