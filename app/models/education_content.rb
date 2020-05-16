class EducationContent < ApplicationRecord
  belongs_to :education
  validates :content, presence: true
  validates :education_id, presence: true
end
