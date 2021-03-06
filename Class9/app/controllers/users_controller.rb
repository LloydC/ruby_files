class UsersController < ApplicationController
  
  	def new
  		@user = User.new
  	end

  	def create
  		@user = User.new(user_params)
			if @user.save
			flash[:notice] = "Welcome to the site!"
			session[:user_id] = @user.id
			redirect_to user_path @user
			else
			flash[:alert] = "There was a problem creating your account. Please try again."
			redirect_to new_user_path
			end

  	end

  	def show
  	@user = User.page(params[:page])
  	end

  	private
	
	def user_params
		params.require(:user).permit(:username,:email, :password, :password_confirmation)
	end
end
