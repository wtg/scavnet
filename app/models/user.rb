class User < ActiveRecord::Base
  has_many :items
  
  def email
    return self.rcsid + '@rpi.edu'
  end
end
