class Project < ApplicationRecord
  has_many :phases, inverse_of: :project
  accepts_nested_attributes_for :phases, allow_destroy: true, :reject_if => :all_blank

  STAGES = ['Explore', 'Experiment', 'Grow', 'Scale']

  def current_phase
    Phase.find(self.current_stage_id)
  end

  def current_stage
    self.phases.where(:completed => false).first
  end

  def set_stage
    self.current_stage_id = current_stage.id
  end

  def get_mailer_for_current_phase
    byebug
    current_phase = Phase.find(self.current_stage_id)
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

  def define_next_sequence
    existing_sequences = self.phases.map{|x| x[:sequence]}
    if existing_sequences.length > 0
      existing_sequences = existing_sequences.sort
      new_sequence = existing_sequences[-1]
      new_sequence += 1
    else
      # else as fallback, normally phase is always present after project creation
      new_sequence = 0
    end
    new_sequence
  end

end
