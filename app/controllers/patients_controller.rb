class PatientsController < ApplicationController
	def index
		@clinic = Clinic.find params[:clinic_id]
		@patients = @clinic.patients
	end

	def new
		@clinic = Clinic.find params[:clinic_id]
		@patient = @clinic.patients.new
	end

	def create
	@clinic = Clinic.find params[:clinic_id] 
		@patient = Patient.create patient_params
		if @patient.save
			flash[:notice] = 'Patient was added successfully.'
			redirect_to clinic_patients_path
		else 
		flash[:error] = 'Patient add unsuccessful.'	
		render :new
		end
	end

	def show
		@clinic = Clinic.find params[:clinic_id]
		@patient = Patient.find params[:id]
	end	

	def edit
		@clinic = Clinic.find params[:clinic_id] 
		@patient = Patient.find params[:id]
	end	

	def update
		@clinic = Clinic.find params[:clinic_id]
		@patient = Patient.find params[:id]
		@patient.update_attributes patient_params
		redirect_to clinic_patients_path
	end 
	
	def destroy
		@clinic = Clinic.find params[:clinic_id]
		@patient = Patient.find params[:id]
		@patient.delete
		redirect_to clinic_patients_path
	end

private
	def patient_params
		params.require(:patient).permit(
			:first_name,
			:last_name,
			:date_of_birth,
			:description,
			:gender,
			:blood_type
			)
	end	

end
