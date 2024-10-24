class Crime < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  after_save :category_split

  validates :category, uniqueness: { scope: :longitude }

  def category_split
    update_column(:category, category.split("-").join(" "))
  end
end
