class StudentEnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show edit update destroy approve_and_reject]

  # GET /enrollments or /enrollments.json
  def index
    @enrollments = current_user.enrollments
  end

  # GET /enrollments/1 or /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # POST /enrollments or /enrollments.json
  def create
    @enrollment = current_user.enrollments.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to student_enrollment_path(@enrollment), notice: "Enrollment Request successfully send to school admin." }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1 or /enrollments/1.json
  def destroy
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to student_enrollments_path, notice: "Withdraw the enrollment successfully" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.require(:enrollment).permit(:batch_id)
    end
end
