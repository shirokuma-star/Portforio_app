class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
		@micropost = Micropost.find(@user.id)
	end
	
	def new
		@user = User.new(params[:id])
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "ようこそ、ポートフォリオの森へ"
			redirect_to all_path
		else
			render 'new'
		end
	end
	
	def all
		@users = User.all
	end
	
	private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
end
