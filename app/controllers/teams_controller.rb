class TeamsController < ApplicationController

    # GET /phases
    # GET /phases.json

    # GET /phases/1
    # GET /phases/1.json
    def show
      @team = Team.find(params[:id])
      @team_member = @team.team_members.new
    end

end
