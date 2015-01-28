class CreateClinicPatients < ActiveRecord::Migration
  def change
    create_table :clinic_patients do |t|
    	t.integer :clinic_id
      t.integer :patient_id
    end
  end
end
