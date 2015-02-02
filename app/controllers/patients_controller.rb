class PatientsController < ApplicationController
	before_action :set_patient, only: [
	:show,
	:edit,
	:update,
	:destroy,
	:wait_patient,
	:check_up_patient,
	:x_ray_patient,
	:surgery_patient,
	:bills_patient,
	:leave_patient
	]


	def index

		@patients = Patient.all
	end

	def new
		# @clinic = Clinic.find params[:clinic_id]
		@patient = Patient.new
		@doctors = Doctor.all
		@medications = Medication.all
	end

	def create
	# @clinic = Clinic.find params[:clinic_id] 
		@patient = Patient.create patient_params
		@doctors = @patient.doctors
		@medications = @patient.medications
		if @patient.save
			flash[:notice] = 'Patient was added successfully.'
			redirect_to patients_path
		else 
		flash[:error] = 'Patient add unsuccessful.'	
		render :new
		end
	end

	def show
		# @clinic = Clinic.find params[:clinic_id]
		@patient = Patient.find params[:id]
		@doctors = @patient.doctors
		@medications = @patient.medications
	end	

	def edit
		# @clinic = Clinic.find params[:clinic_id] 
		@patient = Patient.find params[:id]
		@doctors = Doctor.all
		@medications = Medication.all
	end	

	def update
		# @clinic = Clinic.find params[:clinic_id]
		@patient = Patient.find params[:id]
		@patient.update_attributes patient_params
		@doctors = @patient.doctors
		@medications = @patient.medications
		redirect_to patients_path
	end 
	
	def destroy
		# @clinic = Clinic.find params[:clinic_id]
		@patient = Patient.find params[:id]
		@patient.delete
		redirect_to patients_path
	end

	def wait_patient
    # @restaurant = Restaurant.find(params[:id])  
    @patient.wait!
    redirect_to patients_path
  end

  def checkup_patient
    # @restaurant = Restaurant.find(params[:id])  
    @patient.check_up!
    redirect_to patients_path
  end

  def xray_patient
    # @restaurant = Restaurant.find(params[:id])  
    @patient.x_ray!
    redirect_to patients_path
  end

  def surgery_patient
    # @restaurant = Restaurant.find(params[:id])  
    @patient.surgery!
    redirect_to patients_path
  end

  def bill_patient
    # @restaurant = Restaurant.find(params[:id])  
    @patient.bill!
    redirect_to patients_path
  end

  def leave_patient
    # @restaurant = Restaurant.find(params[:id])  
    @patient.leave!
    redirect_to patients_path
  end

private

	def set_patient
		@patient = Patient.find(parmas:[:id])
	end
		
	def patient_params
		params.require(:patient).permit(
			:first_name,
			:last_name,
			:date_of_birth,
			:description,
			:gender,
			:blood_type,
			clinic_ids: [],
			patient_ids: [],
			doctor_ids: [],
			medication_ids: []
			)
	end	

end
