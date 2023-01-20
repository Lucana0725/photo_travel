class Map < ApplicationRecord
  belongs_to :travel
  geocoded_by :address
  after_validation :geocode
end
