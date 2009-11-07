class Location < ActiveRecord::Base
  has_many :items
  
  #Sort by name on default
  default_scope :order => 'name ASC'
  
  # Permissions a la authenticates_access
  has_owner :user
  authenticates_saves :with_accessor_method => :is_admin
end
