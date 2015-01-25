class CreateAddPatientIdToMedicationTables < ActiveRecord::Migration
  def change
    create_table :add_patient_id_to_medication_tables do |t|

      t.timestamps null: false
    end
  end
end
