class UsersController < ApplicationController
	before_action :logged_in_user, only: [:all, :show]
	before_action :correct_user,   only: [:show]
	
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
		@users = User.paginate(page: params[:page])
	end
	
	private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
    
    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to root_url
      end
    end
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = "閲覧権限がありません"
        redirect_to all_path
      end
    end
    
end
