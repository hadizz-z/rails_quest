class Skill < ApplicationRecord
  # ассоциации
  has_many :agent_skills, dependent: :destroy
  has_many :agents, through: :agent_skills # Связь N к N

  # валидации
  validates :name, presence: true, uniqueness: true
end