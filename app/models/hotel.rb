class Hotel < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :reports

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
                  against: %i[name address],
                  using: {
                    tsearch: { prefix: true }
                  }
end
