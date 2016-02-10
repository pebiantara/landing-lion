class SessionsController < ApplicationController

  def create
  	begin
	    @results = RestClient.post("#{main_server}/api/v1/sessions", email: params[:email], password: params[:password])
	    @results = JSON.parse(@results)
	    if @results["state"]
	    	@error = false
	    	@message = @results["message"]
	      session[:api_user] = @results["user"]
	      @redirect_to = if session[:api_user]["droplet"]
          "http://#{session[:api_user]["droplet"]["domain"]}/members/#{session["api_user"]["id"]}?token=#{session[:api_user]["api_key"]}"
        else
          "#{main_server}/members/#{session[:api_user]["id"]}?token=#{session[:api_user]["api_key"]}"
	      end
	    else
	      @error = true;
	    	@message = @results["message"]
	    end
	  rescue
      @error = true
      @message = "Main Server down"
	  end
  end
end