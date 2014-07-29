class CreateSeniors < ActiveRecord::Migration
  def change
    create_table :seniors do |t|
      t.string :member_id, null: false, default: ""
      t.timestamps
    end
  end
end
