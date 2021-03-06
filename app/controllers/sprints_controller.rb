class SprintsController < ApplicationController
  before_action :set_project, only: [:index, :show, :new, :edit, :create, :start_sprint, :end_sprint, :update, :destroy]
  before_action :set_phase, only: [:index, :show, :new, :edit, :create, :start_sprint, :end_sprint, :update, :destroy]
  before_action :set_sprint, only: [:show, :edit, :start_sprint, :end_sprint  , :update, :destroy]

  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.where(phase_id: params[:phase_id])
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
  end

  # GET /sprints/new
  def new
    @sprint = Sprint.new
  end

  # GET /sprints/1/edit
  def edit
  end

  # POST /sprints
  # POST /sprints.json
  def create
    @sprint = Sprint.new(sprint_params)

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to project_phase_path(@project.id, @phase.id), notice: 'Sprint was successfully created.' }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to project_phase_path(@project.id, @phase.id), notice: 'Sprint was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint.destroy
    respond_to do |format|
      format.html { redirect_to project_phase_sprint_path(@project.id, @phase.id), notice: 'Sprint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start_sprint
  end

  def end_sprint
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_phase
      @phase = Phase.find(params[:phase_id])
    end
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_params
      params.require(:sprint).permit(:name, :start_date, :end_date, :completed, :project_id, :phase_id, :est_points, :things_done, :things_learned, :act_points, :impediment, :retro_actions, :avg_happy, :on_target, :organization_helping, :able_to_pull_of, :impediment, experiment_ids:[], experiments_attributes: [:id, :act_succes_metric_1, :act_succes_metric_2, :act_succes_metric_3, :act_succes_metric_4, :act_succes_metric_5])
    end
end
