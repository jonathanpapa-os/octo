# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_tenant
  before_action :set_appointment, only: %i[show edit update destroy]

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.where(tenant_id: @tenant.id)
  end

  # GET /appointments/1 or /appointments/1.json
  def show; end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit; end

  # POST /appointments or /appointments.json
  def create
    birthday = Date.civil(params[:appointment]["birthday(1i)"].to_i,params[:appointment]["birthday(2i)"].to_i,params[:appointment]["birthday(3i)"].to_i)
    @appointment = Appointment.new(appointment_params)
    @appointment.birthday = birthday

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find_by!(id: params[:id], tenant_id: @tenant.id)
  end

  # Only allow a list of trusted parameters through.
  def appointment_params
    params.require(:appointment).permit(:name, :gender, :phone, :email, :tenant_id, :company_name, :address)
  end

  # ...

  def set_tenant
    @tenant = Tenant.find_by!(url: request.domain)
  end
end
