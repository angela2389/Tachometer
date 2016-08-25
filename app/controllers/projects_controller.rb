class ProjectsController < ApplicationController
  before_filter
  load_and_authorize_resource
  include SprintEmail # method "run_mailer(project)" is now available for project

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def send_weekly_emails
    project_id = params[:project_id]
    project = Project.find(project_id)
    run_mailer(project)
  end

  # GET /projects
  # GET /projects.json
  def index
    if user_signed_in?
    @projects = Project.all
    else
    redirect_to new_user_session_path
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.phases.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to edit_project_phase_path(project_id: @project.id, id: @project.phases.last) }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :active, :user_id, :portfoliomanager_id, phases_attributes: [:id,:sequence])
    end
end
