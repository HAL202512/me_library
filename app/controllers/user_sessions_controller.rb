class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  
  def new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to root_path, notice: "ログインしました"
    else
      flash.now[:alert] = "メールアドレスまたはパスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to new_user_session_path, notice: "ログアウトしました"
  end
end