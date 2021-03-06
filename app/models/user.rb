class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :teams, through: :team_members
         has_many :team_members
         has_many :projects

ROLES = %w[portfoliomanager productowner admin teammember].freeze
end
