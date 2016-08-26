require 'date'
class Phase < ApplicationRecord
  belongs_to :project
  has_one :team
  has_many :sprints
  has_many :experiments
  after_create :give_team
  after_update :set_end_date
  after_update :give_sprints
  #after_update :set_end_date if (:sprintamount.present? && :interval.present? && :start_date.present?)

  after_save :set_stage_project
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


  def name
    Project::STAGES[self.sequence]
  end




  def set_stage_project
    self.project.set_stage
  end
  
  def phase_weeks
     days = (Date.parse("#{self.start_date}")..Date.parse("#{self.end_date}")).to_a
     weeks = days.each_slice(7*self.interval).to_a.map { |w|
             [w.first, w.last].map { |d| "#{d.year}-#{d.month}-#{d.day}" } }
   end

  def set_sprint_dates
  self.sprints.each_with_index do |sprint,i|
    sprint.update(start_date: self.phase_weeks[i][0], end_date: self.phase_weeks[i][1])
    end
  end

  def give_team
    self.create_team
    manager = self.project.user
    self.team.team_members.create(user:manager,role:Team::ROLES[0])
  end


  def set_end_date
    if self.sprint_amount.present? && self.interval.present? && self.start_date.present?
    number = self.interval * self.sprint_amount
    date = self.start_date + number.weeks
    self.update(end_date: date) unless date == self.end_date
    else


    end
  end

  def give_sprints
    if self.sprints.any?
     (self.sprint_amount - self.sprints.count).times { self.sprint.create }
     self.set_sprint_dates
   elsif !self.sprint_amount.present?
     return
   else
    (self.sprint_amount).times { self.sprints.create }
    self.set_end_date
    self.set_sprint_dates
  end
 end



end
