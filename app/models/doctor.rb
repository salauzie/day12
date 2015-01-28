class Doctor < ActiveRecord::Base
	belongs_to :patients, polymorphic: true
	belongs_to :clinics, polymorphic: true
	has_many :patients, through: :patient_doctors
	has_many :patient_doctors
	has_many :clinic_doctors
	
end
