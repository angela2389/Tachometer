class Phase < ApplicationRecord
  belongs_to :project
  has_one :team
  has_many :sprints
  has_many :experiments
  after_create :give_team
  after_save do
    # byebug
    # number_of_phases = self.project.phases.length
    # completed_phases = self.project.phases.where(completed: true)
    # if completed_phases.empty? && (number_of_phases == 1) && (self.project.phases[0][:sequence] == Project::STAGES.length-1)
    #   self.project.current_stage_id = self.id
    #   self.project.save
    # elsif completed_phases.length == number_of_phases
    #   self.project.current_stage_id = self.project.phases.where(completed: true).order(:sequence).last[:id]
    #   self.project.save
    # else
    #   highest_completed_sequence = self.project.phases.where(completed: true).order(:sequence).last[:sequence]
    #   self.project.current_stage_id = self.project.phases.find_by(sequence: highest_completed_sequence + 1)
    #   self.project.save
    # end
  end

  def name
    Project::STAGES[self.sequence]
  end
  def give_team
    self.create_team
    manager = self.project.user
    self.team.team_members.create(user:manager,role:Team::ROLES[0])
  end

  def get_mailer_for_current_phase
    team_members = self.team.team_members
    users = team_members.map do |member|
      member.user
    end
    sprints = []
    self.sprints.each do |sprint|
      today = Date.today
      if (sprint.end_date >= today) && (sprint.end_date <= (today + 7))
        sprints << sprint
      end
    end
    {users: users, sprints:sprints}
  end

end
