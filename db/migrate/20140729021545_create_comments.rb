class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :member_id, null: false, default: ""
      t.timestamps
    end
  end
end
