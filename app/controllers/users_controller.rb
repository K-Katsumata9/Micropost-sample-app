class UsersController < ApplicationController
  def show
	# => app/views/users/show_html.erb
		@user = User.find(params[:id])
  end
	def new
		@user = User.new
  end
	def create
		@user = User.new(user_params)
		if @user.save
			# Success
			log_in @user
			remember @user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to "/users/#{@user.id}" 
			# = redirect_to user_path(user.id)
			# = redirect_to user_path(user)
			# = redirect_to user
		else
			render  "new"
		end
  end
	def user_params
		params.require(:user).permit(
			:name, :email, :password, 
			:password_confirmation)
	end
end 