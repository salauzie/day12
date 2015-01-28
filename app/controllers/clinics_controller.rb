class ClinicsController < ApplicationController

	def index
		@clinics = Clinic.all
	end

	def new
		@clinic = Clinic.new
		@doctors = Doctor.all
		@patients = @clinic.patients
	end

	def create
		@clinic = Clinic.create clinic_params
		redirect_to clinics_path
	end

	def show
		@clinic = Clinic.find params[:id]
		@doctors = @clinic.doctors
		@patients = @clinic.patients
	end

	def edit
		@clinic = Clinic.find params[:id]
		@doctors = Doctor.all
		@patients = @clinic.patients
	end
		
	def update
		@clinic = Clinic.find params[:id]
		@clinic.update_attributes clinic_params
		redirect_to clinics_path
	end	

	def destroy
		@clinic = Clinic.find params[:id]
		@clinic.delete
		redirect_to clinics_path
	end

private
	def clinic_params
		params.require(:clinic).permit(
			:name,
			:facility_type,
			:address,
			:city,
			:state,
			patient_ids: [],
			clinic_ids: [],
			doctor_ids: []
			)
	end
end
