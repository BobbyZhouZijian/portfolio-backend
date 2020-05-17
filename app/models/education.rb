class Education < ApplicationRecord
  has_many :education_contents, dependent: :destroy
  validates :institution_name, presence: true
  validates :link, presence: true

  scope :name_is, (lambda do |params|
    if params[:institution_name].present?
      where('lower(institution_name) LIKE ?', "%#{params[:institution_name].downcase}%")
    end
  end)
end
