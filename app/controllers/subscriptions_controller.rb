class SubscriptionsController < ApplicationController

  def create
    @subscription = MailSubscription.new(subscription_params)
    if @subscription.save
      #Subscribe.subscription(@subscription.email).deliver_now
      Subscribe.notify(@subscription.email, @subscription.created_at).deliver_now
    end
  end

  private
  def subscription_params
  	params[:subscription][:ip_address] = request.remote_ip
  	params.require(:subscription).permit(:email, :ip_address)
  end
end