class About < ApplicationRecord
  validates :header, :life, :misc, presence: true
end
