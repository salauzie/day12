class Medication < ActiveRecord::Base
validates :name, presence: true
	# belongs_to :patient

	has_many :patient_medications
  has_many :patients, through: :patient_medications
end
