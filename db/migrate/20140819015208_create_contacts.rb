class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :question
      t.boolean :resolved, default: false

      t.timestamps
    end
  end
end
