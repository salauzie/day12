class Patient < ActiveRecord::Base
validates :first_name, presence: true
validates :last_name, presence: true
validates :description, presence: true


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
