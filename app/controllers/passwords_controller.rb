class PasswordsController < ApplicationController

	def create
		begin
			@results = RestClient.post("#{main_server}/api/v1/passwords", email: params[:email])
			@results = JSON.parse(@results)
			if @results["state"]
				@error = false
				@message = @results["message"]
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