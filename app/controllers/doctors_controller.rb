class DoctorsController < ApplicationController
def index
	@doctors = Doctor.all
	@doctors = if !params[:q].blank?
    Doctor.where("name LIKE ?", "%#{params[:q]}%")
  else
    
    puts "Showing all Doctors"
    Doctor.all
  end.shuffle
end	

def new
	@doctor = Doctor.new
end

def create
	@doctor = Doctor.create doctor_params
	redirect_to doctors_path
end	

def show
	@doctor = Doctor.find doctor_params[:id]
end

def edit
	@doctor = Doctor.find params[:id]
end

def update
	@doctor = Doctor.find params[:id]
	@doctor.update_attributes doctor_params
	redirect_to doctors_path
end


def destroy
	@doctor = Doctor.find params[:id]
	@doctor.delete
	redirect_to doctors_path
end

private
	def doctor_params
		params.require(:doctor).permit(
			:name,
			:office_phone_number,
			:specialty,
			doctor_ids: [],
			clinic_ids: []
			)
	end
end
