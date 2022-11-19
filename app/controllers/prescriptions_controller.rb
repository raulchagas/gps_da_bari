class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user = current_user
    if @prescription.save
      redirect_to prescriptions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    set_prescription
  end

  def edit
    set_prescription
  end

  def update
    set_prescription
    if @prescription.update(prescription_params)
      redirect_to prescription_path(@prescription)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_prescription
    @prescription.destroy
    redirect_to prescriptions_path, status: :see_other
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  def prescription_params
    params.require(:prescription).permit(:title, :photo)
  end
end
