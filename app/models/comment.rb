class Comment < ActiveRecord::Base

  # DB relationships
  belongs_to :user
  belongs_to :place

  RATINGS = {
    "One Star" => "1_star",
    "Two Stars" => "2_stars",
    "Three Stars" => "3_stars",
    "Four Stars" => "4_stars",
    "Five Stars" => "5_stars"
  }

  def human_rating
    RATINGS.invert[self.rating]
  end

end
