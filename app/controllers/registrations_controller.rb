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
      redirect_to root_path, notice: 'Successfully'
    else
      render :new
    end
  end
end