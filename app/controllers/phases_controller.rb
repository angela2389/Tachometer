class PhasesController < ApplicationController
  before_action :set_phase, only: [:show, :edit, :update, :destroy]

  # GET /phases
  # GET /phases.json
  def index
    project = Project.find(params[:project_id])
    @phases = project.phases
  end

  # GET /phases/1
  # GET /phases/1.json
  def show
  end

  # GET /phases/new
  def new
    project = Project.find(params[:id])
    next_sequence = project.define_next_sequence
    @phase = project.phases.new
    @phase.sequence = next_sequence
  end

  # GET /phases/1/edit
  def edit
  end

  # POST /phases
  # POST /phases.json
  def create
    project = Project.find(params[:project_id])
    @phase = project.phases.new(phase_params)

    respond_to do |format|
      if @phase.save
        format.html { redirect_to [@phase.project, @phase], notice: 'Phase was successfully created.' }
        format.json { render :show, status: :created, location: @phase }
      else
        format.html { render :new }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phases/1
  # PATCH/PUT /phases/1.json
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to [@phase.project, @phase], notice: 'Phase was successfully updated.' }
        format.json { render :show, status: :ok, location: @phase }
      else
        format.html { render :edit }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1
  # DELETE /phases/1.json
  def destroy
    @phase.destroy
    respond_to do |format|
      format.html { redirect_to phases_url, notice: 'Phase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phase
      project = Project.find(params[:project_id])
      @phase = project.phases.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phase_params
      params.require(:phase).permit(:start_date, :end_date, :interval, :sequence, :long_term_vision, :kpi_s, :criteria, :bottlenecks, :problem_definition, :solutions, :long_term, :key_benefits, :vision, :test_first, :proof_of_value, :background, :note)
    end
end
