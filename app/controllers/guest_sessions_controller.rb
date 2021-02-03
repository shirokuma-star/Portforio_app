class GuestSessionsController < ApplicationController
	# skip_before_action :login_required

  def create
    user = User.find_by(email: 'example@railstutorial.org')
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    flash[:warning] = 'よろしくお願いします！'
    redirect_to all_path
  end
end
