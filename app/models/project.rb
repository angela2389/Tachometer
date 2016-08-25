class Project < ApplicationRecord
  has_many :phases, inverse_of: :project
  belongs_to :user
  accepts_nested_attributes_for :phases, allow_destroy: true, :reject_if => :all_blank

  STAGES = ['Explore', 'Experiment', 'Grow', 'Scale']

  def self.get_list_of_phases
    list_of_phases = []
    STAGES.each_with_index do |stage, index|
      list_of_phases << [stage, index]
    end
    list_of_phases
  end

  def current_phase
    Phase.find(self.current_stage_id)
  end

  def get_list_of_project_phases
    ret_array = []
    self.phases.each do |p|
      ret_array << [p.name, p.id]
    end
    ret_array
  end

  def set_stage
    if !earliest_uncompleted.nil?
      self.update(current_stage_id:earliest_uncompleted.id)
      else
      self.update(current_stage_id:last_completed.id)
    end
  end

  def get_mailer_for_current_phase
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
    # existing_sequences = self.phases.map{|x| x[:sequence]}
    # if existing_sequences.length > 0
    #   existing_sequences = existing_sequences.sort
    #   new_sequence = existing_sequences[-1]
    #   new_sequence += 1
    # else
    #   # else as fallback, normally phase is always present after project creation
    #   new_sequence = 0
    # end
    # new_sequence

    existing_sequences = self.phases.map{|x| x[:sequence]}
    highest_sequence = existing_sequences.max
    if existing_sequences.empty?
      0
    elsif highest_sequence >= STAGES.length - 1
      nil
    else
      highest_sequence + 1
    end

  end

private

  def earliest_uncompleted
    self.phases.where(:completed => false).sort{ |a,b| a.sequence <=> b.sequence }.first
  end

  def last_completed
    self.phases.where(:completed => true).sort{ |a,b| a.sequence <=> b.sequence }.last
  end

end
