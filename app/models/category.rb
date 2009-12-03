class Category < ActiveRecord::Base
  has_many :items
  
  #Sort by name on default
  default_scope :order => 'name ASC'

  # Permissions a la authenticates_access
  authenticates_creation :with_accessor_method => :is_admin
  authenticates_saves :with_accessor_method => :is_admin

  # Note the autosets_owner_on_create bypasses this, allowing the username
  # to be set when a user adds a new item.
  authenticates_writes_to :owner_id, :with_accessor_method => :is_admin
end
