class Patient < ActiveRecord::Base
validates :first_name, presence: true
validates :last_name, presence: true
validates :description, presence: true

has_many :clinic_patients
has_many :clinics, through: :clinic_patients
# belongs_to :clinic
# has_many :medications, dependent: :destroy
has_many :doctors, through: :patient_doctors
has_many :patient_doctors
has_many :medications, through: :patient_medications
has_many :patient_medications

include Workflow
workflow do
	state :waiting do
		event :wait, :transitions_to => :waiting
		event :check_up, :transitions_to => :checking_up
		event :x_ray, :transitions_to => :x_raying
		event :surgery, :transitions_to => :surged
		event :leave, :transitions_to => :leaving
	end

	state :checking_up do
		event :check_up, :transitions_to => :checking_up
		event :x_ray, :transitions_to => :x_raying
		event :surgery, :transitions_to => :surged
		event :bills, :transitions_to => :billing
		event :leave, :transitions_to => :leaving
	end

	state :x_raying do
		event :x_ray, :transitions_to => :x_raying
		event :surgery, :transitions_to => :surged
		event :bills, :transitions_to => :billing
		event :leave, :transitions_to => :leaving
	end	

	state :surged do
		event :surgery, :transitions_to => :surged
		event :bills, :transitions_to => :billing
	end

	state :billing do
		event :bills, :transitions_to => :billing
		event :leave, :transitions_to => :leaving
	end	

	state :leaving do
		event :leave, :transitions_to => :leaving
	end	
end

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
