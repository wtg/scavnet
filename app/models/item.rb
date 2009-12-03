class Item < ActiveRecord::Base
  belongs_to :location
  belongs_to :category
  belongs_to :user

  has_attached_file :photo, 
                    :styles => { :medium => "200x200>",
                                 :thumb => "75x75>" }

  acts_as_indexed :fields => [:name, :description, :pickup_details, :status]

  # Permissions a la authenticates_access
  has_owner :user
  autosets_owner_on_create
  authenticates_creation :with_accessor_method => :is_registered
  

  authenticates_saves :with => :allow_owner
  authenticates_saves :with_accessor_method => :is_admin

  authenticates_writes_to :user_id, :with_accessor_method => :is_admin
  authenticates_writes_to :is_admin, :with_accessor_method => :is_admin
end

