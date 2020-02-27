class VariablesController < ApplicationController
  before_action :set_variable, only: [:show, :edit, :update, :destroy]
  before_action :set_study

  # GET /variables
  # GET /variables.json
  def index
    @variables = Variable.all
  end

  # GET /variables/1
  # GET /variables/1.json
  def show
    add_breadcrumb @study, @study
    add_breadcrumb 'Variables'
    add_breadcrumb @variable
  end

  # GET /variables/new
  def new
    @variable = Variable.new
    @variable.study_id = params[:study_id]
    add_breadcrumb @study, @study
    add_breadcrumb 'Variables'
    add_breadcrumb 'Nouvelle variable'
  end

  # GET /variables/1/edit
  def edit
  end

  # POST /variables
  # POST /variables.json
  def create
    @variable = Variable.new(variable_params)

    respond_to do |format|
      if @variable.save
        format.html { redirect_to @variable.study, notice: 'Variable was successfully created.' }
        format.json { render :show, status: :created, location: @variable }
      else
        format.html { render :new }
        format.json { render json: @variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variables/1
  # PATCH/PUT /variables/1.json
  def update
    respond_to do |format|
      if @variable.update(variable_params)
        format.html { redirect_to @variable.study, notice: 'Variable was successfully updated.' }
        format.json { render :show, status: :ok, location: @variable }
      else
        format.html { render :edit }
        format.json { render json: @variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variables/1
  # DELETE /variables/1.json
  def destroy
    @variable.destroy
    respond_to do |format|
      format.html { redirect_to variables_url, notice: 'Variable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_study
      @study = Study.find(params[:study_id]) if params.has_key? :study_id
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_variable
      @variable = Variable.find(params[:id])
      @study = @variable.study
    end

    # Only allow a list of trusted parameters through.
    def variable_params
      params.require(:variable).permit(:name, :study_id)
    end
end
