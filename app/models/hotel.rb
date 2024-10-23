class Hotel < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :reports
  has_many :favourites, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
                  against: %i[name address],
                  using: {
                    tsearch: { prefix: true }
                  }
end
class Hotel < ApplicationRecord
  has_many :crimes # Assuming a hotel can have many crimes associated with it

  # Define a method to get unique crime categories for the hotel
  def crime_categories
    crimes.select(:category).distinct.pluck(:category)
  end
end
