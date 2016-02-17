class NotificationMailer < ActionMailer::Base
  default from: "no-reply@newark-foods.com"

  def comment_added(comment)
    @place = comment.place
    mail({
      :to => @place.user.email,
      :subject => "A comment has been added to #{@place.name}"
      })
  end
end
