class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :set_study

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
    add_breadcrumb @study, @study
    add_breadcrumb 'Personnes'
    add_breadcrumb @person
  end

  # GET /people/new
  def new
    @person = Person.new
    @person.study = @study
    add_breadcrumb @study, @study
    add_breadcrumb 'Personnes'
    add_breadcrumb 'Nouvelle personne'
  end

  # GET /people/1/edit
  def edit
    @study.variables.each do |variable|
      Evaluation.where(person: @person, variable: variable).first_or_create
    end
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person.study, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_study
      @study = Study.find(params[:study_id]) if params.has_key? :study_id
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
      @study = @person.study
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:study_id, :code, evaluations_attributes: [:id, :value])
    end
end
