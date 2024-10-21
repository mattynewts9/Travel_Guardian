class Report < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

  validates :content, presence: true
  validates :safety_rating, presence: true, inclusion: { in: 1..5 }

  validate :content_must_be_crime_related

  private

  def content_must_be_crime_related
    crime_keywords = ['crime', 'theft', 'assault', 'robbery', 'violence', 'vandalism', 'fraud', 'arson']
    unless crime_keywords.any? { |word| content&.downcase&.include?(word) }
      errors.add(:content, 'must include information related to crime issues.')
    end
  end
end
