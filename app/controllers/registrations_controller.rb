class RegistrationsController < ApplicationController

  def new
    @user = {"id"=>nil, "email"=>"", "created_at"=>nil, "updated_at"=>nil, "shareable_token"=>nil, "is_active"=>false, "api_key"=>nil}
    @errors = {}
  end

  def create
    @results = RestClient.post("#{main_server}/api/v1/members", {user: params[:user]})
	  @results = JSON.parse(@results)
	  @user = @results["user"]
	  @errors = @results["errors"]
    if @results["state"]
      # session[:droplet] = @results["user"]["droplet"]["id"] rescue nil
      Subscribe.notify_create_account(@user["email"]).deliver_now
      redirect_to @results["redirect_url"], notice: 'Successfully'
    else
      render :new
    end
  end

  def building_droplet
    if session[:droplet].nil?
      redirect_to sign_up_path and return
    end
  end

  def checking_droplet
    @results = RestClient.get("#{main_server}/api/v1/droplets/#{params[:id]}")
    @results = JSON.parse(@results)
    if @results["status"].eql?('done')
      session[:droplet] = nil
    end 
    render json: @results
  end
end