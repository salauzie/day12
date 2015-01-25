class MedicationsController < ApplicationController

def index
	@clinic = Clinic.find params[:clinic_id]
	@patient = @clinic.patients.find params[:patient_id]
	@medications = @patient.medications
end

# def new
# 	@clinic = Clinic.find params[:clinic_id]
# 	@patient = @clinic.patients.find params[:patient_id]
# 	@medication = @patient.medications.new
# end

# def create
# 	@clinic = Clinic.find params[:clinic_id]
# 	@patient = @clinic.patients.find params[:patient_id]
# 	@medication = @patient.medications.create medication_params.merge({clinic_id: @clinic.id})	
# end

private
	def medication_params
		params.require(:medication).permit(
			:name,
			:dosage,
			:directions,
			:prescriber
			)
	end
end
