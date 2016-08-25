class TeamMembersController < ApplicationController
    before_action :set_team_member, only: [:show, :edit, :update,:destroy]

    # GET /phases
    # GET /phases.json
    def index

    end

    # GET /phases/1
    # GET /phases/1.json
    def show
    end

    # GET /phases/new
    def new

    end

    # GET /phases/1/edit
    def edit
    end

    # POST /phases
    # POST /phases.json
    def create
      @team_member = TeamMember.new(team_member_params)

      respond_to do |format|
        if @team_member.save
          format.html { redirect_to project_team_path(@team_member.project,@team_member.team), notice: 'Phase was successfully created.' }
          format.json { render :show, status: :created, location: @team_member }
        else
          format.html { render :new }
          format.json { render json: @team_member.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /phases/1
    # PATCH/PUT /phases/1.json
    def update
      respond_to do |format|
        if @phase.update(phase_params)
          format.html { redirect_to project_phase_path(@project.id, @phase), notice: 'Phase was successfully updated.' }
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
      @team_member.destroy
      respond_to do |format|
        format.html { redirect_to project_team_path(@team_member.project,@team_member.team), notice: 'Phase was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions


      def set_team_member
        project = Project.find(params[:project_id])
        @team_member = project.team_members.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def team_member_params
        params.require(:team_member).permit(:team_id, :user_id, :role)
      end
  end
