class Location < ActiveRecord::Base
  has_many :items
end
