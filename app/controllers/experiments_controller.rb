class ExperimentsController < ApplicationController
  before_action :set_project, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_phase, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_experiment, only: [:show, :edit, :update, :destroy]

  # GET /experiments
  # GET /experiments.json
  def index
    @experiments = Experiment.where(phase_id: params[:phase_id])
  end

  # GET /experiments/1
  # GET /experiments/1.json
  def show
  end

  # GET /experiments/new
  def new
    @experiment = Experiment.new
  end

  # GET /experiments/1/edit
  def edit
  end

  # POST /experiments
  # POST /experiments.json
  def create
    @experiment = Experiment.new(experiment_params)

    respond_to do |format|
      if @experiment.save
        format.html { redirect_to project_phase_path(@project.id, @phase.id), notice: 'Experiment was successfully created.' }
        format.json { render :show, status: :created, location: @experiment }
      else
        format.html { render :new }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiments/1
  # PATCH/PUT /experiments/1.json
  def update
    respond_to do |format|
      if @experiment.update(experiment_params)
        format.html { redirect_to project_phase_path(@project.id, @phase.id), notice: 'Experiment was successfully updated.' }
        format.json { render :show, status: :ok, location: @experiment }
      else
        format.html { render :edit }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiments/1
  # DELETE /experiments/1.json
  def destroy
    @experiment.destroy
    respond_to do |format|
      format.html { redirect_to project_phase_experiments_path(@project.id, @phase.id), notice: 'Experiment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_phase
      @phase = Phase.find(params[:phase_id])
    end
    def set_experiment
      @experiment = Experiment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experiment_params
      params.require(:experiment).permit(:name, :start_date, :end_date, :completed, :project_id, :phase_id, :domain, :assumption, :method, :observation, :measure, :learned, :success_criteria, :action, :metric_1, :target_succes_metric_1, :metric_2, :target_succes_metric_2, :metric_3, :target_succes_metric_3, :metric_4, :target_succes_metric_4, :metric_5, :target_succes_metric_5, :interviews_planned, :interviews_done, :early_adopters_planned, :early_adopters_converted)
    end
end
