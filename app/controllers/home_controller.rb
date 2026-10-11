class HomeController < ApplicationController
  before_action :require_login

  def index
    # ユーザーの思い出を作品情報とともに取得し、作成日の降順（新しい順）で並べ替える
    @memories = current_user.memories.includes(:work).order(created_at: :desc)
  end
end