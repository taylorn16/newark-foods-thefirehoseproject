class Comment < ActiveRecord::Base

  # DB relationships
  belongs_to :user
  belongs_to :place

end
