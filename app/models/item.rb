class Item < ActiveRecord::Base
  belongs_to :location
  belongs_to :category
  belongs_to :user

  has_attached_file :photo, 
                    :styles => { :medium => "200x200>",
                                 :thumb => "75x75>" }

  acts_as_indexed :fields => [:name, :description, :pickup_details, :status]

end
