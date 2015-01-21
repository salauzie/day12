class PatientsController < ApplicationController

	def new
		@patient = Patient.new
	end

	def create 
		@patient = Patient.create patient_params
		if @patient.save
			flash[:notice] = 'Patient was added successfully.'
			redirect_to patients_path
		else 
		flash[:error] = 'Patient add unsuccessful.'	
		render :new
		end
	end

	def show
		@patient = Patient.find params[:id]
	end	

	def edit 
		@patient = Patient.find params[:id]
	end	

	def update
		@patient = Patient.find params[:id]
		@patient.update_attributes patient_params
		redirect_to root_path
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
