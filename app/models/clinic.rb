class Clinic < ActiveRecord::Base


has_many :patients, through: :clinic_patients	
has_many :clinic_patients
has_many :medications
has_many :doctors, through: :clinic_doctors
has_many :clinic_doctors

end
