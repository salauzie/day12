class ClinicsController < ApplicationController

	def index
		@clinics = Clinic.all
	end

	def new
		@clinic = Clinic.new
	end

	def create
		@clinic = Clinic.create clinic_params
		redirect_to clinics_path
	end

	def show
		@clinic = Clinic.find params[:id]
	end

	def edit
		@clinic = Clinic.find params[:id]
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
			:state
			)
	end
end