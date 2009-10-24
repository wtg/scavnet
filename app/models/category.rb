class Category < ActiveRecord::Base
  has_many :items
  
  #Sort by name on default
  default_scope :order => 'name ASC'
end
