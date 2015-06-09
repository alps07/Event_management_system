class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save 
			sign_in(@user)
			redirect_to @user, notice: 'User was successfully created!'
		else
			render action: 'new'
		end
	end

	def show 
		@user = User.find(session[:user_id])
		puts @user.state
		@events = Event.all.where(state: @user.state)
		@other_sate_events = Event.all.where.not(state: @user.state)
		#puts @other_sate_events["user_id"]
	end

	def edit
	  	@user = User.find(session[:user_id].to_i)
	  	render '/users/edit'
  	end

  	def update
  		@user = User.find(session[:user_id])
  		if @user.update(first_name: params[:first_name], last_name: params[:last_name], 
  					email: params[:email], city: params[:city], state: params[:state])
  			redirect_to '/sessions/', notice: "successfully updated!"
  		else
  			flash[:errors] = @user.errors.full_messages
  			redirect_to "/users/edit"
  		end
  end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :city,
									 :state, :password, :password_confirmation )
	end
end
