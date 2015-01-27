class AddClinicIdToMedicationTable < ActiveRecord::Migration
  def change
  	add_column :medications, :clinic_id, :string
  end
end
