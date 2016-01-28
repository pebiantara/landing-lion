class Subscribe < ApplicationMailer

  def subscription(email)
    mail(
      :to => email, 
      :subject => "LionGiftCard - subscribed"
    )
  end
end
