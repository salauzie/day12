class AddPatientIdToMedicationTable < ActiveRecord::Migration
  def change
  	add_column :medications, :patient_id, :string
  end
end
