class Subscribe < ApplicationMailer

  def subscription(email)
    mail(
      :to => email, 
      :subject => "LionGiftCard - subscribed"
    )
  end

  def notify(email, date)
  	@email = email
  	@date = date
    mail(
      :to => "camilo@instabuyback.com",
      :bcc => "pebiantara@gmail.com",
      :subject => "LionGiftCard - New subscribed email"
    	)
  end

  def notify_create_account(email)
    @email = email
    mail(
      :to => "camilo@instabuyback.com",
      :bcc => "pebiantara@gmail.com",
      :subject => "LionGiftCard - New subscribed email"
      )
  end
end
