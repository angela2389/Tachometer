class Project < ApplicationRecord
  has_many :phases, inverse_of: :project
  accepts_nested_attributes_for :phases, allow_destroy: true, :reject_if => :all_blank

  STAGES = ['Explore', 'Experiment', 'Grow', 'Scale']

  def current_phase
    Phase.find(self.current_stage_id)
  end

  def current_stage
    last_stage = self.phases.last
    if last_stage[:start_date] >= Time.now
      last_stage
    else
      self.phases[-2]
    end
  end

  def set_stage
    self.current_stage_id = current_stage.id
  end

  def get_mailer_for_current_phase
    project = Project.find(self.id)
    current_phase = Phase.find(project.current_stage_id)
    users = current_phase.team.users
    sprints = []
    current_phase.sprints.each do |sprint|
      today = Date.today
      if (sprint.end_date >= today) && (sprint.end_date <= (today + 7))
        sprints << sprint
      end
    end
    {users: users, sprints:sprints}
  end

end
