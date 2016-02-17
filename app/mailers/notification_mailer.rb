class NotificationMailer < ActionMailer::Base
  default from: "no-reply@newark-foods.com"

  def comment_added
    mail({
      :to => "taylorn@udel.edu",
      :subject => "A comment has been added to your place!"
      })
  end
end
