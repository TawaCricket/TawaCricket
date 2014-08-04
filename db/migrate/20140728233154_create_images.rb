class CreateImages < ActiveRecord::Migration
	create_table(:gallary) do |t|
		t.string :name
		t.timestamps
	end
end
