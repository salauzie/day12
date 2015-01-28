class Patient < ActiveRecord::Base
validates :first_name, presence: true
validates :last_name, presence: true
validates :description, presence: true

belongs_to :clinic
# has_many :medications, dependent: :destroy
has_many :doctors, through: :patient_doctors
has_many :patient_doctors
has_many :medications, through: :patient_medications
has_many :patient_medications

	BLOOD_TYPE_OPTIONS = [
		"A+",
		"A-",
		"B+",
		"B-",
		"O+",
		"O-",
		"AB+",
		"AB-"
	]
end
