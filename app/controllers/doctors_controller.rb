class DoctorsController < ApplicationController
   skip_before_action :verify_authenticity_token
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
   before_action :authenticate_patient!, only: [:show]

  # GET /doctors
  # GET /doctors.json
  def index
     @q = Doctor.ransack(params[:q])
  @doctors = @q.result(distinct: true)

  if params[:search].present?
    @doctors = Doctor.near(params[:search], 50, :order => :distance)
  else
    @doctors = Doctor.all
  end
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
  end

  # GET /doctors/1/edit
  def edit
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end


def create_appoinment
    @appoinment = Appoinment.new(appoinment_params)

    respond_to do |format|
      if @appoinment.save
        format.html { redirect_to root_path, notice: 'appoinment was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :email, :mobile_number, 
        :specalist_in, :gender, :city, 
        :state, :address,:latitude,:longitude,:patient_id)
    end

    def appoinment_params
      params.require(:appoinment).permit(:first_name, :last_name, :phone_number, 
         :address, :city, :state,:country,:week,:date_time,:doctor_id,
         :patient_id)
    end
end
