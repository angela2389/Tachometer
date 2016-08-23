class Project < ApplicationRecord

  has_many :phases

  STAGES = ['Explore', 'Experiment', 'Grow', 'Scale']

  def get_users_at_end_sprint_current_phase(project_id)
    project = project.find(project_id)
    current_phase = Phase.find(project.current_phase)
    users = current_phase.team.users
    sprints = []
    current_phase.sprints.each do |sprint|
      today = Date.today
      if (sprint.end_date >= today) && (sprint.end_date <= (today + 7))
        sprints << sprint
      end
    end

    return {users: users, sprints:sprints}
  end
  
end
