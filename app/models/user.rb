class User < ActiveRecord::Base
  has_many :items
  
  def email
    return self.rcsid + '@rpi.edu'
  end

  # Anyone who is logged in is registered.
  def is_registered
    true
  end

  # Permissions a la authenticates_access
  has_owner :self
  authenticates_writes_to :is_admin, :with_accessor_method => :is_admin
  authenticates_writes_to :rcsid, :with_accessor_method => :is_admin
  authenticates_saves :with_accessor_method => :is_admin
  authenticates_saves :with => :allow_owner
end
