class Project < ApplicationRecord

  has_many :phases

  STAGES = ['Explore', 'Experiment', 'Grow', 'Scale']

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
