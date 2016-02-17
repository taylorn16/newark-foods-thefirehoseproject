class Comment < ActiveRecord::Base

  # DB relationships
  belongs_to :user
  belongs_to :place

  # Callbacks
  after_create :send_comment_email

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

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end

end
