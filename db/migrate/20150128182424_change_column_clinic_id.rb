class ChangeColumnClinicId < ActiveRecord::Migration
  def change
  	change_column :patients, :clinic_id, :integer
  end
end
