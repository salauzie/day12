class AddClinicIdToPatientTable < ActiveRecord::Migration
  def change
  	add_column :patients, :clinic_id, :string
  end
end
