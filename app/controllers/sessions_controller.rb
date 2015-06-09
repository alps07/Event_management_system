class SessionsController < ApplicationController
  def new
  end

  def create
  	# fail
  	user = User.authenticate(params[:session][:email], params[:session][:password])

  	if user.nil?
  		flash[:error] = "Invalid email/password combination."
  		redirect_to :controller => "users", :action => "new"
  	else
  		sign_in user
  		redirect_to user
  		# redirect_to user
  	end

  end

  def destroy
  	sign_out
  	redirect_to signin_path
  end

end