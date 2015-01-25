class Clinic < ActiveRecord::Base


has_many :patients, dependent: :destroy	
has_many :medications

end
