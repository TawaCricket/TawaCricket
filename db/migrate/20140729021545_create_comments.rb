class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :member_id, null: false, default: 0
      t.timestamps
    end
  end
end
