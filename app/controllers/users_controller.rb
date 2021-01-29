class UsersController < ApplicationController
	
	def new
	end
	
	def all
		@users = User.all
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def create
		# @user = User.new(user_params)
		if true
			flash[:success] = "ようこそ、ポートフォリオの森へ"
			redirect_to all_path
		else
			render 'new'
		end
	end
	
	private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
end
