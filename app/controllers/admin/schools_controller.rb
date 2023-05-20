class Admin::SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /classrooms/new
  def new
    @school = School.new
    @school.build_school_admin
    @school.build_address
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @school = School.new(permitted_school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to admin_school_path(@school), notice: 'school was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to admin_school_path(@school), notice: 'school was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to admin_schools_path, notice: 'school was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_school_params
      params.require(:school).permit(:id,
        :name,
        :status,
        school_admin_attributes: [
          :email, :name, :gender, :phone
        ],
        address_attributes: [
          :id, :line_1, :line_2,
          :city, :state, :country, :pin_code,
          :_destroy
        ]
      )
    end
end

