class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.string :dosage
      t.string :directions
      t.string :prescriber

      t.timestamps null: false
    end
  end
end
