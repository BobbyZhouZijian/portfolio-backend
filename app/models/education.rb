class Education < ApplicationRecord
  has_many :education_contents, dependent: :destroy
  validates :institution_name, presence: true
  validates :link, presence: true
end
