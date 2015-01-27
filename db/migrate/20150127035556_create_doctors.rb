class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
    	t.string :name
    	t.string :office_phone_number
    	t.string :specialty

      t.timestamps null: false
    end
  end
end
